#!/usr/bin/perl -w 
# Soubor:  regexcount.pl
# Datum:   06/2010
# Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
# Licence: GNU/GPL 
# Úloha:   počítá řádky s výskytem regulárního výrazu
# 

use locale;
use encoding 'utf8';
use Getopt::Std;

use strict;
use vars qw($radek %box $ex $regex %opts @boxKeys $max @bar);

my $graphwidth=30;

# h -- help
# s -- split
# g -- graph
# n -- sort as numbers
# d -- sort count downwardly
# u -- sort count upwardly 
&getopts('hsgndu',\%opts);

if ( ! $ARGV[0] or $opts{'h'}) {
    print <<EOF;
Count rows width regex
Use:
  regexcount 'my[Rr]eg.x' /var/log/any.log
or
  ...filter  | regexcount 'my[Rr]eg.x'

if use () in regex then will print only part agregate in ()
  ...filter  | regexcount 'to=\\\<([^<>]+)\\\@domain.tld'

  regexcount.pl 'GET\\s(.+)\\sHTT' /var/log/apache2/access.log | sort -nr -k2

OPTIONS
  -h   help
  -s   no count regexp but count elements which split regexp
  -g   graph
  -n   sort as numbers
  -d   sort count downwardly
  -u   sort count upwardly 
EOF
exit(1);
}

$regex=shift;

if ($opts{'s'}) {
    if ($regex eq '@') {
        $regex = '';
    }
    while ($radek=<>) {
        chomp $radek;
        my @elements = split /$regex/, $radek;
        foreach (@elements) { 
            $box{$_}++;
        }
    }
} else {
    while ($radek=<>) {
        chomp $radek;
        if ($radek =~ /($regex)/ ) {
            if ($2) {
                $box{$2}++;
            } else {
                $box{$1}++;
            }
        }
    }
}

# Sort chars or numbers?
if ($opts{'d'}) {
    @boxKeys = sort { $box{$b} <=> $box{$a} } keys(%box) ;
    $max = $boxKeys[0];
} elsif ( $opts{'u'} ) {
    @boxKeys = sort { $box{$a} <=> $box{$b} } keys(%box) ;
    $max = $boxKeys[$#boxKeys];
} elsif ( $opts{'n'} ) {
    @boxKeys = sort { $a <=> $b } keys(%box) ;
} else {
    @boxKeys = sort keys(%box) ;
}

#graph
if ($opts{'g'} and !$max) {
    $max = $boxKeys[0];
    map { $max = $box{$_} > $box{$max}? $_ : $max } @boxKeys;
}

foreach $ex (@boxKeys) {
    printf "%-14s -> %7d ","#$ex#", $box{$ex};
    if ($opts{'g'} ) {
        for ( my $i=0; $i < $graphwidth * $box{$ex}/$box{$max}; $i++) {
            print "+";
        }
    }
    print "\n";
}

exit(0);
