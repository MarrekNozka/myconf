#!/usr/bin/env python
# -*- coding: utf8 -*-
# Soubor:  i3ssh.py
# Datum:   13.04.2017 09:42
# Autor:   Marek Nožka, marek <@t> tlapicka <d.t> net
# Licence: GNU/GPL
# Úloha:   i3 ssh spouštěč
####################################################
from tkinter import *

####################################################
# Definice funkcí
def exit(event=None):
    sys.exit(0)


####################################################
# Definice GUI

mainWin = Tk(className="foo")
mainWin.title("i3ssh.py")
mainWin.option_add('*Font', 'Terminus 14')
mainWin.bind("<Escape>", exit)

lbl = Label(mainWin, text=u"Ahoj světe!")
lbl.pack()

####################################################
# Nekonečná smyčka
mainWin.mainloop()
