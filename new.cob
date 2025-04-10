      ******************************************************************
      * Program Name: AddFourNumbers
      * Description : This program accepts four numbers as input from 
      *               the user, calculates their sum, and displays the 
      *               result.
      * 
      * Input       : Four numeric values entered by the user.
      * Output      : The sum of the four input numbers.
      * 
      * Author      : [Your Name]
      * Date        : [Date]
      * 
      * Notes       : Ensure that the input values do not exceed the 
      *               maximum size defined by PIC 9(5).
      ******************************************************************
      IDENTIFICATION DIVISION.
      PROGRAM-ID. AddFourNumbers.
      ENVIRONMENT DIVISION.
      INPUT-OUTPUT SECTION.

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
          DISPLAY "The sum of " NUM1 " + " NUM2 " + " NUM3 " + " NUM4 " is: " RESULT
          STOP RUN.