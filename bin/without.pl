#!/usr/bin/perl -w 
# Soubor:  without.pl
# Datum:   09.06.2012 15:36
# Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
# Licence: GNU/GPL 
# Úloha:   zbaví jméno souboru přípony
# 

use locale;

use strict;
use vars qw();

if ($ARGV[0] =~ m/^(.+)\.([^\/]+)$/ ) {
    print $1 ;
} else {
    print $ARGV[0] ;
}
print "\n";
