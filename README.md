# Calculator-Cobol
Command line-based Calculator written in COBOL

STEP 1: Installing GNU Cobol on Linux (Debian)
user@debian $ sudo apt install gnucobol

STEP 2: Compile the cobol code
user@debian $ cobc -x calculator.cbl

STEP 3: Run the compiled code

user@debian $ ./calculator          
--------------------------------------------------
  COBOL-CALC
--------------------------------------------------
  INSERT: VALUE_A OPERATION VALUE_B
  EX: 140 + 3
  PRESS CTRL + C TO EXIT
--------------------------------------------------
Enter first number .......: 140
Enter Operator (+,-,*,/) .: +
Enter second number ......: 3
----------------------------------
Result: 00000140 + 00000003 = 00000143
----------------------------------
Press any key to continue...
^C
interrupt from keyboard (signal)


Reference: https://github.com/luismr/cobol-simple-calculator/tree/main
