#!/bin/sh

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  && 
brew tap homebrew/science &&
brew install makedepend git python3 gcc suite-sparse swig qt &&

pip3 install virtualenv &&
virtualenv -p python3 orange3env &&
source orange3env/bin/activate &&

git clone https://github.com/biolab/orange3 &&
cd orange3 &&
pip install numpy &&
pip install -r requirements.txt &&
pip install -r requirements-gui.txt &&
python setup.py develop &&
pip install ipython[all] Orange-Bioinformatics networkx python-igraph matplotlib

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

python -m Orange.canvas
