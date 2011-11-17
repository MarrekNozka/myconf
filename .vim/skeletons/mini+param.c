/*
 * Soubor:  skeletonVIM_FILE_NAME
 * Datum:   skeletonVIM_CREATION_CZDATETIME
 * Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
 * Licence: GNU/GPL 
 * Úloha: 
 * Popis:   
 ****************************************************/
#define _ISOC99_SOURCE
#define _GNU_SOURCE
#include <stdio.h>
#include <stdbool.h>

/* ***************    Makra    ******************** */
#define ARREYC 1024

/* ***************   Funkce    ******************** */


/****************************************************
 *               Hlavní program.
 ****************************************************/
int main(int argc, char *argv[])
    int cislo;
    
    if (argc >=2 ) {
        if ( sscanf(argv[1],"%d", &cislo) != 1 ) {
            puts("ERROR: chybně zadaný parametr");
            return 1;
        }
    } else {
        if ( scanf("%d", &cislo) != 1 ) {
            puts("ERROR: chybně zadaný vstup");
            return 1;
        }
    }

    return 0;
}
