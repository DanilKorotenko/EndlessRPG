' Player Variables
global YourHealth
global NumXP
global NumGold
global PlayerWepaon$
global PlayerArmor$
global PlayerATK
global PlayerDF

' Dummy Variables
global DummySpare
global DummyHappy
global DummyName$
global DummyDialogue$
global DummyHealth

' Item Variables
global ItemsQuantities ' array of quantities
global ItemsNames$ ' array of names
global ItemsHPs$ ' array of HPs that items gives
global ItemsPrices
global ItemsSize

call initPlayerVariables
call initDummyVariables
call initItemsVariables

' Game Variables
GameRound = 1
'round loop
do
    print
    print "Round: "; GameRound
    print "your health: "; YourHealth
    ' crete new dummy here
    ' assign to it some random name
    PRINT DummyName$; " HAS APEARED!"
    DummyHealth = 20
    DummySpare = 1
    DummyHappy = 1
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
                call FIGHT
            CASE 2
                call ACT
            CASE 3
                call ITEM
            CASE 4
                call MERCY
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

        IF DummySpare=0 THEN
            NumXP=NumXP+int(rnd(1)*2)
            NumGold=NumGold+int(rnd(1)*10)
            PRINT "YOU WON!"
            PRINT DummyName$
            PRINT "you got " ;NumXP; " XP"
            PRINT "and " ;NumGold; " GOLD"
            GameRound = GameRound + 1
            exit do
        end if
    LOOP UNTIL TRUE

    if YourHealth <= 0 then
        exit do
    end if

    IF DummySpare=0 THEN
        exit do
    end if

    IF GameRound MOD 2 = 0 THEN
        call SHOP
    end if
LOOP UNTIL TRUE

END

' SUBROUTINES AREA /////////////////////////////////////////////
sub initPlayerVariables
    ' initial values of player variables
    YourHealth = 20 + (NumXP - 1) * 4
    NumXP = 0
    NumGold = 0
    PlayerWepaon$ = "Stick"
    PlayerArmor$ = "Bandage"
    PlayerATK = 2
    PlayerDF = 1
end sub

sub initDummyVariables
    DummySpare = 1
    DummyHappy = 1
    DummyName$ = "Froggit"
    DummyDialogue$ = "Ribbit,Ribbit"
end sub

sub initItemsVariables
    ItemsNames$(1) = "Crab Apple"
    ItemsQuantities(1) = int(rnd(1)*5)
    ItemsPrices(1) = 5
    ItemsHPs(1) = 5

    ItemsNames$(2) = "Sea Tea"
    ItemsQuantities(2) = int(rnd(1)*4)
    ItemsPrices(2) = 5
    ItemsHPs(2) = 8

    ItemsNames$(3) = "Cinnamon-Buttersctotch Pie"
    ItemsQuantities(3) = 1
    ItemsPrices(3) = 5
    ItemsHPs(3) = 21

    ItemsNames$(4) = "Monster Candy"
    ItemsQuantities(4) = int(rnd(1)*2)
    ItemsPrices(4) = 5
    ItemsHPs(4) = 5

    ItemsNames$(5) = "Spider Donut"
    ItemsQuantities(5) = int(rnd(1)*7)
    ItemsPrices(5) = 5
    ItemsHPs(5) = 11

    ItemsSize = 5
end sub

' SHOP
sub SHOP
    PRINT "HI! Welcome to my shop where you can buy ITEMS, ARMOR and WEAPONS"
    do
        PRINT "Your gold: "; NumGold
        PRINT
        PRINT "ITEMS:"
        for itemIndex = 1 to ItemsSize
            PRINT itemIndex; ". ";  ItemsNames$(itemIndex); ". You have: "; ItemsQuantities(itemIndex); ". It gives "; ItemsHPs(itemIndex); " HP. It costs: "; ItemsPrices(itemIndex)
        next itemIndex
        PRINT "0. exit"

        INPUT "Choose item to buy:" ;itemChoice

        if (itemChoice=0) then
            exit do
        end if

        IF (NumGold>ItemsPrices(itemChoice)) OR (NumGold=ItemsPrices(itemChoice)) THEN
            ItemsQuantities(itemChoice)=ItemsQuantities(itemChoice)+1
            NumGold=NumGold-ItemsPrices(itemChoice)
        ELSE
            PRINT "You don't have enough gold"
        end if

        ' PRINT "1. Amongus potion"
        ' PRINT "This potion is so toxic that it insta-kills EVERYTHING"
        ' PRINT "COST:10 GOLD"
        ' PRINT "2. TEST_ITEM"
        ' PRINT "Is abble to make ANYTHING sleep,i can't even describe what shape it is"
        ' PRINT "COST:7 GOLD"
        ' PRINT "3. goofy ahh sword"
        ' PRINT "Big sword,bigger attack"
        ' PRINT "COST:25 GOLD"
        ' PRINT "OKIDK"
        ' PRINT "0. Exit"
        ' DO
        '     INPUT "Enter the number of the creature: "; choice
        '     SELECT CASE choice
        '         CASE 1
        '             GOSUB 200
        '         CASE 2
        '             GOSUB 210
        '         CASE 3
        '             GOSUB 220
        '         CASE 0
        '             END
        '         CASE ELSE
        '             PRINT "Invalid choice. Please enter a number from the menu."
        '     END SELECT
        ' LOOP UNTIL TRUE
        ' 200 REM Entry for Kaiju
        '     Item1Name$="sussy juice(amogus potion)"
        '     RETURN
    loop until true
end sub

' FIGHT ACT ITEM MERCY
sub FIGHT
    PRINT DummyName$
    RandomDamage=int(rnd(1)*5)
    RandomDamage=RandomDamage+PlayerATK
    PRINT "took "; RandomDamage; " damege!"
    DummyHealth=DummyHealth - RandomDamage
    PRINT "DummyHealth "; DummyHealth
    RandomDamage=int(rnd(1)*5)
    RandomDamage=RandomDamage-PlayerDF
    if RandomDamage<0 then
        RandomDamage=0
    end if
    PRINT "You got "; RandomDamage ; " damage!"
    YourHealth=YourHealth-RandomDamage
    PRINT "YourHealth "; YourHealth
    print
end sub

sub ACT
    PRINT "you complement " ;DummyName$
    PRINT "It seems flattered"
    DummyHappy = DummyHappy - 1
    RandomDamage=int(rnd(1)*5)
    PRINT "You got "; RandomDamage ; " damage!"
    RandomDamage=RandomDamage-PlayerDF
    YourHealth=YourHealth-RandomDamage-PlayerDF
    PRINT "YourHealth "; YourHealth
    print
end sub

sub ITEM
    PRINT "CHOSE ITEM"
    for itemIndex = 1 to ItemsSize
        PRINT itemIndex; ". "; ItemsQuantities(itemIndex); " "; ItemsNames$(itemIndex); " gives "; ItemsHPs(itemIndex); " HP"
    next itemIndex
    INPUT "Item:" ;itemChoice
    IF ItemsQuantities(itemChoice)>0 THEN
        YourHealth=YourHealth+ItemsHPs(itemChoice)
        PRINT "Your Health ";YourHealth
        ItemsQuantities(itemChoice)=ItemsQuantities(itemChoice)-1
    ELSE
        PRINT "you ran out of this item"
    end if
    print
end sub

sub MERCY
    IF DummySpare>0 THEN
        PRINT DummyName$; " is too angry to be spared"
        RandomDamage=int(rnd(1)*5)
        PRINT "You got "; RandomDamage; " damage!"
        RandomDamage=RandomDamage-PlayerDF
        YourHealth=YourHealth-RandomDamage-PlayerDF
        PRINT "YourHealth "; YourHealth
        print
    end if
end sub
