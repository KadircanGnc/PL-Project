# Programming Language kokb

This is a project for the CSE-334 Programming Languages course. We are creating our own programming language using the dynamics of the course.

## Group Members: 
- 20200808082 Kadir Can Genç
- 20200808080 Önder Polatdemir
- 20200808028 Kaan Yılmaz
- 20210808605 Barış Ayhan

## Syntax

```
<program> ::= <statements> <endStatement>

<statements> ::= <statement> <statements>
            | <statement>

<statement> ::= <printStatement> ";"
            | <assignmentStatement> ";"
            | <loopStatement>
            | <ifStatement>
            | <incrementStatement> ";"
            | <decrementStatement> ";"
            | <endStatement>
            | <commentStatement>

<expression> ::= <term>
             | <expression> "+" <expression>
             | <expression> "-" <expression>
             | <expression> "*" <expression>
             | <expression> "/" <expression>
             | <expression> "^" <expression>
             | <expression> "%" <expression>
             | <expression> "==" <expression>
             | <expression> "!=" <expression>
             | <expression> "<" <expression>
             | <expression> "<=" <expression>
             | <expression> ">" <expression>
             | <expression> ">=" <expression>
             | <expression> "&&" <expression>
             | <expression> "||" <expression>
             | "!" <expression>
             | "(" <expression> ")"

<block> ::= "{" <statements> "}"

<term> ::= <NUMBER>
       | <IDENTIFIER>

<stringTerm> ::= <STRING>

<printStatement> ::= "PRINT" "(" <stringTerm> ")"
                 | "PRINT" "(" <expression> ")"

<ifStatement> ::= "IF" "(" <expression> ")" <block>
              | "IF" "(" <expression> ")" <block> "ELSE" <block>
              | "IF" "(" <expression> ")" <block> <elseIfStatement>
              | "IF" "(" <expression> ")" <block> <elseIfStatement> "ELSE" <block>

<elseIfStatement> ::= "ELSEIF" "(" <expression> ")" <block>
                   | "ELSEIF" "(" <expression> ")" <block> <elseIfStatement>

<loopStatement> ::= "WHILE" "(" <expression> ")" <block>

<assignmentStatement> ::= <IDENTIFIER> "=" <expression>
                       | <IDENTIFIER> "=" <stringTerm>

<incrementStatement> ::= <IDENTIFIER> "++"

decrementStatement ::= <IDENTIFIER> "--"

<endStatement> ::= "EXIT_COMMAND"

<commentStatement> ::= "COMMENT"

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

