from pathlib import Path

print(Path(__file__))
path = Path(__file__).absolute().parent.joinpath('config/logging.yaml')
print(path)

