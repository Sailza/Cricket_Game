       IDENTIFICATION DIVISION.
       PROGRAM-ID. StatisticsCalculator.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT INPUT-FILE ASSIGN TO "numbers.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OUTPUT-FILE ASSIGN TO "results.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD INPUT-FILE.
       01 INPUT-RECORD.
           05 INPUT-NUMBER PIC 9(5).

       FD OUTPUT-FILE.
       01 OUTPUT-RECORD.
           05 OUTPUT-MESSAGE PIC X(80).

       WORKING-STORAGE SECTION.
       01 WS-NUMBER           PIC 9(5) VALUE 0.
       01 WS-SUM              PIC 9(10) VALUE 0.
       01 WS-COUNT            PIC 9(5) VALUE 0.
       01 WS-AVERAGE          PIC 9(10)V9(2) VALUE 0.
       01 WS-MAX              PIC 9(5) VALUE 0.
       01 WS-MIN              PIC 9(5) VALUE 99999.
       01 WS-END-OF-FILE      PIC X VALUE 'N'.
       01 WS-DISPLAY-MESSAGE  PIC X(80) VALUE SPACES.
       01 WS-RANGE            PIC 9(5) VALUE 0.
       01 WS-ERROR-FLAG       PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM INITIALIZE-PROGRAM
           PERFORM READ-INPUT-FILE
           IF WS-ERROR-FLAG = 'N'
               PERFORM CALCULATE-STATISTICS
               PERFORM WRITE-OUTPUT-FILE
               PERFORM DISPLAY-RESULTS
           ELSE
               DISPLAY "Error: Unable to process input file."
           END-IF
           PERFORM CLEANUP
           STOP RUN.

       INITIALIZE-PROGRAM.
           DISPLAY "Welcome to Enhanced Statistics Calculator Program."
           DISPLAY "Thiscalculates sum, average, max, min, and range."
           DISPLAY "------------------------------------------------".

       READ-INPUT-FILE.
           OPEN INPUT INPUT-FILE
           PERFORM UNTIL WS-END-OF-FILE = 'Y'
               READ INPUT-FILE INTO INPUT-RECORD
                   AT END
                       MOVE 'Y' TO WS-END-OF-FILE
                   NOT AT END
                       IF INPUT-NUMBER IS NUMERIC
                           MOVE INPUT-NUMBER TO WS-NUMBER
                           PERFORM PROCESS-NUMBER
                       ELSE
                           DISPLAY "Non-numeric value found input file."
                           MOVE 'Y' TO WS-ERROR-FLAG
                           MOVE 'Y' TO WS-END-OF-FILE
                       END-IF
               END-READ
           END-PERFORM
           CLOSE INPUT-FILE.

       PROCESS-NUMBER.
           ADD WS-NUMBER TO WS-SUM
           ADD 1 TO WS-COUNT
           IF WS-NUMBER > WS-MAX
               MOVE WS-NUMBER TO WS-MAX
           END-IF
           IF WS-NUMBER < WS-MIN
               MOVE WS-NUMBER TO WS-MIN
           END-IF.

       CALCULATE-STATISTICS.
           IF WS-COUNT > 0
               COMPUTE WS-AVERAGE = WS-SUM / WS-COUNT
               COMPUTE WS-RANGE = WS-MAX - WS-MIN
           ELSE
               DISPLAY "No valid numbers were provided in input file."
               MOVE 'Y' TO WS-ERROR-FLAG
           END-IF.

       WRITE-OUTPUT-FILE.
           OPEN OUTPUT OUTPUT-FILE
           MOVE "Sum: " TO WS-DISPLAY-MESSAGE(1:5)
           MOVE WS-SUM TO WS-DISPLAY-MESSAGE(6:10)
           WRITE OUTPUT-RECORD FROM WS-DISPLAY-MESSAGE

           MOVE "Average: " TO WS-DISPLAY-MESSAGE(1:9)
           MOVE WS-AVERAGE TO WS-DISPLAY-MESSAGE(10:15)
           WRITE OUTPUT-RECORD FROM WS-DISPLAY-MESSAGE

           MOVE "Maximum: " TO WS-DISPLAY-MESSAGE(1:9)
           MOVE WS-MAX TO WS-DISPLAY-MESSAGE(10:15)
           WRITE OUTPUT-RECORD FROM WS-DISPLAY-MESSAGE

           MOVE "Minimum: " TO WS-DISPLAY-MESSAGE(1:9)
           MOVE WS-MIN TO WS-DISPLAY-MESSAGE(10:15)
           WRITE OUTPUT-RECORD FROM WS-DISPLAY-MESSAGE

           MOVE "Range: " TO WS-DISPLAY-MESSAGE(1:7)
           MOVE WS-RANGE TO WS-DISPLAY-MESSAGE(8:12)
           WRITE OUTPUT-RECORD FROM WS-DISPLAY-MESSAGE
           CLOSE OUTPUT-FILE.

       DISPLAY-RESULTS.
           DISPLAY "Results:"
           DISPLAY "Sum: " WS-SUM
           DISPLAY "Average: " WS-AVERAGE
           DISPLAY "Maximum: " WS-MAX
           DISPLAY "Minimum: " WS-MIN
           DISPLAY "Range: " WS-RANGE.

       CLEANUP.
           DISPLAY "Thank you using Enhanced  Calculator Program."
           DISPLAY "Goodbye!".