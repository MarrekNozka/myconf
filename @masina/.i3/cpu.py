#!/usr/bin/env python3
# Soubor:  cpu.py
# Datum:   06.04.2017 18:40
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL
# Úloha:
# http://www.utf8-chartable.de/unicode-utf8-table.pl?start=9472&unicodeinhtml=dec
############################################################################
from subprocess import check_output
from lockfile import LockFile
from sys import argv
import os
############################################################################
fname = '/run/shm/cpu_graph'
os.environ['LC_ALL'] = "C"
graph_chars = " ▁▃▄▅▆▇█"

if len(argv) > 1:
    secs = argv[1]
else:
    secs = "1"
if len(argv) > 2:
    warn = int(argv[2])
else:
    warn = 50
if len(argv) > 3:
    crit = int(argv[3])
else:
    crit = 80

mpstat = check_output(["mpstat", secs, "1"]).decode("utf8").splitlines()

for line in mpstat:
    if "idle" in line:
        title = line.split()
        break
data = mpstat[-1].split()

for i, t in enumerate(title):
    if "usr" in t:
        usr = int(float(data[i]))
    if "sys" in t:
        sys = int(float(data[i]))
    if "idle" in t:
        idle = int(float(data[i]))
a = usr + sys
b = 100 - idle
bar = graph_chars[int(b * 7.99 / 100)]


with LockFile(fname):
    if os.path.isfile(fname):
        with open(fname, 'r') as f:
            graph = f.readline()[:-1]
    else:
        graph = ""

    graph = graph + bar

    with open(fname, 'w') as f:
        f.write(graph[-5:] + '\n')

print("{}% {} {}%".format(a, graph, b))
print("{}% {} {}%".format(a, graph[-2:], b))

if b >= crit:
    print("#FF0000")
    exit(33)
elif b >= warn:
    print("#FFFC00")
exit(0)
