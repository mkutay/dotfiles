#!/usr/bin/env python3

import numpy as np
import sys
import subprocess
import pathlib

bin = pathlib.Path(__file__).parent.joinpath('temp_sensor').resolve()
lines = subprocess.run([bin], stdout=subprocess.PIPE).stdout.decode('utf-8').split("\n")
labels = lines[0].split(', ')
values = lines[1].split(', ')
for row in np.array([labels, values]).transpose():
    if row[0] == '' or row[0] == "\n" or row[1].astype('float') < 40: continue
    print(', '.join(row))
