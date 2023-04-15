//Raghav Patidar
//2020CSB1115
// Lab8 (CUCU)

HOW TO COMPILE PROGRAMM ? 

 Use following two commands 
           yacc -d cucu.y; lex cucu.l; cc lex.yy.c y.tab.c -o cucu -lfl;
           ./cucu

There are 5 files in this folder : cucu.l, cucu.y, README.txt.

Cucu.l

    A. All variable names, keywords, special characters, and integers have been tokenized.
    B. It will print every token name in the Lexer.txt file as well as the result.

cucu.y

    A. This program contains the BNF grammar rules for the compiler.
    B. This will report the code parsing and place the output in the parser.txt file.
    C. If there would be any error in syntax then an error message Syntax Error is printed in the terminal and code returns from there.

Sample1.cu 
   
   This is correct code input
 
Sample2.cu 
   
   This is incorrect code input