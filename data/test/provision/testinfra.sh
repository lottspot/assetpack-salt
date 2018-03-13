#!/bin/sh

set -e

testinfra_script=/vagrant/test/validate.py

python -c 'import testinfra' || pip install testinfra
python $testinfra_script
