import gzip
import os
import re
import sys
import time
import unicodedata

from ruaccent import RUAccent

# ruaccent.py поменять и дополнить:
# self_normalize_seq="[^a-zA-Z0-9\sа-яА-ЯёЁ—–.,!?:;""'‘’(){}\[\]«»„“”\\\`_~@#$%^&*=/-]"
# self.normalize = re.compile(fr"{self_normalize_seq}")

# Начало отсчета времени
start_time = time.time()

# Параметры по умолчанию
use_dictionary = True
custom_dict = {}
device = "CPU"
model_name = 'turbo3.1'
max_length = 1024  # размер чанка
seps_priority = ['. ', '! ', '? ', '... ', '; ', ': ', ', ', ' ']  # приоритет сепараторов для чанков
show_status = 1  # вывод статуса при обработке файла (выключен для stdin)
plused = 0       # 0 = ста́вить ударе́ния, 1 = ст+авить удар+ения
save_accent = 1  # восстанавливать ударения из исходного текста
see_no_error = 1 # если включено, то ошибочные слова восстанавливаются из оригинала и сама ошибка не будет видна в файле errata.txt
cpus = "32"      # Установите это значение в соответствии с вашим оборудованием

pat_plus = "[^а-яА-ЯёЁ+]+"
pat_acc = "[^а-яА-ЯёЁ\u0301]+"

# ANSI escape codes для цветного вывода
GREEN = '\033[92m'
YELLOW = '\033[93m'
RESET = '\033[0m'
os.environ['OMP_NUM_THREADS'] = cpus
os.environ['MKL_NUM_THREADS'] = cpus

# Функция для загрузки custom_dict из файлов dic.gz со строками вида _слово=сло'во
def load_custom_dict(*file_paths):
    custom_dict = {}
    for file_path in file_paths:
        with gzip.open(file_path, 'rt', encoding='utf-8') as f:
            for lin in f:
                lin = lin.strip()
                if '=' in lin:
                    wrd, accented_word = lin.split('=')
                    wrd = wrd.lstrip('_')
                    if sum(1 for c in wrd if c in 'аеёиоуыэюяАЕЁИОУЫЭЮЯ') > 1:
                        custom_dict[wrd] = convert_accent(accented_word, "apostrophe_to_plus")
    return custom_dict

# Универсальная функция для преобразования ударений
def convert_accent(text, conversion_type):
    patterns = {
        "apostrophe_to_plus": (r"([аеёиоуыэюяАЕЁИОУЫЭЮЯ])'", r"+\1"),
        "accent_to_plus": (r"([аеёиоуыэюяАЕЁИОУЫЭЮЯ])\u0301", r"+\1"),
        "plus_to_accent": (r"\+([аеёиоуыэюяАЕЁИОУЫЭЮЯ])", r"\1" + "\u0301")
    }

    if conversion_type in patterns:
        pattern, replacement = patterns[conversion_type]
        return re.sub(pattern, replacement, text)

    return text

# Функция patsplit для разделения строки на слова и сепараторы
def patsplit(string, seps_pattern):
    words = re.split(seps_pattern, string)
    seps = re.findall(seps_pattern, string)
    if words and len(words[0]) == 0:
        del words[0]

#   print(words, len(words))
#   print(seps, len(seps))
    return words, seps

# Функция для разбиения длинных строк
def split_long_line(lin):

    if len(lin) <= max_length:
        return [lin]

    parts = []
    while len(lin) > max_length:
        split_pos = -1
        for punct in seps_priority:
            pos = lin.rfind(punct, 0, max_length)
            if pos != -1:
                split_pos = pos
                break

        if split_pos == -1:
            split_pos = max_length

        parts.append(lin[:split_pos + 1].strip())
        lin = lin[split_pos + 1:].strip()

    if lin:
        parts.append(lin)

    return parts

def clean_word(wrd):
    # Убираем ударение (комбинирующий символ \u0301) и заменяем ё на е, Ё на Е
    word_cleaned = wrd.replace('ё', 'е').replace('Ё', 'Е')
    # Убираем комбинирующие символы (ударения)
    word_cleaned = ''.join([char for char in unicodedata.normalize('NFD', word_cleaned) if unicodedata.category(char) != 'Mn'])
    return word_cleaned

# Обработка аргументов командной строки
if '-nodic' in sys.argv:
    use_dictionary = False
if '-cust' in sys.argv:
    cust_index = sys.argv.index('-cust') + 1
    if cust_index < len(sys.argv):
        custom_dict = load_custom_dict(sys.argv[cust_index])
if '-gpu' in sys.argv:
    device = "CUDA"
if '-plus' in sys.argv:
    plused = 1
if '-nosave' in sys.argv:
    save_accent = 0

# Удаление файла errata.txt перед началом обработки
errata_file_path = "errata.txt"
if os.path.exists(errata_file_path):
    os.remove(errata_file_path)

# Инициализация модели с custom_dict
line_pattern = pat_plus if plused == 1 else pat_acc

accentizer = RUAccent()
accentizer.load(omograph_model_size=model_name, use_dictionary=use_dictionary, custom_dict=custom_dict, device=device, tiny_mode=False)

# Чтение текста из файла или stdin
if len(sys.argv) > 1 and sys.argv[-1] not in ['-dic', '-nodic', '-cust', '-cpu', '-gpu', '-plus', '-nosave']:
    filename = sys.argv[-1]
    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()
else:
    lines = sys.stdin.read().splitlines()
    show_status = 0

total_lines = len(lines)

# Обработка текста построчно
for line_num, line in enumerate(lines, start=1):
    line = line.strip()
#   line = convert_accent(line, "plus_to_accent") # Оверкил
    if plused == 1:
        line = convert_accent(line, "accent_to_plus")
        words_orig, seps_orig = patsplit(line, pat_plus)
        acc_seq = "\+"
    else:
        words_orig, seps_orig = patsplit(line, pat_acc)
        line = convert_accent(line, "accent_to_plus")
        acc_seq = "\u0301"

    # Чистка тэтов и замены…
    line = re.sub(r'<[^>]+>|…', lambda m: '...' if m.group(0) == '…' else '', line)

    chunks = split_long_line(line)

    # Отправляем текст на обработку
    proc_chunks = [accentizer.process_all(chunk) for chunk in chunks]

    # Собираем строку для повторного разбиения
    proc_line = ' '.join(proc_chunks)
    # Чистим от всего, оставляя только слова
    proc_line = re.sub(f'^{pat_plus}', ' ', proc_line)

    # Преобразование акцентов обратно
    if plused != 1:
        proc_line = convert_accent(proc_line.strip(), "plus_to_accent")

    proc_words, proc_seps = patsplit(proc_line, line_pattern)

    # Корректировка длин массивов сепараторов и слов
    if len(seps_orig) - len(proc_words) == 1:
        proc_words.append('')
    if len(seps_orig) - len(proc_words) == -1:
        seps_orig.insert(0, '')

    # Восстановление исходных ударений из первичной строки
    line_error = 0
    if save_accent == 1:
        for i, word in enumerate(words_orig):
            # Очищаем оригинальное слово
            clean_orig_word = clean_word(word)
            if i < len(proc_words):
                clean_proc_word = clean_word(proc_words[i])
            else:
                clean_proc_word = "[NOENTRY]"
                proc_words.append('')

            # Сравниваем очищенные слова
            if clean_orig_word != clean_proc_word:
                line_error = 1
                if see_no_error:
                    proc_words[i] = word

            # Если исходное слово содержит ударение, восстанавливаем его в обработанном тексте
            if re.search(fr"{acc_seq}", word):
                proc_words[i] = word

    final_line = ''.join([sep + word for sep, word in zip(seps_orig, proc_words)])

    if line_error:
        with open(errata_file_path, "a", encoding="utf-8") as errata_file:
            errata_file.write(f"<line: {line_num}> {line}\n")
            if not see_no_error:
                errata_file.write(f"<out : {line_num}> {final_line}\n")

    # Вывод строки
    sys.stdout.write(final_line + '\n')
    sys.stdout.flush()

    # Статус обработки -- только при обработке файла, но не потока
    if show_status:
        elapsed_time = time.time() - start_time
        sys.stderr.write(f"\r{GREEN}Запуск:{RESET} {YELLOW}{time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(start_time))}{RESET} "
                         f"{GREEN}Прошло:{RESET} {YELLOW}{int(elapsed_time // 3600):02}:{int((elapsed_time % 3600) // 60):02}:{int(elapsed_time % 60):02}{RESET} "
                         f"{GREEN}Текущая строка:{RESET} {YELLOW}{line_num}{RESET} {GREEN}из{RESET} {YELLOW}{total_lines}{RESET} ")
        sys.stderr.flush()

# Финальная строка после завершения обработки
elapsed_time = time.time() - start_time
sys.stderr.write(f"\r"
                 f"\r{GREEN}Запуск:{RESET} {YELLOW}{time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(start_time))}{RESET} "
                 f"{GREEN}Обработка:{RESET} {YELLOW}{int(elapsed_time // 3600):02}:{int((elapsed_time % 3600) // 60):02}:{int(elapsed_time % 60):02}{RESET} "
                 f"{GREEN}Всего строк:{RESET} {YELLOW}{line_num}{RESET}".ljust(80) + "\n")
