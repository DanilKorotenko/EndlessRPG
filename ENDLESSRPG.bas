' Player Variables

NumXP = 0

NumGold = 0

PlayerWepaon$ = "Stick"

PlayerArmor$ = "Bandage"

YourHealth = 20 + (NumXP - 1) * 4

PlayerATK = 2

PlayerDF = 1



' Dummy Variables

DummySpare = 1

DummyHappy = 1

DummyName$ = "Froggit"

DummyDialogue$ = "Ribbit,Ribbit"



' Item Variables

Item1 = int(rnd(1)*5)

Item1Name$ = "Crab Apple"

Item2 = int(rnd(1)*4)

Item2Name$ = "Sea Tea"

Item3 = 1

Item3Name$ = "Cinnamon-Buttersctotch Pie"

Item4 = int(rnd(1)*2)

Item4Name$ = "Monster Candy"

Item5 = int(rnd(1)*7)

Item5Name$ = "Spider Donut"

' Game Variables

RandomDamege = 0

GameRound = 0

'round loop
do
    print "Round: "; GameRound

    print "your health: "; YourHealth

    ' crete new dummy here
    ' assign to it some random name
    PRINT DummyName$; " HAS APEARED!"
    DummyHealth = 20
    print "Dummy health: "; DummyHealth

    ' fighting loop
    DO
        'each time we print menu
        PRINT "1. FIGHT"
        PRINT "2. ACT"
        PRINT "3. ITEM"
        PRINT "4. MERCY"

        PRINT DummyName$; ": " ;DummyDialogue$

        INPUT "Action:" ;actionChoice

        SELECT CASE actionChoice
            CASE 1
                GOSUB 300
            CASE 2
                GOSUB 310
            CASE 3
                GOSUB 320
            CASE 4
                GOSUB 330
            CASE ELSE
                PRINT "Invalid choice. Please enter a number from the menu."
        END SELECT

        if YourHealth <= 0 then
            Print "You loose"
            exit do
        end if

        if DummyHappy = 0 then
            PRINT DummyName$; " is smiling"
            DummySpare=DummySpare=-1
        end if

        if DummyHealth <= 0 then
            NumXP=NumXP+int(rnd(1)*2)
            NumGold=NumGold+int(rnd(1)*10)
            PRINT "YOU WON!"
            PRINT "you got " ;NumXP; " XP"
            PRINT "and " ;NumGold; " GOLD"
            GameRound = GameRound + 1
            ' go to the next round
            exit do
        end if

        IF GameRound MOD 2 = 0 THEN
            PRINT "HI!Welcome to my shop where you can buy ITEMS,ARMOR and WEAPONS"
            PRINT "1. Amongus potion"
            PRINT "This potion is so toxic that it insta-kills EVERYTHING"
            PRINT "COST:10 GOLD"
            PRINT "2. TEST_ITEM"
            PRINT "Is abble to make ANYTHING sleep,i can't even describe what shape it is"
            PRINT "COST:7 GOLD"
            PRINT "3. goofy ahh sword"
            PRINT "Big sword,bigger attack"
            PRINT "COST:25 GOLD"
            PRINT "OKIDK"
            PRINT "0. Exit"
            DO
                INPUT "Enter the number of the creature: "; choice
                SELECT CASE choice
                    CASE 1
                        GOSUB 200
                    CASE 2
                        GOSUB 210
                    CASE 3
                        GOSUB 220
                    CASE 0
                        END
                    CASE ELSE
                        PRINT "Invalid choice. Please enter a number from the menu."
                END SELECT
            LOOP UNTIL TRUE

            200 REM Entry for Kaiju
                Item1Name$="sussy juice(amogus potion)"
                RETURN
        end if

    LOOP UNTIL TRUE

    if YourHealth <= 0 then
        exit do
    end if

LOOP UNTIL TRUE

END

300 REM
    RandomDamege=int(rnd(1)*5)
    PRINT "You got "; RandomDamege ; " damage!"
    RandomDamege=RandomDamege-PlayerDF
    YourHealth=YourHealth-RandomDamege-PlayerDF
    PRINT "YourHealth "; YourHealth
    RandomDamege=int(rnd(1)*5)
    PRINT "You got "; RandomDamege; " damage!"
    RandomDamege=RandomDamege-PlayerDF
    YourHealth=YourHealth-RandomDamege-PlayerDF
    PRINT "YourHealth "; YourHealth
RETURN

310 REM
    PRINT "you complement " ;DummyName$
    PRINT "It seems flattered"
    DummyHappy = DummyHappy - 1
    RandomDamege=int(rnd(1)*5)
    PRINT "You got "; RandomDamege ; " damage!"
    RandomDamege=RandomDamege-PlayerDF
    YourHealth=YourHealth-RandomDamege-PlayerDF
    PRINT "YourHealth "; YourHealth
RETURN

320 REM
    PRINT "CHOSE ITEM"
    PRINT "1.  " ; Item1; " " ;Item1Name$; "(s)"
    PRINT "2.  " ; Item2; " " ;Item2Name$; "(s)"
    PRINT "3.  " ; Item3; " " ;Item3Name$; "(s)"
    PRINT "4.  " ; Item4; " " ;Item4Name$; "(s)"
    PRINT "5.  " ; Item5; " " ;Item5Name$; "(s)"
    INPUT "Item:" ;itemChoice

    SELECT CASE itemChoice
        CASE 1
            GOSUB 100
        CASE 2
            GOSUB 110
        CASE 3
            GOSUB 120
        CASE 4
            GOSUB 130
        CASE 5
            GOSUB 140
        CASE ELSE
            PRINT "you dont have this item..."
    END SELECT
RETURN

100 REM
    IF Item1>0 THEN
        YourHealth=YourHealth+5
        PRINT "Your Health ";YourHealth
        Item1=Item1-1
    ELSE
        PRINT "you ran out of this item"
    end if
RETURN

110 REM
    IF Item2>0 THEN
        YourHealth=YourHealth+8
        PRINT "Your Health ";YourHealth
        Item2=Item2-1
    ELSE
        PRINT "you ran out of this item"
    end if
RETURN

120 REM
    IF Item3>0 THEN
        YourHealth=YourHealth+21
        PRINT "Your Health ";YourHealth
        Item3=Item3-1
    ELSE
        PRINT "you ran out of this item"
    end if
RETURN

130 REM
    IF Item4>0 THEN
        YourHealth=YourHealth+5
        PRINT "Your Health ";YourHealth
        Item4=Item4-1
    ELSE
        PRINT "you ran out of this item"
    end if
RETURN

140 REM
    IF Item5>0 THEN
        YourHealth=YourHealth+11
        PRINT "Your Health ";YourHealth
        Item5=Item5-1
    ELSE
        PRINT "you ran out of this item"
    end if
RETURN

330 REM
    IF DummySpare>0 THEN
        PRINT DummyName$; " is too angry to be spared"
        RandomDamege=int(rnd(1)*5)
        PRINT "You got "; RandomDamege; " damage!"
        RandomDamege=RandomDamege-PlayerDF
        YourHealth=YourHealth-RandomDamege-PlayerDF
        PRINT "YourHealth "; YourHealth
    end if

    IF DummySpare=0 THEN
        NumXP=NumXP+int(rnd(1)*2)
        NumGold=NumGold+int(rnd(1)*10)
        PRINT "YOU WON!"
        PRINT DummyName$
        PRINT "you got " ;NumXP; " XP"
        PRINT "and " ;NumGold; " GOLD"
        GameRound = GameRound + 1
    end if
RETURN
