from prompt_toolkit import prompt

from prompt_toolkit import __version__ as ptk_version
PTK3 = ptk_version.startswith('3.')
print(ptk_version)

# text = prompt('Give me some input: ')
# print('You said: %s' % text)

# from prompt_toolkit.shortcuts import input_dialog
# result = input_dialog(title='firstdialog', text='input sth:').run()
# print(result)

from prompt_toolkit import print_formatted_text, HTML
print_formatted_text('hello world')

print_formatted_text(HTML('<b>This is bold</b>'))
print_formatted_text(HTML('<i>This is italic</i>'))
print_formatted_text(HTML('<u>This is underlined</u>'))

# Colors from the ANSI palette.
print_formatted_text(HTML('<ansired>This is red</ansired>'))
print_formatted_text(HTML('<ansigreen>This is green</ansigreen>'))

# Named colors (256 color palette, or true color, depending on the output).
print_formatted_text(HTML('<skyblue>This is sky blue</skyblue>'))
print_formatted_text(HTML('<seagreen>This is sea green</seagreen>'))
print_formatted_text(HTML('<violet>This is violet</violet>'))

print_formatted_text(HTML('<aaa fg="ansiwhite" bg="ansigreen">White on green</aaa>'))

from prompt_toolkit.styles import Style

style = Style.from_dict({
    'aaa': '#ff0066',
    'bbb': '#44ff00 italic',
})

print_formatted_text(HTML('<aaa>Hello</aaa> <bbb>world</bbb>!'), style=style)

print(__file__)

