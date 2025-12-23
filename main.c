/* First C Programm :) */
/* Also doubles as MY tutorial to future me and others*/

#include <stdio.h>
#include <stdbool.h>

// Prototypes
int test(void);
void pointer_example(void);
// return type, func name, parameter type parameter name ...

/*
Map of Contents
- Var
- Types
- Loops
- Syntax
- Expressions, komma, scope, functions, body and inline
- 




*/ 



int main (void)
{
    // Datatypes


    int i = 20;
    float f = 20.22;
    char c = '2';
    char * str = "Some String";

    bool x = 12;

    if (12) {
        printf("12 is true\n");
    }


    printf("The INT converted to BOOL is: %d\n", (bool)12);
    printf("The INT however is not equal to the BOOL true: %d\n", 12 == true);
    printf("%s, %i, %f %d\n", str, i, f, i);
    printf("Hello, World!\n");
    printf("Funky forloop\n");
    for (i = 0; i < 10; printf("++i after: %d\n", ++i))
        printf("i: %d\n", i);

    printf("Comma ONE \t"), printf("Comma TWO\n");
    printf("Point of random string, which is not a variable: %p\n", "SomvStuff");
    printf("Point of random string, which is not a variable, but the compiler ist smart: %p\n", "SomvStuff");


    printf("This does not work for integars however: %p\n", 12);
    printf("This does not work for integars however, a s the second one is different: %p\n", 12);

    printf("However the C standard does not garantee it!~\n");

    pointer_example();



    int value = 20;
    int *pointer =  
}

void pointer_example(void){
    int i = 39; // Migu number
    int *p = &i;
    printf("Var i: %d, Var *p: %p \n", i, p);
    i = 14; // NOT MIKU
    int *j = &i;
    // The asterisk applies to the variabel
    // As the type of the pointer *i is still an integar
    
    // int i
    // int *i 
    // i and *i are NOT different variables, so this simply overwrites the i variable

    printf("Var i: %d, Var *j: %p \n", i, j);
    printf("After the update of i, p is: %p; j is: %p\n", p, j);

    printf("Increment Example\n");
    int number = 20;
    increment(&number);
    printf("Num: %d\n", number);
}

void increment(int *p) {
    *p = *p + 1;
    (*p)++;
}

int test (void) {
    return 2;
}