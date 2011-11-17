#!/usr/bin/perl -w 
# Soubor:  skeletonVIM_FILE_NAME
# Datum:   skeletonVIM_CREATION_CZDATETIME
# Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
# Licence: GNU/GPL 
# Úloha: 
# Popis:   
# 

use locale;
use utf8;
use encoding 'utf8';

use strict;
#use subs qw( );
use vars qw();

use CGI qw(:standard);

# root www stranek
$root="/~nozka";

sub najdi_adresare {
    $ENV{'SCRIPT_FILENAME'} =~ /(.+)\/[^\/]+$/;
    my $adresar = $1 . "/";
    $ENV{'SCRIPT_NAME'} =~ /.*$root(.+)$/;
    my $clanek = $1;
    $ENV{'SCRIPT_FILENAME'} =~ /(.+)$clanek$/;
    my $rootadresar = $1;
    
   return($rootadresar,$adresar,$clanek);
}


# tlavicka
# tiskne hlavicku xhtml stránky. Jako parametu bere titulek
# &halvicka("Titulek");
sub hlavicka {
    if ($ENV{'HTTP_ACCEPT'} =~ /application\/xhtml\+xml/) {
        print "content-type:application/xhtml+xml; charset=utf-8\n\n";
    } else {
        print "content-type:text/html; charset=utf-8\n\n";
    }
    my ($title)=@_;
    print <<EOF;
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cs">
<head>
   <meta http-equiv="Content-Type" content="application/xhtml+xml; charset=UTF-8" />
   <meta name="Author" content="Marek Nožka" />
   <meta name="Generator" content="Vim,Perl" />
   <link rel="StyleSheet" type="text/css" href="$root/styles.pl" />
   <link rel="StyleSheet" type="text/css" href="$root/dstyles.css" />
   <link rel="StyleSheet" type="text/css" href="$root/highlight.css" />
   <!-- link rel="StyleSheet" type="text/css" href="local.css" / -->
   <link rel="shortcut icon" href="$root/graphics/mamut-ikona.png" type="image/png" />
   <title>$title</title>
   <meta name="Keywords" content="vyuka,VOŠě a SPŠE Olomouc, $title" />
    <script type="text/javascript" src="$root/coee.js"></script>
    <script type="text/javascript" src="$root/jeee.js"></script>
</head>
<body><div id="telo">
EOF
    print "\n\n";
}

sub navigace {
    print <<EOF;
<div id="navigace"> 
<h1><a href="$root/">~Nožka</a></h1>
<div id="menu">
    <form id="hledani" method="get" action="http://www.google.com/search"><dl>
        <dt><a href="#menu">Hledat na těchto stránkách</a></dt>
        <dd><input type="text" name="q" alt="hledání - text" size="10" maxlength="255" />
            <input type="submit" name="Hledat" value="Hledat" alt="zahájit hledání" />
            <input type="hidden" name="sitesearch" value="hroch.spseol.cz/~nozka" />
            <input type="hidden" name="hl" value="cs" />
        </dd>
    </dl></form>
    <dl>
        <dt><a href="#menu">Od jinud:</a></dt> 
        <dd><strong><a href="http://tlapicka.net">Můj pokus o bLog</a></strong></dd>
        <dd><strong><a href="http://foto.tlapicka.net">foto.tlapicka.net</a></strong></dd>
        <dd><strong><a href="http://www.youtube.com/user/YouTlapickaTube">Můj kanál na YouTube</a></strong></dd>
        <dd><strong><a href="http://mamut.spseol.cz">Mamut.spseol.cz</a></strong></dd>
        <dd><strong><a href="http://cs.wikibooks.org/wiki/User:Tlapicka">Wikiknihař:Tlapička</a></strong></dd>
        <dd><strong><a href="http://cs.wikipedia.org/wiki/Wikipedista:Tlapicka">Wikipedista:Tlapicka</a></strong></dd>
    </dl>
    <dl>
        <dt><a href="#menu">Návody:</a></dt> 
        <dd><strong><a href="$root/#domaciprace">Jak odevzdávat domácí práce</a></strong></dd>
        <dd><strong><a href="$root/hroch">Jak se chytá Hroch?</a></strong></dd>
    </dl>
    <dl id="vyuka">
        <dt><a href="#menu">Výuka:</a></dt> 
        <dd><strong><a href="$root/c/#vyuka">Céčko</a></strong></dd>
        <dd><strong><a href="$root/elektro/#vyuka">Elektro(tech)?nika</a></strong></dd>
        <dd><strong><a href="$root/html-css/#vyuka">HTML a CSS</a></strong></dd>
        <dd><strong><a href="$root/pascal/#vyuka">Pascal a Delphi</a></strong></dd>
        <dd><strong><a href="$root/site/#vyuka">Sítě a Linux -- Linux a sítě</a></strong></dd>
        <dd><strong><a href="$root/latex/#vyuka">TeX a LaTeX</a></strong></dd>
        <dd><strong><a href="$root/testy/#vyuka">Testy</a></strong></dd>
        <dd><strong><a href="$root/wiki">moje Wiki</a></strong></dd>
    </dl>
</div> </div>
EOF
    #my ($adresar) = @_;
    print <<EOF;
<div id="obsah">
EOF
}

sub obsah {
#print <<EOF;
#<p><a href="http://www.adopcenablizko.cz/"><img style="float:left;"
#src="http://mladez.sdb.cz/res/data/493/055020_03_379858.gif" alt="Adopce na
#blízko"/></a></p>
#EOF
    my ($adresar) = @_;
    #print p($ENV{'SCRIPT_FILENAME'}); print p($ENV{'SCRIPT_NAME'});
    #&vypis_promenne();
    #print $adresar;
    if ( -f "$adresar/kontext.menu" ) {
        &vypis_soubor("$adresar/kontext.menu");
    }
    opendir (ADRESAR,$adresar) ;
    my @soubory = sort(readdir(ADRESAR));
    my ($soubor);
    foreach $soubor (@soubory) {
        if ( $soubor =~ /\.xhtml$/ ) {
            &vypis_soubor("$adresar$soubor");
            print p( {class=>'odkaznamenu'},a({href=>'#menu',title=>'Hop! Nahoru ! Na menu!'},'| navigace |')) , "\n";
        }
    }
    closedir(ADRESAR);
}


sub paticka {
    print <<EOF;
</div>
<div id="paticka"> 
<p id="power">
    <a href="$root/nofacebook/"><img src="$root/nofacebook/no-facebook-mini.png" alt="No Facebook" width="30" height="31"/></a>
    <a href="http://validator.w3.org/check?uri=referer"> <img src="$root/graphics/xhtml11.png" alt="Valid XHTML 1.1" height="31" width="88" /></a>
    <a href="http://jigsaw.w3.org/css-validator/"> <img style="border:0;width:88px;height:31px" src="$root/graphics/css.png" alt="Valid CSS!" /></a>
    <a href="http://debian.org"><img src="$root/graphics/debian-powered.png" alt="Powered by Debian GNU/Linux" width="88" height="30"/></a>
    <a href="http://apache.org"><img src="$root/graphics/apache_pb.gif" alt="Powered by Apache" width="259" height="32"/></a>
    <a href="http://perl.org"><img src="$root/graphics/powered_perl.png" alt="Powered by Perl" width="100" height="31"/></a>
</p>
</div>
</div></body>
</html>
EOF
}
