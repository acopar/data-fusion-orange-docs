#!/bin/bash

p=$PWD
sudo apt-get update
sudo apt-get -y install git python-pip python-virtualenv python3-dev python3-numpy python3-scipy python3-matplotlib ipython3-notebook libxml2-dev zlib1g-dev python3-pyqt4 python-qt4-dev python3-sip-dev libqt4-dev libgraphviz-dev

virtualenv -p python3 --system-site-packages orange3env
source orange3env/bin/activate

echo "/usr/lib/python3/dist-packages/" > "orange3env/lib/python3.4/site-packages/0.pth"
pip install --upgrade numpy

git clone https://github.com/biolab/orange3
cd orange3
pip install -r requirements.txt
pip install -r requirements-gui.txt
python setup.py develop
cd ..
git clone https://github.com/BlazZupan/orange3-datafusion
cd orange3-datafusion
python setup.py develop

python -m Orange.canvas
