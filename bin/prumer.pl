#!/usr/bin/perl -w 
# Soubor:  prumer.pl
# Datum:   27.04.2011 07:20
# Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
# Licence: GNU/GPL 
# Úloha: 
# Popis:   
# 

use locale;
use utf8;
use encoding 'utf8';

use strict;
use vars qw();

my $suma;
map($suma += $_,@ARGV);

print $suma/@ARGV , "\n";
