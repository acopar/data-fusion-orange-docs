#!/bin/bash
sudo apt-get update
sudo apt-get install git python-pip python-virtualenv python3-dev python3-numpy python3-scipy python3-matplotlib ipython3-notebook libxml2-dev zlib1g-dev python3-pyqt4 python-qt4-dev python3-sip-dev libqt4-dev libgraphviz-dev

mkdir orange3env
virtualenv -p python3 --system-site-packages orange3env
source orange3env/bin/activate

git clone https://github.com/biolab/orange3
cd orange3
pip install -r requirements.txt
pip install -r requirements-gui.txt
python setup.py develop
pip install Orange-Bioinformatics networkx python-igraph

python -m Orange.canvas
