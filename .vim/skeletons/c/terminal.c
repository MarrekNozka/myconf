/*
 * Soubor:  skeletonVIM_FILE_NAME
 * Datum:   skeletonVIM_CREATION_CZDATE
 * Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
 * Licence: GNU/GPL 
 * Úloha: 
 * Popis:   
 */

#define _ISOC99_SOURCE
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <limits.h>
#include <math.h>
#include <unistd.h>

/**
 * Vytiskne na stdout text s nápovědou.
 */
void printHelp()
{
    printf("Program .\n"
           "Autor, Licence: Marek Nožka, GNU/GPL\n"
           "Program počítá .\n");
}

/////////////////////////////////////////////////////
/**
 * Hlavní program.
 */
int main(int argc, char *argv[])
{
    /* 
     * Zpracování parametrů příkazového řádku 
     */
    int c;
    while ((c = getopt(argc, argv, "hb:")) != -1) {
        switch (c) {
        case 'h':
            printHelp();
            break;
        case 'b':
            printf("volba: b, s parametrem: %s\n", optarg);
            break;
        case '?':
            printf("neplatná volba: %c\n", optopt);
            break;
        }
    }

    /* všechny parametry */
    for (int i = 0; i < argc; i++) {
        puts(argv[i]);
    }
    /* patametry, které nejsou přepínači */
    for (int i = optind; i < argc; i++) {
        puts(argv[i]);
    }

    return 0;
}
