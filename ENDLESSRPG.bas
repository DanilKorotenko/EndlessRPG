' Player Variables

NumXP = 0

NumGold = 0

YourHealth = 20 + (NumXP - 1) * 4

PlayerWepaon$ = "Stick"

PlayerArmor$ = "Bandage"

PlayerATK = 2

PlayerDF = 1



' Dummy Variables

DummySpare = 1

DummyHealth = 20

DummyHappy = 1

DummyName$ = "Dummy"

DummyDialogue$ = "..."



' Item Variables

Item1 = 2

Item1Name$ = "Crab Apple"

Item2 = 3

Item2Name$ = "Sea Tea"

Item3 = 1

Item3Name$ = "Cinnamon-Buttersctotch Pie"

Item4 = 5

Item4Name$ = "Monster Candy"

Item5 = 3

Item5Name$ = "Spider Donut"



' Game Variables

RandomDamege = 0

GameRound = 0

PRINT DummyName$; " HAS APEARED!"

PRINT "1. FIGHT"

PRINT "2. ACT"

PRINT "3. ITEM"

PRINT "4. MERCY"

PRINT DummyName$; ": " ;DummyDialogue$

DO

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

        end

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

    end if

LOOP UNTIL TRUE

END

300 REM

    PRINT DummyName$

    RandomDamege=int(rnd(1)*5)

    RandomDamege=RandomDamege+PlayerATK

    PRINT "took "; RandomDamege; " damege!"

    DummyHealth=DummyHealth - RandomDamege

    PRINT "DummyHealth "; DummyHealth

    RandomDamege=int(rnd(1)*5)

        RandomDamege=int(rnd(1)*5)

        PRINT "You got "; RandomDamege; " damege!"

        RandomDamege=RandomDamege-PlayerDF

        YourHealth=YourHealth-RandomDamege-PlayerDF

        PRINT "YourHealth "; YourHealth

RETURN

310 REM

    PRINT "you complement " ;DummyName$

    PRINT "It seems flattered"

    DummyHappy = DummyHappy - 1

        RandomDamege=int(rnd(1)*5)

        PRINT "You got "; RandomDamege ; " damege!"

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

        YourHealth=YourHealth+7

        PRINT "Your Health ";YourHealth

        Item2=Item2-1

    ELSE

        PRINT "you ran out of this item"

    end if

RETURN

120 REM

    IF Item3>0 THEN

        YourHealth=YourHealth+20

        PRINT "Your Health ";YourHealth

        Item3=Item3-1

    ELSE

        PRINT "you ran out of this item"

    end if

RETURN

130 REM

    IF Item4>0 THEN

        YourHealth=YourHealth+3

        PRINT "Your Health ";YourHealth

        Item4=Item4-1

    ELSE

        PRINT "you ran out of this item"

    end if

RETURN

140 REM

    IF Item5>0 THEN

        YourHealth=YourHealth+10

        PRINT "Your Health ";YourHealth

        Item5=Item5-1

    ELSE

        PRINT "you ran out of this item"

    end if

RETURN

RETURN

330 REM

    IF DummySpare>0 THEN

        PRINT DummyName$; " is too angry to be spared"

        RandomDamege=int(rnd(1)*5)

        PRINT "You got "; RandomDamege; " damege!"

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



