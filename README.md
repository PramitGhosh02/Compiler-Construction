# Compiler Construction Lab (Experiments 1–10)

This repository contains practical experiments for the **Compiler Construction** laboratory course, implemented using **Lex / Flex** (Lexical Analyzer Generator) and **Yacc / Bison** (Parser Generator) along with **C**.

---

## Repository Structure

```
Compiler-Construction/
├── Experiment-01/   # Count specific patterns ("sec-B") & comments in C
├── Experiment-02/   # Lexical Analyzer for C (tokens, keywords, identifiers)
├── Experiment-03/   # Count words starting with 'A'/'a' and numbers (int, float, exp)
├── Experiment-04/   # Validate arithmetic expressions using Lex & Yacc
├── Experiment-05/   # Case converter (lowercase <-> uppercase)
├── Experiment-06/   # File-based converter (Decimal <-> Hexadecimal)
├── Experiment-07/   # Count lines ending with .com or .COM in a file
├── Experiment-08/   # Postfix expression evaluation with power and inc/dec
├── Experiment-09/   # Advanced Desk Calculator with error recovery
└── Experiment-10/   # Intermediate Code Generator (Three-Address Code)
```

---

## Experiment Summaries & How to Run

### Prerequisites
Make sure you have `flex`, `bison` (or `byacc`), and `gcc` installed:
```bash
sudo apt update && sudo apt install flex bison gcc
```

---

### Experiment 01: Pattern Matching and Comment Counting
- **`count_sec_b.l`**: Counts occurrences of the string `"sec-B"` in an input statement.
- **`count_comments.l`**: Counts single-line comments (`//...`) in C source code while echoing non-comment code.
```bash
cd Experiment-01
flex count_sec_b.l
gcc lex.yy.c -o count_sec_b -lfl
./count_sec_b
```

---

### Experiment 02: Lexical Analyzer for C
- **`experiment2.l`**: Reads a C source file (`input.c`) and classifies/counts comments, keywords, identifiers, numbers, lines, words, and spaces.
- **`input.c`**: Sample C input file.
```bash
cd Experiment-02
flex experiment2.l
gcc lex.yy.c -o experiment2 -lfl
./experiment2
```

---

### Experiment 03: Word and Number Recognition
- **`exp3.l`**: Identifies and counts words starting with `'A'` or `'a'`, as well as numbers in integer, decimal, and scientific exponent notations (`e`/`E`).
```bash
cd Experiment-03
flex exp3.l
gcc lex.yy.c -o exp3 -lfl
./exp3
```

---

### Experiment 04: Arithmetic Expression Validation
- **`exp4.l`** & **`exp4.y`**: Implements a parser using Lex and Yacc to validate arithmetic expressions with operator precedence (`+`, `-`, `*`, `/`) and parentheses.
```bash
cd Experiment-04
yacc -d exp4.y
flex exp4.l
gcc y.tab.c lex.yy.c -o exp4 -lfl
./exp4
```

---

### Experiment 05: Character Case Converter
- **`exp5.l`**: Converts lowercase letters to uppercase and uppercase letters to lowercase while passing other characters unchanged.
```bash
cd Experiment-05
flex exp5.l
gcc lex.yy.c -o exp5 -lfl
./exp5
```

---

### Experiment 06: Decimal to Hexadecimal & Hex to Decimal File Converter
- **`exp6.l`**: Reads `input.txt` and converts decimal numbers to hexadecimal format and hexadecimal (`0x...`) numbers to decimal, writing output to `output.txt`.
- **`input.txt`**: Sample numeric inputs.
```bash
cd Experiment-06
flex exp6.l
gcc lex.yy.c -o exp6 -lfl
./exp6
```

---

### Experiment 07: Filter Lines Ending with Domain Pattern
- **`exp7.l`**: Reads `input.txt` and counts all lines ending with `.com` or `.COM`.
- **`input.txt`**: Sample domain and text records.
```bash
cd Experiment-07
flex exp7.l
gcc lex.yy.c -o exp7 -lfl
./exp7
```

---

### Experiment 08: Postfix Expression Evaluator
- **`exp8.l`** & **`exp8.y`**: Evaluates postfix expressions supporting addition (`+`), subtraction (`-`), multiplication (`*`), division (`/`), exponentiation (`^`), and post-increment (`++`) / post-decrement (`--`).
```bash
cd Experiment-08
yacc -d exp8.y
flex exp8.l
gcc y.tab.c lex.yy.c -o exp8 -lfl
./exp8
```

---

### Experiment 09: Desk Calculator with Error Recovery
- **`exp9.l`** & **`exp9.y`**: Full-featured desk calculator handling arithmetic expressions, floating-point calculations, modulus (`%`), exponentiation (`^`), unary operators (`+`, `-`), increment/decrement (`++`, `--`), and parser error recovery (`yyerrok`).
```bash
cd Experiment-09
yacc -d exp9.y
flex exp9.l
gcc y.tab.c lex.yy.c -o exp9 -lm -lfl
./exp9
```

---

### Experiment 10: Intermediate Code Generator (Three-Address Code)
- **`exp10.l`** & **`exp10.y`**: Generates Three-Address Code (TAC) representations with temporary variables (`t1`, `t2`, ...) for expressions and assignment statements.
```bash
cd Experiment-10
yacc -d exp10.y
flex exp10.l
gcc y.tab.c lex.yy.c -o exp10 -lfl
./exp10
```

---

## Author
**Pramit Kumar Ghosh**
- GitHub: [@PramitGhosh02](https://github.com/PramitGhosh02)
