#!/bin/bash
echo "Compiling to bin main and execute bin\n"
gcc -o main main.c 
echo "--// output main //--"
./main

echo "--// end output main //--"
exit 0