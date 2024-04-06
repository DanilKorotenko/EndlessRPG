' initialize randomizer, if dont use this function, rnd will always return the same sequence of numbers
rndSeed = time$("seconds") / 86400
randomize rndSeed
' Item Variables
global ItemsSize
ItemsSize = 5 ' this variable should contain total number of all items
global ArmorsSize
ArmorsSize = 4
global WeaponsSize
WeaponsSize = 4
' Player Variables
global PlayerCurrentHealth
global PlayerMaxHealth
global PlayerLevel
global PlayerXP
global PlayerGold
global PlayerCurrentArmor ' an index of current player armor from armors array
global PlayerCurrentWeapon ' an index of current player weapon from weapons array
global PlayerVitality
global PlayerStrength
global PlayerAgility
call initPlayerVariables
' this is an array of items quatities. it has the same size as ItemsSize, the items in this array is quantities of items in player inventory
global PlayerInventoryItemsQuantities
call initPlayerInventory
' Dummy Variables
global DummySpare
global DummyHappy
global DummyName$
global DummyDialogue$
global DummyHealth
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
    print DummyName$ ;"'s Health: "; DummyHealth
    print "your health: "; PlayerCurrentHealth
    ' fighting loop
    DO
        'each time we print menu
        PRINT "1. FIGHT"
        PRINT "2. ACT"
        PRINT "3. ITEM"
        PRINT "4. MERCY"
        print "5. Info about me"
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
            CASE 5
                call MyInfo
            CASE ELSE
                PRINT "Invalid choice. Please enter a number from the menu."
        END SELECT
        if PlayerCurrentHealth <= 0 then
            Print "You loose"
            exit do
        end if
        if DummyHappy = 0 then
            PRINT DummyName$; " is smiling"
            DummySpare=DummySpare=-1
        end if
        if DummyHealth <= 0 then
            PlayerXP=PlayerXP+int(rnd(1)*2)
            obtainedGold = int(rnd(1)*10)
            PlayerGold = PlayerGold + obtainedGold
            PRINT "YOU WON!"
            PRINT "you got " ;PlayerXP; " XP"
            PRINT "and " ;obtainedGold; " GOLD"
            PRINT "your total gold " ; PlayerGold
            GameRound = GameRound + 1
            ' go to the next round
            exit do
        end if
        IF DummySpare=0 THEN
            PlayerXP=PlayerXP+int(rnd(1)*2)
            obtainedGold = int(rnd(1)*10)
            PlayerGold = PlayerGold + obtainedGold
            PRINT "YOU WON!"
            PRINT DummyName$
            PRINT "you got " ;PlayerXP; " XP"
            PRINT "and " ;obtainedGold; " GOLD"
            PRINT "your total gold " ; PlayerGold
            GameRound = GameRound + 1
            exit do
        end if
    LOOP UNTIL TRUE
    if PlayerCurrentHealth <= 0 then
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
    PlayerVitality = 1
    PlayerStrength = 1
    PlayerAgility = 1
    PlayerMaxHealth = calculateMaxHP(PlayerVitality, PlayerStrength)
    PlayerCurrentHealth = PlayerMaxHealth
    PlayerLevel=1
    PlayerXP = 0
    PlayerGold = 0
    PlayerCurrentArmor = 1 'Bandage
    PlayerCurrentWeapon = 1 'Stick
end sub
sub froggit
    DummyHealth = randInRange(PlayerCurrentHealth-5, PlayerCurrentHealth+5)
    DummySpare = 1
    DummyHappy = 1
    DummyName$ = "Froggit"
    DummyDialogue$ = "Ribbit,Ribbit"
end sub
sub vegetoid
    DummyHealth = randInRange(PlayerCurrentHealth-5, PlayerCurrentHealth+5)
    DummySpare = 2
    DummyHappy = 1
    DummyName$ = "Vegetiod"
    DummyDialogue$ = "Farmed Locally, Very Locally"
end sub
sub moldsmal
    DummyHealth = randInRange(PlayerCurrentHealth-5, PlayerCurrentHealth+5)
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
' INVENTORY, ITEMS, ARMOR, WEAPONS
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
' fill output arguments
    anItemName$ = ItemsNames$(anItemIndex)
    anItemHP = ItemsHPs(anItemIndex)
    anItemPrice = ItemsPrices(anItemIndex)
end sub
sub loadArmor anArmorIndex, byref anArmorName$, byref anArmorDF, byref anArmorPrice
    ArmorNames$(1) = "Bandage"
    ArmorPrices(1) = 1
    ArmorDFs(1) = 1
    ArmorNames$(2) = "Light shield"
    ArmorPrices(2) = 5
    ArmorDFs(2) = 5
    ArmorNames$(3) = "Medium shield"
    ArmorPrices(3) = 10
    ArmorDFs(3) = 10
    ArmorNames$(4) = "Hard Shield"
    ArmorPrices(4) = 15
    ArmorDFs(4) = 15
' fill output arguments
    anArmorName$ = ArmorNames$(anArmorIndex)
    anArmorDF = ArmorDFs(anArmorIndex)
    anArmorPrice = ArmorPrices(anArmorIndex)
end sub
sub loadWeapon aWeaponIndex, byref aWeaponName$, byref aWeaponATK, byref aWeaponPrice
    WeaponNames$(1) = "Stick"
    WeaponPrices(1) = 1
    WeaponATKs(1) = 2
    WeaponNames$(2) = "Light Weapon"
    WeaponPrices(2) = 5
    WeaponATKs(2) = 5
    WeaponNames$(3) = "Medium Weapon"
    WeaponPrices(3) = 10
    WeaponATKs(3) = 10
    WeaponNames$(4) = "Heavy Weapon"
    WeaponPrices(4) = 15
    WeaponATKs(4) = 15
' fill output arguments
    aWeaponName$ = WeaponNames$(aWeaponIndex)
    aWeaponATK = WeaponATKs(aWeaponIndex)
    aWeaponPrice = WeaponPrices(aWeaponIndex)
end sub
' service subs and funcs/////////////////////////////////////////////////
sub waitMilliseconds aMillisecondsDelay
    ms = time$("milliseconds")
    msNow = ms
    msDiff = msNow - ms
    do
        msNow = time$("milliseconds")
        msDiff = msNow - ms
    loop until msDiff >= aMillisecondsDelay
end sub
function randInRange(aRangeMin, aRangeMax)
    randInRange = int(rnd(1)*(aRangeMax - aRangeMin))+aRangeMin
end function
function calculateMaxHP(aVitality, aStrength)
    calculateMaxHP = 10 + (aVitality * 5) + aStrength
end function
function levelXP '(aLevel)
    levelXP = 10 * PlayerLevel' aLevel
end function
function maxATK(aStrength)
    maxATK = aStrength
end function
function minATK(aStrength)
    minATK = int(aStrength / 2)
end function
function maxDF(anAgility)
    maxDF = anAgility
end function
function minDF(anAgility)
    minDF = int(anAgility / 2)
end function
sub printPlayerArmor
    armorName$=""
    armorDF=0
    armorPrice=0
    call loadArmor PlayerCurrentArmor, armorName$, armorDF, armorPrice
    PRINT "Your current armor: "; armorName$; ". It DF: "; armorDF
end sub
sub printPlayerWeapon
    weaponName$=""
    weaponATK=0
    weaponPrice=0
    call loadWeapon PlayerCurrentWeapon, weaponName$, weaponATK, weaponPrice
end sub
'////////////////////////////////////////////////////////////////////////
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
        PRINT "Your gold: "; PlayerGold
        PRINT
        PRINT "What would you like to buy?"
        PRINT "1. ITEMS"
        PRINT "2. ARMOR"
        PRINT "3. WEAPONS"
        PRINT "0. exit shop"
        INPUT "Your choise:" ;shopChoice
        SELECT CASE shopChoice
            CASE 1
                call SHOPITEMS
            CASE 2
                call SHOPARMOR
            CASE 3
                call SHOPWEAPONS
            CASE 0
                exit do
            CASE ELSE
                PRINT "Invalid choice. Please enter a number from the menu."
        END SELECT
    loop until true
end sub
sub SHOPITEMS
' PRINT " __        _    _ "
' PRINT "(_   |_|  /  \  |_) "
' PRINT "__) |  |  \_/  |   "
' PRINT " ITEMS "
' PRINT " "
' PRINT " "
'     PRINT "HI! Welcome to my shop where you can buy ITEMS, ARMOR and WEAPONS"
    do
        PRINT "Your gold: "; PlayerGold
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
        PRINT "0. back"
        INPUT "Choose item to buy:" ;itemChoice
        if (itemChoice=0) then
            exit do
        else 
            if (itemChoise > ItemsSize) then
                Print "Wrong choise"
            else
                itemName$=""
                itemHP=0
                itemPrice=0
                call loadItem itemChoice, itemName$, itemHP, itemPrice
                IF ( PlayerGold >= itemPrice ) THEN
                    PlayerInventoryItemsQuantities(itemChoice)=PlayerInventoryItemsQuantities(itemChoice)+1
                    PlayerGold = PlayerGold - itemPrice
                ELSE
                    PRINT "You don't have enough gold"
                end if
            end if
        end if
    loop until true
end sub
sub SHOPARMOR
    do
        PRINT "Your gold: "; PlayerGold
        PRINT
        call printPlayerArmor
        PRINT "Your current armor: "; armorName$; ". It DF: "; armorDF
        PRINT
        PRINT "ARMORS:"
        for armorIndex = 1 to ArmorsSize
            armorName$=""
            armorDF=0
            armorPrice=0
            call loadArmor armorIndex, armorName$, armorDF, armorPrice
            PRINT armorIndex; ". "; armorName$; 
            PRINT ". DF: "; armorDF; 
            PRINT ". Price "; armorPrice
        next armorIndex
        PRINT "0. back"
        INPUT "Choose armor to buy:" ;armorChoice
        if (armorChoice=0) then
            exit do
        else
            if (armorChoice=PlayerCurrentArmor) then
                PRINT "You already equipped this armor"
            else
                if (armorChoice > ArmorsSize) then
                    PRINT "Wrong choise"
                else
                    armorName$=""
                    armorDF=0
                    armorPrice=0
                    call loadArmor armorChoice, armorName$, armorDF, armorPrice
                    IF ( PlayerGold >= armorPrice ) THEN
                        PlayerCurrentArmor = armorChoice
                        PlayerGold = PlayerGold - armorPrice
                    ELSE
                        PRINT "You don't have enough gold"
                    end if
                end if
            end if
        end if
    loop until true
end sub
sub SHOPWEAPONS
    do
        PRINT "Your gold: "; PlayerGold
        PRINT
        call printPlayerWeapon
        PRINT
        PRINT "WEAPONS:"
        for weaponIndex = 1 to WeaponsSize
            weaponName$=""
            weaponATK=0
            weaponPrice=0
            call loadWeapon weaponIndex, weaponName$, weaponATK, weaponPrice
            PRINT weaponIndex; ". "; weaponName$; 
            PRINT ". ATK: "; weaponATK; 
            PRINT ". Price "; weaponPrice
        next weaponIndex
        PRINT "0. back"
        INPUT "Choose weapon to buy:" ;weaponChoice
        if (weaponChoice=0) then
            exit do
        else
            if (weaponChoice=PlayerCurrentWeapon) then
                PRINT "You already equipped this weapon"
            else
                if (weaponChoice > WeaponsSize) then
                    PRINT "Wrong choise"
                else
                    weaponName$=""
                    weaponATK=0
                    weaponPrice=0
                    call loadWeapon weaponChoice, weaponName$, weaponATK, weaponPrice
                    IF ( PlayerGold >= weaponPrice ) THEN
                        PlayerCurrentWeapon = weaponChoice
                        PlayerGold = PlayerGold - weaponPrice
                    ELSE
                        PRINT "You don't have enough gold"
                    end if
                end if
            end if
        end if
    loop until true
end sub
' FIGHT ACT ITEM MERCY
sub FIGHT
    armorName$=""
    armorDF=0
    armorPrice=0
    call loadArmor PlayerCurrentArmor, armorName$, armorDF, armorPrice
    weaponName$=""
    weaponATK=0
    weaponPrice=0
    call loadWeapon PlayerCurrentWeapon, weaponName$, weaponATK, weaponPrice
    RandomDamage=int(rnd(1)*5)
    RandomDamage=RandomDamage+weaponATK
    PRINT DummyName$;" took "; RandomDamage; " damege!"
    DummyHealth=DummyHealth - RandomDamage
    PRINT DummyName$;"'s Health:"; DummyHealth
    RandomDamage=int(rnd(1)*5)
    RandomDamage=RandomDamage-armorDF
    if RandomDamage<0 then
        RandomDamage=0
    end if
    PRINT "You got "; RandomDamage ; " damage!"
    PlayerCurrentHealth=PlayerCurrentHealth-RandomDamage
    PRINT "Your Health: "; PlayerCurrentHealth
    print
end sub
sub ACT
    armorName$=""
    armorDF=0
    armorPrice=0
    call loadArmor PlayerCurrentArmor, armorName$, armorDF, armorPrice
    PRINT "you complement " ;DummyName$
    PRINT "It seems flattered"
    DummyHappy = DummyHappy - 1
    RandomDamage=int(rnd(1)*5)
    PRINT "You got "; RandomDamage ; " damage!"
    RandomDamage=RandomDamage-armorDF
    if RandomDamage<0 then
        RandomDamage=0
    end if
    PlayerCurrentHealth=PlayerCurrentHealth-RandomDamage
    PRINT "Your Health: "; PlayerCurrentHealth
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
        PlayerCurrentHealth = PlayerCurrentHealth + itemHP
        PRINT "Your Health ";PlayerCurrentHealth
        PlayerInventoryItemsQuantities(itemChoice)=PlayerInventoryItemsQuantities(itemChoice)-1
    ELSE
        PRINT "you ran out of this item"
    end if
    print
end sub
sub MERCY
    IF DummySpare>0 THEN
        armorName$=""
        armorDF=0
        armorPrice=0
        call loadArmor PlayerCurrentArmor, armorName$, armorDF, armorPrice
        PRINT DummyName$; " is too angry to be spared"
        RandomDamage=int(rnd(1)*5)
        PRINT "You got "; RandomDamage; " damage!"
        RandomDamage=RandomDamage-armorDF
        if RandomDamage<0 then
            RandomDamage=0
        end if
        PlayerCurrentHealth=PlayerCurrentHealth-RandomDamage
        PRINT "Your Health "; PlayerCurrentHealth
        print
    end if
end sub
sub MyInfo
    print "Your health: "; PlayerCurrentHealth; "/"; PlayerMaxHealth
    print "Level: "; PlayerLevel; " EXP: "; PlayerXP; "/"; LevelXP
    print "Vitality (affects max HP):"; PlayerVitality
    print "Strength (affects ATK):"; PlayerStrength
    print "Agility (affects DF):"; PlayerAgility
    print "Gold: "; PlayerGold
    call printPlayerArmor
    call printPlayerWeapon
    print "Your items:"
    for itemIndex = 1 to ItemsSize
        itemName$=""
        itemHP=0
        itemPrice=0
        call loadItem itemIndex, itemName$, itemHP, itemPrice
        PRINT PlayerInventoryItemsQuantities(itemIndex); " "; itemName$; ". It gives "; itemHP; " HP."
    next itemIndex
end sub
