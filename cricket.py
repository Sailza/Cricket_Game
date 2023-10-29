import random
import mysql.connector

print("""
_________________________________________________________________

WELCOME TO CRICKET GAME
_________________________________________________________________
""")
mydb = mysql.connector.connect(host = 'localhost', user='root',password = 'Saika@28')
mycursor = mydb.cursor()
mycursor.execute("Create database if not exists cricket_db")
mycursor.execute("use cricket_db")

mydb.commit()
mycursor.execute("select * from sno")
x=0
for i in mycursor:
    x=1
if x==0:
    mycursor.execute("insert into sno values (0)")
    mydb.commit()

mycursor.execute("select* from login")
x=0
for i in mycursor:
       x=1
if x==0:
    mycursor.execute("insert into login values ('Richa','6789')")
    mydb.commit()
    


while True:
    
    
    print("""
    1.LOGIN
    2.INSTRUCTION
    3.DATA
    4.EXIT
""")
    ch = int(input("ENTER YOUR CHOICE:"))

    if ch ==1:
        passs = input("Enter your password:")
        mycursor.execute("select * from login")
        for i in mycursor:
            t_user,t_pass=i
        if(passs ==t_pass):
            name = input("Enter Your Name:")
            

            print("\n---------- Start Game ----------")

             
            print("\nHere comes the Toss")
            toss = (input("Choose heads or tails: ")).lower()
             
            random_toss = random.randint(1,2)            # In random_toss (1 = Heads) and (2 = Tails)
            random_opt = random.randint(1,2)             # In random_opt (1 = bat) and (2 = ball)
            u_opt = 0
            c_opt = 0
             
            if random_toss == 1 and toss == "heads":
                print("\nYou won the toss")
                u_opt = (input("Choose bat or ball: ")).lower()
             
            elif random_toss == 2 and toss == "tails":
                print("\nYou won the toss")
                u_opt = (input("Choose bat or ball: ")).lower()    
              
            else:
                print("\nYou lost the toss")
             
                if random_opt == 1:
                    c_opt = "bat"
                    print("Computer choose to",c_opt)
             
                elif random_opt == 2:
                    c_opt = "ball"
                    print("Computer choose to",c_opt)
             
            # First Innings 
             
            print("\n---------- First Innings Begins ----------")
             
            runs_1 = 0
            wickets_1 = 0
            balls_1 = 0
             
            while wickets_1 != 2 and balls_1 != 12:
                u_choice = int(input("\nChoose any number from 1 to 6: "))
                c_choice = random.randint(1,6)
                if u_choice < 1 or u_choice > 6:
                    print("\nPlease choose a value from 1 to 6.")
             
                else:
                    print("Your choice: ",u_choice,"\nComputer's choice: ",c_choice)
             
                    if u_choice == c_choice:
                        wickets_1 += 1
             
                    else:
                        if u_opt == "bat" or c_opt == "ball":
                            Bat_first = "You"
                            Ball_first = "Computer"
                            runs_1 += u_choice
             
                        elif u_opt == "ball" or c_opt == "bat":
                            Bat_first = "Computer"
                            Ball_first = "You"
                            runs_1 += c_choice
             
                    print("\nScore =",runs_1,"/",wickets_1)
             
                    balls_1 += 1
             
                    if balls_1 == 6:
                        print("End of Over 1")
             
                    elif balls_1 == 12:
                        print("End of Over 2")
                    print("Balls remaining: ",12 - balls_1)
             
                
                
                 
                         
             
            print("\n---------- End of Innings ----------") 
             
            print("\nFinal Score:")
            print("Runs =",runs_1)
            print("wickets =",wickets_1)
             
            print("\n",Ball_first,"needs",runs_1 + 1,"runs to win.")
             
            # Second Innings 
             
            print("\n---------- Second Innings Begins ----------")
             
            runs_2 = 0
            wickets_2 = 0
            balls_2 = 0
             
            while wickets_2 != 2 and balls_2 != 12 and runs_2 <= runs_1:
             
                u_choice = int(input("\nChoose any number from 1 to 6: "))
                c_choice = random.randint(1,6)
             
                if u_choice < 1 or u_choice > 6:
                    print("\nPlease choose a value from 1 to 6.")
             
                else:
                    print("Your choice: ",u_choice,"\nComputer's choice: ",c_choice)
             
                    if u_choice == c_choice:
                        wickets_2 += 1
                    else:
                        if Bat_first == "Computer": 
                            runs_2 += u_choice
                            Bat_second = "You"
             
                        elif Bat_first == "You":
                            runs_2 += c_choice
                            Bat_second = "Computer"
             
                    print("\nScore =",runs_2,"/",wickets_2)
             
                    balls_2 += 1
             
                    if balls_2 == 6:
                        print("End of Over 1")
             
                    elif balls_2 == 12:
                        print("End of Over 2")
             
                    if runs_2 <= runs_1 and balls_2 <= 11 and wickets_2 != 2:
                        print("To win:",runs_1 - runs_2 + 1,"runs needed from",12 - balls_2,"balls.")
             
            print("\n---------- End of Innings ----------") 
             
            print("\nFinal Score:")
            print("Runs =",runs_2)
            print("wickets =",wickets_2)
             
            # Result of Match
            score =0
            status = " "
             
            print("\n~~~~~~~~~~ Result ~~~~~~~~~~")
             
            if runs_1 > runs_2:
             
                if Bat_first == "You": 
                    print("\nCongratulations! You won the Match by",runs_1 - runs_2,"runs.")
                    score = runs_1
                    status = "Win"
             
                else:
                    print("\nBetter luck next time! The Computer won the Match by",runs_1 - runs_2,"runs.")
                    score = runs_2
                    status = "loss"
             
            elif runs_2 > runs_1:
             
                if Bat_second == "You": 
                    print("\nCongratulations! You won the Match by",2 - wickets_2,"wickets.")
                    score = runs_2
                    status = "Win"
             
                else:
                    score = runs_1
                    status = "loss"
                    print("\nBetter luck next time! The Computer won the Match by",2 - wickets_2,"wickets.")
                   
             
            else:
                status = "Tie"
                score = runs_1
                print("The Match is a Tie.","\nNo one Wins.")

            mycursor.execute("select*from sno")
            for i in mycursor:
                t_id = i[0]+1
            mycursor.execute("insert into cricket values ('"+str(t_id)+"','"+name+"', '"+str(score)+"', '"+status+"' )")
            mycursor.execute("update sno set id = '"+str(t_id)+"'")
            mydb.commit()
                












       
    elif ch ==2:
    
        print(""" ~~~~~~~~~~ Game of Cricket ~~~~~~~~~~
 
        Instructions:
         
        1. You have to select any random number from 1 to 6.
        2. The computer will also select a number.
        3. While batting, if the number selected by you and computer is different, then your number will add to your runs.
           If the number selected by you and computer is same, then you will lose your wicket.
        4. While bowling, if the number selected by you and computer is different, then the computer's number will add to its runs.
           If the number selected by you and computer is same, then the computer will lose its wicket.
        5. Each player will get 2 wickets and 2 overs (12 balls) for batting and bowling.
        6. The innings will end after either the three wickets fell or the overs end.
        7. The player with maximum runs wins. """)
         
        print("\n---------- Start Game ----------")
         

    elif ch ==3:
        print("SNO | NAME | RUN | STATUS")
        mycursor.execute("select * from cricket ")
        for i in mycursor:
            t_sno,t_name,t_run,t_status=i
            print(f"{t_sno} | {t_name} | {t_run} | {t_status} ")
            


        
    elif ch == 4:
        break
 
