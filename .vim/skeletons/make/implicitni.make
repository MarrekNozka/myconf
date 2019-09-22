# skeletonVIM_FILE_NAME
# Makefile: Obsah nalezen porůznu na webu a upraven. (říjen 2010)
# 	http://kvik.sh.cvut.cz/~fidlej/cecko/makefile/referat.html (Ivo Danihelka)
#   http://dce.felk.cvut.cz/por/cv1/#id2510407
#	http://www-kiv.zcu.cz/~herout/html_sbo/make/toc.htm (Jan Valášek)
#	http://www.fit.vutbr.cz/~martinek/clang/make.html (David Martinek)
#------------------------------------------------------------------------
# Datum: skeletonVIM_CREATION_CZDATETIME
# Autor: Marek Nožka, nozka <@t> spseol <d.t> cz
# Úloha: 
#------------------------------------------------------------------------
#cíl: [závislost] [závislost]
#<tab>příkazy
#                          pro každý radek se spouští nový shell
#<tab>cd neco; ./neco
#
#Automatické proměnné
#$@		jméno cíle
#$<		jméno první závislosti
#$?		jména závislostí, které jsou novější než cíl
#$^		jména všech závislostí oddělená mezerami
#
# Příklad implicitního pravidla
# %.o: %.c
#	$(CC) $(CFLAGS) $(CPPFLAGS) -c -o $@ $<
#------------------------------------------------------------------------
#Funkce pro zpracování textu
#
#Volají se podobně jako proměnné
#$(funkce argumenty)
#
#$(subst from,to,text)	substituce
#$(patsubst pattern,replacement,text)
#	% v pattern představuje lib. posloupnost znaků
#	% v replacement odpovídá této množině
#	
#	př.: $(patsubst %.c,%.o,main.c bar.c)
#$(var:pattern=replacement)
#	je ekvivalentní
#$(patsubst pattern,replacement,$(var))
#        př.: CLASSES = $(SOURCES:.java=.class)
#
#$(wildcard pattern)
#	názvy souborů odpovídají pattern, jako v shellu
#        př.: SOURCES = $(wildcard *.java)
#------------------------------------------------------------------------
# Užitečné přepínače
#
#-f soubor
#	použije se `soubor` namísto Makefile
#-n 
#	nevykonává, jen vypisuje průběh
#-p 
#	současně vypíše kompletní nastavení proměnných,
#	implicitních pravidel, ...
#------------------------------------------------------------------------
# 

## překladač
CC=gcc
## volby překladače
CFLAGS=-std=c99 -Wall -pedantic -g -lm
#CPPFLAGS=

.PHONY: all build clean again autoexe autodep

# všechna *.c zavisi na *.h
#OBJ=soubor1.o soubor2.o souborN.o
#HEAD=soubor1.h soubor2.h souborN.h
#${OBJ}: ${HEAD} # hromadné nastavení závislostí, žádná akce
#
#$(program): $(program).c
#	$(CC) $(CFLAGS) -o $(program) $(program).c
#hello:hello.c helo.h
#	gcc -Wall -o hello hello.c

###############################################

#EXE=
## Vloží proměnnou EXE
-include exe.list

###############################################
build: $(EXE)

again: clean build 

all: build 

clean:
	rm -f ./*.o
	rm -f $(EXE)

###############################################
## Generování proměnné EXE
autoexe:
	@LIST="EXE=";\
		 for i in $$(ls *.c);do LIST="$$LIST $$(basename $$i .c)"; done;\
		 echo $$LIST | tee exe.list;
###############################################
## Generování závislostí
autodep: 
	$(CC) -MM *.c >dep.list
## vloží vygenerované závislosti
-include dep.list
###############################################
