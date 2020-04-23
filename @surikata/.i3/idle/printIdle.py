#!/usr/bin/env python3
# Soubor:  printIdle.py
# Datum:   05.01.2020 13:04
# Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL
# Úloha:
############################################################################
from ctypes import CDLL

libIdle = CDLL("./libidle.so")

# call C function to check connection
libIdle.connect()
print(libIdle.getIdle())
