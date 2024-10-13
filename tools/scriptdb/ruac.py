import sys
import re
import gzip
import time
from ruaccent import RUAccent

# Начать отсчёт времени
start_time = time.time()

# Параметры по умолчанию
use_dictionary = True
custom_dict = {}
device = "CPU"
model_name = 'turbo3.1'
chunk_length = 1024       # размер чанка, на которые бить строки
seps_list = ['. ', '! ', '? ', '... ', '…', '; ', ': ', ', ', ' '] # приоритет сепараторов для чанков
show_status = 1     # статус при обработке файла (выключен для потока)
plused = 0          # 0 = ста́вить ударе́ния, 1 = ст+авить удар+ения

pat_plus = "[^а-яА-ЯёЁ+-]+"
pat_acc  = "[^а-яА-ЯёЁ\u0301-]+"

if plused == 1:
    line_pattern = pat_plus
else:
    line_pattern = pat_acc


# ANSI escape codes для цветного вывода
GREEN = '\033[92m'
YELLOW = '\033[93m'
RESET = '\033[0m'

# Функция для преобразования ударения с апострофа на "+"
def conv_apos2plus(text_with_apostrophe):
    match = re.search(r"([аеёиоуыэюяАЕЁИОУЫЭЮЯ])'", text_with_apostrophe)
    if match:
        apostrophed_word = re.sub(r"([аеёиоуыэюяАЕЁИОУЫЭЮЯ])'", r'+\1', text_with_apostrophe)
        return apostrophed_word
    return text_with_apostrophe

# Функция для преобразования ударения с u0301 на "+"
def conv_acc2plus(text_with_accent):
    match = re.search(r"([аеёиоуыэюяАЕЁИОУЫЭЮЯ])\u0301", text_with_accent)
    if match:
        plused_text = re.sub(r"([аеёиоуыэюяАЕЁИОУЫЭЮЯ])\u0301", r'+\1', text_with_accent)
        return plused_text
    return text_with_accent

# Функция для преобразования плюса в ударение
def conv_plus2acc(text_with_plus):
    match = re.search(r"\+([аеёиоуыэюяАЕЁИОУЫЭЮЯ])", text_with_plus)
    if match:
        acc_text = re.sub(r'\+([аеёиоуыэюяАЕЁИОУЫЭЮЯ])', r'\1' + '\u0301', text_with_plus)
        return acc_text
    return text_with_plus

# Функция для обработки текста с акцентами
def do_text_chunk(text_chunk):
    plused_text = accentizer.process_all(text_chunk)
    return plused_text

# Функция для загрузки custom_dict из нескольких файлов dic.gz со строками вида _слово= сло'во
def load_custom_dict(*file_paths):
    custom_dict = {}
    for file_path in file_paths:
        with gzip.open(file_path, 'rt', encoding='utf-8') as f:
            for line in f:
                line = line.strip()
                if '=' in line:
                    word, accented_word = line.split('=')
                    word = word.lstrip('_')
                    if sum(1 for c in word if c in 'аеёиоуыэюяАЕЁИОУЫЭЮЯ') > 1:
                        plused_word = conv_apos2plus(accented_word)
                        custom_dict[word] = plused_word
    return custom_dict

# Функция patsplit
def patsplit(string, seps_pattern):
    # Разделяем на слова и сепараторы

    array = re.split(seps_pattern, string)
    seps = re.findall(seps_pattern, string)
    if array and len(array[0]) > 1:
        seps = [''] + seps
    return array, seps

# Функция для разбиения длинных строк
def split_long_line(line, max_length=chunk_length, seps_list=seps_list):
    if len(line) <= max_length:
        return [line]

    parts = []
    while len(line) > max_length:
        # Поиск позиции последнего разделителя
        split_pos = -1
        for punct in seps_list:
            pos = line.rfind(punct, 0, max_length)
            split_pos = max(split_pos, pos)

        # Если не найден ни один разделитель
        if split_pos == -1:
            split_pos = max_length

        # Добавляем чанк в список
        parts.append(line[:split_pos + 1].strip())
        line = line[split_pos + 1:].strip()

    if line:
        parts.append(line)

    result = []
    for part in parts:
        # Разбиение оставшихся частей, если они всё ещё длиннее максимальной длины
        while len(part) > max_length:
            result.append(part[:max_length])
            part = part[max_length:]
        result.append(part)

    return result

# Обработка аргументов командной строки
if '-nodic' in sys.argv:
    use_dictionary = False
if '-cust' in sys.argv:
    cust_index = sys.argv.index('-cust') + 1
    if cust_index < len(sys.argv):
        custom_dict = load_custom_dict(sys.argv[cust_index])
if '-gpu' in sys.argv:
    device = "CUDA"

# Инициализация модели с custom_dict
accentizer = RUAccent()
accentizer.load(omograph_model_size=model_name, use_dictionary=use_dictionary, custom_dict=custom_dict, device=device, tiny_mode=False)

# Чтение текста из файла или из pipe
if len(sys.argv) > 1 and sys.argv[-1] not in ['-dic', '-nodic', '-cust', '-cpu', '-gpu']:
    filename = sys.argv[-1]
    with open(filename, 'r', encoding='utf-8') as f:
        lines = f.readlines()
        show_status = show_status
else:
    lines = sys.stdin.read().splitlines()  # Чтение из pipe
    show_status = 0

total_lines = len(lines)

# Обрабатываем текст строка за строкой и выводим результат
for line_num, line in enumerate(lines, start=1):
    line = line.strip()
    line = conv_plus2acc(line)
    words_orig, seps_orig = patsplit(line, pat_acc)
    line = conv_acc2plus(line)

    line = re.sub(r'<[^>]+>', '', line)
    chunks = split_long_line(line)

    proc_chunks = [do_text_chunk(chunk) for chunk in chunks]
    proc_line = ' '.join(proc_chunks)
    proc_line = re.sub(f'^{pat_plus}', ' ', proc_line)


    if plused != 1:
        proc_line = conv_plus2acc(proc_line.strip())

    proc_words, proc_seps = patsplit(proc_line, line_pattern)


    if len(seps_orig) - len(proc_words) == 1:
        proc_words = proc_words + ['']
    if len(seps_orig) - len(proc_words) == -1:
        seps_orig = [''] + seps_orig


    final_line = []
    final_line.extend([seps_orig[i] + proc_words[i] for i in range(len(proc_words))])

    sys.stdout.write(''.join(final_line) + '\n')
    sys.stdout.flush()

    # Строка состояния в stderr
    if show_status == 1:
        elapsed_time = time.time() - start_time
        sys.stderr.write(f"\r{GREEN}Запуск:{RESET} {YELLOW}{time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(start_time))}{RESET} "
                         f"{GREEN}Прошло:{RESET} {YELLOW}{int(elapsed_time // 3600):02}:{int((elapsed_time % 3600) // 60):02}:{int(elapsed_time % 60):02}{RESET} "
                         f"{GREEN}Текущая строка:{RESET} {YELLOW}{line_num}{RESET} {GREEN}из{RESET} {YELLOW}{total_lines}{RESET} ")
        sys.stderr.flush()  # Немедленный вывод строки состояния

# Финальная строка после завершения обработки в stderr
elapsed_time = time.time() - start_time
sys.stderr.write(f"\r{GREEN}Запуск:{RESET} {YELLOW}{time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(start_time))}{RESET} "
                 f"{GREEN}Обработка:{RESET} {YELLOW}{int(elapsed_time // 3600):02}:{int((elapsed_time % 3600) // 60):02}:{int(elapsed_time % 60):02}{RESET} "
                 f"{GREEN}Всего строк:{RESET} {YELLOW}{total_lines}{RESET}\n")
