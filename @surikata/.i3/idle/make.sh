 rm  *.o *.so printIdle

gcc -c -fPIC -o getIdle.o getIdle.c
gcc -shared getIdle.o -o libidle.so -lX11 -lXss
gcc -o printIdle printIdle.c $PWD/libidle.so
./printIdle
