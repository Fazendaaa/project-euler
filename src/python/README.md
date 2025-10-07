# System packages required

- graphviz

curl -fsSL https://pyenv.run | bash
pyenv install 3.12.4
poetry env use 3.12.4
poetry add --dev memray=="1.10.0" pytest-memray=="1.5.0"