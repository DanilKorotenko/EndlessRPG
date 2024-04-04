' Item Variables
global ItemsSize
ItemsSize = 5 ' this variable should contain total number of all items
' Player Variables
global YourHealth
global NumXP
global NumGold
global PlayerWepaon$
global PlayerArmor$
global PlayerATK
global PlayerDF
' this is an array of items quatities. it has the same size as ItemsSize, the items in this array is quantities of items in player inventory
global PlayerInventoryItemsQuantities
call initPlayerInventory
' Dummy Variables
global DummySpare
global DummyHappy
global DummyName$
global DummyDialogue$
global DummyHealth

' global ItemATK
' global ItemDF
call initPlayerVariables
call froggit
' Game Variables
GameRound = 1
'round loop
PRINT " __         __         __    __   __ "
PRINT "|_    |\ |  |    \  |     |_    (_    (_  "
PRINT "|__  | \|  |__/  |__ |__  __)  __) "
CALL waitMilliseconds 300
PRINT " "
PRINT "CREDITS TO:"
PRINT "David Vidal Garcia"
PRINT "Play-Testing"
PRINT " "
CALL waitMilliseconds 300
PRINT "Danil Korotenko Pavlo"
PRINT "Programing help"
PRINT " "
CALL waitMilliseconds 300
PRINT "Anton Korotenko Danilovich"
PRINT "Lead Programer"
CALL waitMilliseconds 1000
do
    print
    print "Round: "; GameRound
    ' crete new dummy here
    ' assign to it some random name
    PRINT DummyName$; " HAS APEARED!"
    DummyHealth = 20
    DummySpare = 1
    DummyHappy = 1
    print DummyName$ ;"'s Health: "; DummyHealth
    print "your health: "; YourHealth
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
    IF GameRound MOD 3 = 0 THEN
        call SHOP
    end if
    IF GameRound MOD 1 = 0 THEN
       rndenm = int(rnd(1)*3)
    IF rndenm = 1 THEN
    CALL vegetoid
    end if
    IF rndenm = 2 THEN
    CALL froggit
    end if
    IF rndenm = 3 THEN
    CALL moldsmal
    end if
    end if
    IF GameRound MOD 10 = 0 THEN
        call BOSS
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
sub froggit
    DummyHealth = 20
    DummySpare = 1
    DummyHappy = 1
    DummyName$ = "Froggit"
    DummyDialogue$ = "Ribbit,Ribbit"
end sub
sub vegetoid
    DummyHealth = 26
    DummySpare = 2
    DummyHappy = 1
    DummyName$ = "Vegetiod"
    DummyDialogue$ = "Farmed Locally, Very Locally"
end sub
sub moldsmal
    DummySpare = 2
    DummyHappy = 1
    DummyName$ = "Moldsmal"
    DummyDialogue$ = "OK idk what to write here i dont even know what he says"
end sub
sub BOSS
    DummyHealth = 40
    DummySpare = 3
    DummyHappy = 1
    DummyName$ = "Anton2012"
    DummyDialogue$ = "ok this is kinda tought but hey dont give up david :P"
end sub
sub initPlayerInventory
    PlayerInventoryItemsQuantities(1) = int(rnd(1)*5)   '"Crab Apple"
    PlayerInventoryItemsQuantities(2) = int(rnd(1)*4)   '"Sea Tea"
    PlayerInventoryItemsQuantities(3) = 1               '"Cinnamon-Buttersctotch Pie"
    PlayerInventoryItemsQuantities(4) = int(rnd(1)*2)   '"Monster Candy"
    PlayerInventoryItemsQuantities(5) = int(rnd(1)*7)   '"Spider Donut"
end sub
sub loadItem anItemIndex, byref anItemName$, byref anItemHP, byref anItemPrice
    ItemsNames$(1) = "Crab Apple"
    ItemsPrices(1) = 5
    ItemsHPs(1) = 5
    ItemATK(1) = 0
    ItemDF(1) = 0
    ItemsNames$(2) = "Sea Tea"
    ItemsPrices(2) = 5
    ItemsHPs(2) = 8
    ItemATK(2) = 0
    ItemDF(2) = 0
    ItemsNames$(3) = "Cinnamon-Buttersctotch Pie"
    ItemsPrices(3) = 5
    ItemsHPs(3) = 21
    ItemATK(3) = 0
    ItemDF(3) = 0
    ItemsNames$(4) = "Monster Candy"
    ItemsPrices(4) = 5
    ItemsHPs(4) = 5
    ItemATK(4) = 0
    ItemDF(4) = 0
    ItemsNames$(5) = "Spider Donut"
    ItemsPrices(5) = 5
    ItemsHPs(5) = 11
    ItemATK(5) = 0
    ItemDF(5) = 0
    ItemsNames$(6) = "TEST_KNIFE"
    ItemsPrices(6) = 10
    ItemsHPs(6) = 0
    ItemATK(6) = 5
    ItemDF(6) = 0
    ItemsNames$(7) = "TEST_SHIELD"
    ItemsPrices(7) = 9
    ItemsHPs(7) = 0
    ItemATK(7) = 0
    ItemDF(7) = 5
'    ItemsSize = 7 this variable should be set at the beggining of code
' fill output arguments
    anItemName$ = ItemsNames$(anItemIndex)
    anItemHP = ItemsHPs(anItemIndex)
    anItemPrice = ItemsPrices(anItemIndex)
end sub
sub waitMilliseconds aMillisecondsDelay
    ms = time$("milliseconds")
    msNow = ms
    msDiff = msNow - ms
    do
        msNow = time$("milliseconds")
        msDiff = msNow - ms
    loop until msDiff >= aMillisecondsDelay
end sub
' SHOP
sub SHOP
PRINT " __        _    _ "
PRINT "(_   |_|  /  \  |_) "
PRINT "__) |  |  \_/  |   "
PRINT " "
PRINT " "
PRINT " "
    PRINT "HI! Welcome to my shop where you can buy ITEMS, ARMOR and WEAPONS"
    do
        PRINT "Your gold: "; NumGold
        PRINT
        PRINT "ITEMS:"
        for itemIndex = 1 to ItemsSize
            itemName$=""
            itemHP=0
            itemPrice=0
            call loadItem itemIndex, itemName$, itemHP, itemPrice
            PRINT itemIndex; ". "; itemName$; 
            PRINT ". You have: "; PlayerInventoryItemsQuantities(itemIndex); 
            PRINT ". It gives "; itemHP; " HP. It costs: "; itemPrice
        next itemIndex
        PRINT "0. exit shop"
        INPUT "Choose item to buy:" ;itemChoice
        if (itemChoice=0) then
            exit do
        end if
        itemName$=""
        itemHP=0
        itemPrice=0
        call loadItem itemChoice, itemName$, itemHP, itemPrice
        IF ( NumGold >= itemPrice ) THEN
            PlayerInventoryItemsQuantities(itemChoice)=PlayerInventoryItemsQuantities(itemChoice)+1
            NumGold = NumGold - itemPrice
        ELSE
            PRINT "You don't have enough gold"
        end if
    loop until true
end sub
' FIGHT ACT ITEM MERCY
sub FIGHT
    RandomDamage=int(rnd(1)*5)
    RandomDamage=RandomDamage+PlayerATK
    PRINT DummyName$;" took "; RandomDamage; " damege!"
    DummyHealth=DummyHealth - RandomDamage
    PRINT DummyName$;"'s Health:"; DummyHealth
    RandomDamage=int(rnd(1)*5)
    RandomDamage=RandomDamage-PlayerDF
    if RandomDamage<0 then
        RandomDamage=0
    end if
    PRINT "You got "; RandomDamage ; " damage!"
    YourHealth=YourHealth-RandomDamage
    PRINT "Your Health: "; YourHealth
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
    PRINT "Your Health: "; YourHealth
    print
end sub
sub ITEM
    PRINT "CHOSE ITEM"
    for itemIndex = 1 to ItemsSize
        itemName$=""
        itemHP=0
        itemPrice=0
        call loadItem itemIndex, itemName$, itemHP, itemPrice
        PRINT itemIndex; ". "; PlayerInventoryItemsQuantities(itemIndex); " "; itemName$; " gives "; itemHP; " HP"
    next itemIndex
    INPUT "Item:" ;itemChoice
    itemName$=""
    itemHP=0
    itemPrice=0
    call loadItem itemChoice, itemName$, itemHP, itemPrice
    IF PlayerInventoryItemsQuantities(itemChoice)>0 THEN
        YourHealth = YourHealth + itemHP
        PRINT "Your Health ";YourHealth
        PlayerInventoryItemsQuantities(itemChoice)=PlayerInventoryItemsQuantities(itemChoice)-1
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
        PRINT "Your Health "; YourHealth
        print
    end if
end sub
