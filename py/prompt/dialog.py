from prompt_toolkit.shortcuts import message_dialog, input_dialog, yes_no_dialog

message_dialog(
    title='Example dialog window',
    text='Do you want to continue?\nPress ENTER to quit.').run()
text = input_dialog(
    title='Input dialog example',
    text='Please type your name:').run()
print(text)
result = yes_no_dialog(
    title='Yes/No dialog example',
    text='Do you want to confirm?').run()
print(result)

