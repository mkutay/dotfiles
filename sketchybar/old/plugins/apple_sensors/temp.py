#!/usr/bin/env python3

import numpy as np
import sys
import subprocess
import pathlib

bin = pathlib.Path(__file__).parent.joinpath('temp_sensor').resolve()
lines = subprocess.run([bin], stdout=subprocess.PIPE).stdout.decode('utf-8').split("\n")
labels = lines[0].split(', ')
values = lines[1].split(', ')
eACC_sum = 0
pACC_sum = 0
eACC_cnt = 0
pACC_cnt = 0
for row in np.array([labels, values]).transpose():
    if row[0] == '' or row[0] == "\n": continue
    if "eACC" in row[0]:
        eACC_sum += row[1].astype('float')
        eACC_cnt += 1
    if "pACC" in row[0]:
        pACC_sum += row[1].astype('float')
        pACC_cnt += 1
    #if "eACC" in row[0] or "pACC" in row[0]:
    #    print(', '.join(row))

print(str(int(eACC_sum / eACC_cnt * 100) / 100) + " | " + str(int(pACC_sum / pACC_cnt * 100) / 100))
