      *****************************************************************
      * Program: AddFourNumbers
      * Author: [Your Name]
      * Date: [Date]
      * 
      * Description:
      * This COBOL program accepts four numbers as input from the user,
      * calculates their sum, and displays the result. The program uses
      * the ADD statement to perform the arithmetic operation.
      * 
      * Input:
      * - NUM1: First number entered by the user (PIC 9(5)).
      * - NUM2: Second number entered by the user (PIC 9(5)).
      * - NUM3: Third number entered by the user (PIC 9(5)).
      * - NUM4: Fourth number entered by the user (PIC 9(5)).
      * 
      * Output:
      * - RESULT: The sum of NUM1, NUM2, NUM3, and NUM4 (PIC 9(5)).
      * 
      * Procedure:
      * 1. Prompt the user to enter four numbers.
      * 2. Accept the input values into NUM1, NUM2, NUM3, and NUM4.
      * 3. Add the four numbers using the ADD statement.
      * 4. Display the result of the addition.
      * 5. Terminate the program.
      *****************************************************************
       IDENTIFICATION DIVISION.
         PROGRAM-ID. AddFourNumbers.

         DATA DIVISION.
         WORKING-STORAGE SECTION.
         01 NUM1              PIC 9(5) VALUE 0.
         01 NUM2              PIC 9(5) VALUE 0.
         01 NUM3              PIC 9(5) VALUE 0.
         01 NUM4              PIC 9(5) VALUE 0.
         01 RESULT            PIC 9(5) VALUE 0.

         PROCEDURE DIVISION.
         MAIN-PROCEDURE.
             DISPLAY "Enter the first number: "
             ACCEPT NUM1
             DISPLAY "Enter the second number: "
             ACCEPT NUM2
             DISPLAY "Enter the third number: "
             ACCEPT NUM3
             DISPLAY "Enter the fourth number: "
             ACCEPT NUM4
             ADD NUM1 NUM2 NUM3 NUM4 GIVING RESULT
             DISPLAY "The sum of " NUM1 ", " NUM2 ", " NUM3 ", and " NUM4 " is " RESULT
             STOP RUN.