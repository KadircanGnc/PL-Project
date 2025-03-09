# Programming Language kokb

This is a project for the CSE-334 Programming Languages course. We are creating our own programming language using the dynamics of the course.

## Group Members: 
- 20200808082 Kadir Can Genç
- 20200808080 Önder Polatdemir
- 20200808028 Kaan Yılmaz
- 20210808605 Barış Ayhan

## Syntax

```
program:
    statements endStatement {printf("Program is valid\n");}
;

statements:
    statement statements {;}
    | statement {;}
;

statement:
    printStatement SEMICOLON {;}
    | assignmentStatement SEMICOLON {;}
    | loopStatement {;}
    | ifStatement {;}
    | incrementStatement SEMICOLON {;}
    | decrementStatement SEMICOLON {;}
    | endStatement {;}
    | commentStatement {;}
;

expression:
    term {$$ = $1;}
    | expression PLUS expression {$$ = $1 + $3;}
    | expression MINUS expression {$$ = $1 - $3;}
    | expression MULTIPLY expression {$$ = $1 * $3;}
    | expression DIVIDE expression {
        if ($3 == 0) {
            yyerror("Error: Cannot divide by 0\n");
        } else {
            $$ = $1 / $3;
        }
    }
    | expression POWER expression {$$ = pow($1, $3);}
    | expression MODULE expression {$$ = $1 % $3;}
    | expression EQUALS expression {$$ = $1 == $3;}
    | expression NOT_EQUALS expression {$$ = $1 != $3;}
    | expression LESS_THAN expression {$$ = $1 < $3;}
    | expression LESS_THAN_OR_EQUAL expression {$$ = $1 <= $3;}
    | expression GREATER_THAN expression {$$ = $1 > $3;}
    | expression GREATER_THAN_OR_EQUAL expression {$$ = $1 >= $3;}
    | expression AND expression {$$ = $1 && $3;}
    | expression OR expression {$$ = $1 || $3;}
    | NOT expression {$$ = !$2;}
    | LPAREN expression RPAREN {$$ = $2;}
;

block:
    LBRACE statements RBRACE {;}
;

term:
    NUMBER {$$ = $1;}
    | IDENTIFIER {$$ = symbolVal($1);}


stringTerm:
    STRING {$$ = $1;}

printStatement:
    PRINT LPAREN stringTerm RPAREN {
        if (strcmp($3, "/n") == 0) {
            printf("\n");
        } else {
           printf("%s\n", $3);
        }
    }
    | PRINT LPAREN expression RPAREN {printf("%d\n", $3);}
;

ifStatement:
    IF LPAREN expression RPAREN block {
        if ($3) {
        }
    }
    | IF LPAREN expression RPAREN block ELSE block {
        if ($3) {
        } else {
        }
    }
    | IF LPAREN expression RPAREN block elseIfStatement LPAREN expression RPAREN block {
        if ($3) {
        } else if ($8) {
        }
    }
    | IF LPAREN expression RPAREN block elseIfStatement LPAREN expression RPAREN block ELSE block {
        if ($3) {
        } else if ($8) {
        } else {
        }
    }
;
elseIfStatement:
    ELSEIF LPAREN expression RPAREN block {
        if ($3) {
            // run $5
        }
    }
    | ELSEIF LPAREN expression RPAREN block elseIfStatement {
    }
;

loopStatement:
    WHILE LPAREN expression RPAREN block {
        while ($3) {

        }
    }
;

assignmentStatement:
    IDENTIFIER ASSIGN expression       {updateSymbolVal($1,$3);}
    | IDENTIFIER ASSIGN stringTerm       {updateStringsVal($1,$3);}
;

incrementStatement:
    IDENTIFIER INCREMENT { updateSymbolVal($1, symbolVal($1) + 1); }
;

decrementStatement:
    IDENTIFIER DECREMENT { updateSymbolVal($1, symbolVal($1) - 1); }
;

endStatement:
    EXIT_COMMAND        {printf("PROGRAM FINISHED\n"); exit(EXIT_SUCCESS);}
;

commentStatement:
    COMMENT  {printf("Comment is valid\n");}
;
```

## Explanations about the language

### kokb Programming Language

### File Extension
`.kokb`

### Data Types
Our language supports fundamental data types, including:
- **Number**
- **String**

### Conditional Statements
Basic conditional statements are supported, including:
- `if`
- `else if`
- `else`

### Comparison Operators
Our language supports fundamental comparison operators, including:
- Equal to (`==`)
- Not Equal to (`!=`)
- Less than (`<`)
- Greater than (`>`)
- Less than or equal to (`<=`)
- Greater than or equal to (`>=`)
- Logical OR (`||`)
- Logical AND (`&&`)
- Logical NOT (`!`)

### Arithmetic Operations
Basic arithmetic operations supported:
- Addition (`+`)
- Subtraction (`-`)
- Multiplication (`*`)
- Division (`/`)
- Modulus (`%`)
- Power (`^`)

### Mathematical Abbreviations
Some shorthand operations are supported:
- Increment (`++`)
- Decrement (`--`)

### Loops
Our language supports the **while** loop, which operates similarly to the syntax and behavior in JavaScript and Java.

### Comment Lines
Our language supports comment lines, allowing developers to add explanatory or descriptive notes without affecting functionality.

### Running Your Program
You can run your program using the **Makefile**:
```sh
make
./myprog < example.kokb

