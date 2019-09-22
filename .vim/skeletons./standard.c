/*
 * Soubor:  skeletonVIM_FILE_NAME
 * Datum:   skeletonVIM_CREATION_CZDATE
 * Autor:   Marek Nožka, nozka <@t> spseol <d.t> cz
 * Licence: GNU/GPL 
 * Úloha: 
 * Popis:   
 ****************************************************/
#define _ISOC99_SOURCE
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>
#include <stdbool.h>
#include <limits.h>
#include <math.h>

#include <unistd.h>             /* rozlišení stdio */

/* ***************    Makra    ******************** */
#define PROMPT " > "
#define ARRAYC 1024

/* *********** Prototypy  funkcí ****************** */

void ttpromp(char prompt[]);

/****************************************************
 *               Hlavní program.
 ****************************************************/
int main(void)
{
    char line[ARRAYC];
    int u = 0, v = 0;

    /* Čte řádky až do konce souboru */
    while (ttpromp(PROMPT), (fgets(line, ARRAYC, stdin) != NULL)) {
        if (!(sscanf(line, "%d%d", &u, &v) == 2 ||
              sscanf(line, "%d , %d", &u, &v) == 2) || (u <= 0
                                                         || v <= 0)) {
            fprintf(stderr, "Error: %s", line);
            fputs("Error: Chyba\n", stderr);
            continue;
        }
        if (!isatty(0)) {
            printf(PROMPT "%s\n", line);     /* jen pokud nečtu z klávesnice */
        }
        /* Zpracování řádku */

    }
    return 0;
}

/****************************************************
 *                 Funkce
 ****************************************************/

/* Funkce tiskne prompt */
void ttpromp(char prompt[])
{
    if (isatty(0)) {
        printf(prompt);
    }
}
