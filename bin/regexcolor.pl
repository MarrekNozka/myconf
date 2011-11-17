#!/usr/bin/perl 
# Soubor:  regexcolor.pl
# Datum:   06/2010
# Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
# Licence: GNU/GPL 
# Úloha:   obarví regulární výrazy a vypíše na stdout
# 

use locale;
use Term::ANSIColor;
use strict;
use vars qw(%colors);

# uložím si barvičky a regulární výrazy do hashe
while ( my $arg = shift ) {
    my $regex = $arg;
    my $color = shift;
    unless ($regex and $color) {
        print "Colorized regular expressions\n";
        print "Syntax:\n\tcoloregex regex color rexex color ...\n";
        print "Use:\n";
        print "\tcat file.log | coloregex '^regex[acd]+' 'bold blue on_white' | less -r\n\n";
        print "The recognized attributes are:\nclear, reset, dark, bold, underline, underscore, blink, reverse, concealed,\nblack, red, green, yellow, blue, magenta, cyan, white,\n on_black, on_red, on_green, on_yellow, on_blue, on_magenta, on_cyan, and on_white\n";
        exit(1);
    } else {
        $colors{$regex}=$color;
    }
}

# přidám ke každému regulátnímu výrazu barvičku 
while (my $line = <>) {
    foreach my $regex (keys(%colors)) {
        my $begin=color($colors{$regex});
        my $end=color('reset');
        $line =~ s/($regex)/$begin$1$end/g;
    }
    print $line;
}

exit(0);
