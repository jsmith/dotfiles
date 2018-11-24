import sys

REPLACEMENTS = [
    (' i ', ' I '),
    (' ii ', ' II '),
    ('Intr ', 'Introduction To '),
    ('Intro ', 'Introduction To '),
    ('Biol ', 'Biology '),
    ('Appl ', 'Applications '),
    ('Prog ', 'Programming '),
    ('Comp ', 'Computer '),
    ('Computab.&', 'Computab and'),
    ('Computab ', 'Computability '),
    ('Lang.', 'Languages'),
    ('Syst.', 'Systems'),
    ('Anal.', 'Analysis'),
    ('Pro.', 'Project '),
    ('Mgmt', 'Management '),
    ('&', 'and'),
    ('Eng. ', 'Engineering '),
    ('Eng ', 'Engineering '),
    ('Prob Sol', 'Problem Solving'),
    ('Ii', 'II '),
    ('Introduc.', 'Introduction '),
    ('Calc.', 'Calculus '),
    ('Phys', 'Physics'),
    ('Engg', 'Engineers'),
    ('Tech', 'Technology'),
    ('Prob ', 'Probability '),
    ('Stat', 'Statistics'),
    ('Arch.', 'Architecture'),
    ('Pattern', 'Patterns'),
]


def get_parts(line: str):
    items = line[:11], line[18:62].strip(), line[70:80].strip()
    number, title, credit_hours = [item.strip() for item in items]
    title = title.title()
    for original, replacement in REPLACEMENTS:
        title = title.replace(original, replacement)
    return number, title, credit_hours
    

def main():
    if len(sys.argv) < 2:
        raise ValueError('Please provide path to file')
    
    path = sys.argv[1]
    with open(path) as fp:
        text = fp.read()
    
    parts = map(get_parts, text.split('\n'))
    text = ''
    for number, title, credit_hours in parts:
        text += f'{number}\t{title}\t{credit_hours}\n'

    with open(f'{path}.out', 'w') as fp:
        print(text)
        fp.write(text)

if __name__ == '__main__':
    main()
