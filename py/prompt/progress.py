from prompt_toolkit.shortcuts import ProgressBar
import time


with ProgressBar() as pb:
    for i in pb(range(800)):
        time.sleep(.01)

