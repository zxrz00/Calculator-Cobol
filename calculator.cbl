       IDENTIFICATION DIVISION.
       PROGRAM-ID. CALCULATOR.
      * A simple calculator in COBOL with a console interface.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-PC.
       OBJECT-COMPUTER. IBM-PC.

       DATA DIVISION.
       WORKING-STORAGE SECTION.

       77  WS-VALUE-A        PIC 9(8) VALUE 0.
       77  WS-OPERATOR       PIC X VALUE SPACE.
       77  WS-VALUE-B        PIC 9(8) VALUE 0.
       77  WS-RESULT         PIC 9(8) VALUE 0.

       77  WS-VALID-OPERATOR PIC X(4) VALUE '+-*/'.
       77  WS-ERROR-MESSAGE  PIC X(50) VALUE 'INVALID INPUT, TRY AGAIN'.
       77  WS-EXIT-FLAG      PIC X VALUE 'N'.
       77  WS-KEY-PRESSED    PIC X.
       77  WS-TEMP-VALUE     PIC X(10).

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
           PERFORM UNTIL WS-EXIT-FLAG = 'Y'
               PERFORM DISPLAY-UI
               PERFORM GET-INPUT
               PERFORM VALIDATE-INPUT
               IF WS-EXIT-FLAG NOT = 'Y'
                   PERFORM PERFORM-CALCULATION
                   PERFORM DISPLAY-RESULT
               END-IF
           END-PERFORM.
           STOP RUN.

       DISPLAY-UI.
           DISPLAY "--------------------------------------------------".
           DISPLAY "  COBOL-CALC".
           DISPLAY "--------------------------------------------------".
           DISPLAY "  INSERT: VALUE_A OPERATION VALUE_B".
           DISPLAY "  EX: 140 + 3".
           DISPLAY "  PRESS CTRL + C TO EXIT".
           DISPLAY "--------------------------------------------------".

       GET-INPUT.
           DISPLAY "Enter first number .......: " WITH NO ADVANCING. 
           ACCEPT WS-VALUE-A.

           DISPLAY "Enter Operator (+,-,*,/) .: " WITH NO ADVANCING. 
           ACCEPT WS-OPERATOR.

           DISPLAY "Enter second number ......: " WITH NO ADVANCING. 
           ACCEPT WS-VALUE-B.

       VALIDATE-INPUT.
           IF WS-OPERATOR NOT = '+' AND WS-OPERATOR NOT = '-'
              AND WS-OPERATOR NOT = '*' AND WS-OPERATOR NOT = '/'
              DISPLAY WS-ERROR-MESSAGE
              PERFORM GET-INPUT
           END-IF.

           IF WS-OPERATOR = '/' AND WS-VALUE-B = 0
              DISPLAY "ERROR: Division by zero is not allowed."
              PERFORM GET-INPUT
           END-IF.

       PERFORM-CALCULATION.
           EVALUATE WS-OPERATOR
               WHEN '+'
                   COMPUTE WS-RESULT = WS-VALUE-A + WS-VALUE-B
               WHEN '-'
                   COMPUTE WS-RESULT = WS-VALUE-A - WS-VALUE-B
               WHEN '*'
                   COMPUTE WS-RESULT = WS-VALUE-A * WS-VALUE-B
               WHEN '/'
                   COMPUTE WS-RESULT = WS-VALUE-A / WS-VALUE-B
           END-EVALUATE.

       DISPLAY-RESULT.
           DISPLAY "----------------------------------".
           DISPLAY "Result: " FUNCTION TRIM(WS-VALUE-A) 
               " " WS-OPERATOR 
               " " FUNCTION TRIM(WS-VALUE-B) 
               " = " FUNCTION TRIM(WS-RESULT).
           DISPLAY "----------------------------------".
           DISPLAY "Press any key to continue...".
           ACCEPT WS-KEY-PRESSED.
           IF WS-KEY-PRESSED = X'1B' MOVE 'Y' TO WS-EXIT-FLAG STOP RUN.

       END PROGRAM CALCULATOR.
