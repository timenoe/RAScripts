// Gurumin: A Monstrous Adventure
// #ID = 3549
// Author: timenoe
// Date Published: 2023-01-??

// Constants
kimono = 7
santaOutfit = 0x12

dialogue = dword(0xe624f0)
dialogueChoice = dword(0xe2e8a0)
dialogueSequenceID = dword(0xe62514)
gameState = dword(0xd6e0cc)
goldMedals = byte(0xe758f8)
headgear = dword(0xd5eab4)
level = dword(0xe30358)
levelTime = dword(0xe75848)/1000.0 - dword(0xe2f900)/1000.0 + dword(0xe2f908)/1000.0
minigameScore = dword(0xe3095c)
outfit = dword(0xe30eec)
platMedals = byte(0xe758df)
room = dword(0xe2e7cc)
textInput = byte(0xd6e282)
totalTime = dword(0xe75840)
xCoordinate = float(0xbdac80)

awardNames = ["Bronze", "Silver", "Gold", "Platinum", "Uranium"]
bossLevelNames = ["Centimeter Hall", "Forest Ballroom", "Ancient Lagoon", "Star Ridge", "Topaz Path", "Oblivion Abyss"]
centimeterHallPresents = [dword(0xe3084c), dword(0xe30ad0)]
characterNames = ["Parin", "Popon"]
crazyMasterLevelNames = ["Nanometer Shrine", "Meter Corridor", "Centimeter Hall", "Mile Palace", "Kilometer Path",
                        "Cheery Forest Path", "Eerie Way", "Forest Ballroom", "Serpent Road", "Bats' Hideaway",
                        "Bracken Hollow", "Forgotten Den", "Ancient Lagoon", "Tumultuous Cave", "Shadow Grotto",
                        "Fairies' Nest", "Sky Steps", "Star Ridge", "Dragon's Back", "Heaven's Hill",
                        "Crystal Way", "Sapphire Line", "Topaz Path", "Ruby Cave", "Amethyst Road",
                        "Oblivion Abyss", "Mole Dojo", "Doc's Lab", "Pecky's Mansion", "Motoro's Gym"]
devDialogueIDs = [0x5c, 0x12a, 0x137, 0x12b, 0x144, 0x1d0, 0x1f5, 0x1e8, 0x218, 0x1ff, 0x23b, 0x200, 0x220, 0x20c, 0x244]
difficultyNames = ["Beginner", "Normal", "Hard", "Happy", "Crazy"]
itemNames = ["Fire Parts", "Shock Parts", "Ice Parts", "Diamond", "Yellow Urn", "Green Urn", "Purple Urn", "Mystery Bag", "Maid Outfit", "Afro", "Sombrero", "Helmet", "Headband", "Samurai Helm", "Magic Hood", "Headdress", "Pharaoh Hat", "Joke Glasses", "Black Urn", "Crown"]
leaderboardBossLevelNames = ["Centimeter Hall", "Forest Ballroom", "Ancient Lagoon", "Star Ridge", "Topaz Path", "Oblivion Abyss", "Boss Rush"]
leaderboardClearNames = ["Any%", "S Rank"]
leaderboardEndingNames = ["Any%", "True Ending"]
leaderboardLevelNames = ["Nanometer Shrine", "Meter Corridor", "Centimeter Hall", "Mile Palace", "Kilometer Path",
                        "Cheery Forest Path", "Eerie Way", "Forest Ballroom", "Serpent Road", "Bats' Hideaway",
                        "Bracken Hollow", "Forgotten Den", "Ancient Lagoon", "Tumultuous Cave", "Shadow Grotto",
                        "Fairies' Nest", "Sky Steps", "Star Ridge", "Dragon's Back", "Heaven's Hill",
                        "Crystal Way", "Sapphire Line", "Topaz Path", "Ruby Cave", "Amethyst Road",
                        "Oblivion Abyss", "Boss Rush"]
leaderboardMinigameLevelNames = ["Mole Dojo vs. Doug", "Mole Dojo vs. Digby", "Doc's Lab", "Pecky's Mansion", "Motoro's Gym"]
minigameLevelNames = ["Mole Dojo", "Doc's Lab", "Pecky's Mansion", "Motoro's Gym"]
monsterNames = ["Poco", "Pierre", "Chucky", "Rocko"]
oblivionAbyssPresents = [dword(0xe30854), dword(0xe30858), dword(0xe3085c), dword(0xe30860), dword(0xe30864), dword(0xe30868)]
pictureNames = ["Lots of Roofs", "Evening Stroll", "Gas Mask Manga", "Everyone's Story", "Nap Time", "Devices and Gear", "A Young Hero", "Redone in Clay", "Yearning for Home"]
platinumMedalLevelNames = ["Tiese Town", "Kilometer Path", "Mile Palace", "Bats' Hideaway", "Serpent Road", "Shadow Grotto", "Tumultuous Cave", "Heaven's Hill", "Dragon's Back", "Ruby Cave", "Amethyst Road"]
specialMoveNames = ["Forward Slash", "Pretty Missile", "Dragon Flame", "Drill Tornado", "Spinning Dance", "Downward Lunge"]

awardOutfit = 
{
    "Bronze": "suit of Armor",
    "Silver": "Princess Dress",
    "Gold": "Vampire Outfit",
    "Platinum": "Witch Outfit",
    "Uranium": "Samurai Outfit"
}
awardTitles = 
{
    "Bronze": "Knight of Tiese",
    "Silver": "Princess Parin",
    "Gold": "Learn from Failure",
    "Platinum": "Parin the Teenage Witch",
    "Uranium": "Monsta-mune"
}
bossClearAddrs = 
{
    "Centimeter Hall": dword(0xe30b2c),
    "Forest Ballroom": dword(0xe30b34),
    "Ancient Lagoon": dword(0xe30b3c),
    "Star Ridge": dword(0xe30b44),
    "Topaz Path": dword(0xe30ba8),
    "Oblivion Abyss": dword(0xe30b8c)
}
bossClearTitles = 
{
    "Centimeter Hall": "Bob the Builder",
    "Forest Ballroom": "Babel Butterfly",
    "Ancient Lagoon": "Fruity Phantom",
    "Star Ridge": "Creme de la Creme",
    "Topaz Path": "Imposter Syndrome",
    "Oblivion Abyss": "Black Bean Soup"
}
itemAddrs = 
{
    "Fire Parts": byte(0xe758ac),
    "Shock Parts": byte(0xe758b7),
    "Ice Parts": byte(0xe758b8),
    "Diamond": byte(0xe758ba),
    "Yellow Urn": byte(0xe758c1),
    "Green Urn": byte(0xe758c3),
    "Purple Urn": byte(0xe758c5),
    "Mystery Bag": byte(0xe758cc),
    "Maid Outfit": bit3(0xe7987e),
    "Afro": byte(0xe758cf),
    "Sombrero": byte(0xe758d0),
    "Helmet": byte(0xe758d4),
    "Headband": byte(0xe758d5),
    "Samurai Helm": byte(0xe758d7),
    "Magic Hood": byte(0xe758d8),
    "Headdress": byte(0xe758d9),
    "Pharaoh Hat": byte(0xe758dd),
    "Joke Glasses": byte(0xe758de),
    "Black Urn": byte(0xe758e0),
    "Crown": byte(0xe758e7)
}
itemLevel = 
{
    "Fire Parts": "Fountain Clearing",
    "Shock Parts": "Asparagus Lake",
    "Ice Parts": "Pimento Park",
    "Diamond": "Tiese Town",
    "Yellow Urn": "Monster Village",
    "Green Urn": "Monster Village",
    "Purple Urn": "Monster Village",
    "Mystery Bag": "N/A",
    "Maid Outfit": "Shadow Grotto",
    "Afro": "Crystal Way",
    "Sombrero": "Tiese Town",
    "Helmet": "Tiese Town",
    "Headband": "Tiese Town",
    "Samurai Helm": "Forgotten Den",
    "Magic Hood": "Tiese Town",
    "Headdress": "Heaven's Hill",
    "Pharaoh Hat": "Tiese Town",
    "Joke Glasses": "Bracken Hollow",
    "Black Urn": "Oblivion Abyss",
    "Crown": "Pimento Park"
}
itemTitles = 
{
    "Fire Parts": "Secret of the Toad",
    "Shock Parts": "Secret of the Seagull",
    "Ice Parts": "Secret of the Park Bench",
    "Diamond": "Flawless Grade",
    "Yellow Urn": "Here Comes the Boom",
    "Green Urn": "We're Friends 'Til the End",
    "Purple Urn": "Merci Monsieur",
    "Mystery Bag": "Roll the Dice",
    "Maid Outfit": "Pa-Rem",
    "Afro": "Time to Get Funky",
    "Sombrero": "Weekend Getaway",
    "Helmet": "Safety First",
    "Headband": "Martial Training",
    "Samurai Helm": "Battle-Hardened",
    "Magic Hood": "Elemental Surge",
    "Headdress": "Drill Mechanic",
    "Pharaoh Hat": "Ancient Artifact",
    "Joke Glasses": "Going Incognito",
    "Black Urn": "Forbidden Power",
    "Crown": "Special Treatment"
}
levelNameID = 
{
    "Tiese Town": 0,
    "Boss Rush": 0,
    "Monster Village": 0,
    "Nanometer Shrine": 1,
    "Meter Corridor": 2,
    "Centimeter Hall": 3,
    "Mile Palace": 4,
    "Kilometer Path": 5,
    "Cheery Forest Path": 6,
    "Eerie Way": 7,
    "Forest Ballroom": 8,
    "Serpent Road": 9,
    "Bats' Hideaway": 10,
    "Bracken Hollow": 11,
    "Forgotten Den": 12,
    "Ancient Lagoon": 13,
    "Tumultuous Cave": 14,
    "Shadow Grotto": 15,
    "Fairies' Nest": 16,
    "Sky Steps": 17,
    "Star Ridge": 18,
    "Dragon's Back": 19,
    "Heaven's Hill": 20,
    "Crystal Way": 21,
    "Sapphire Line": 22,
    "Topaz Path": 23,
    "Ruby Cave": 24,
    "Amethyst Road": 25,
    "Oblivion Abyss": 26,
    "Great Fang": 27,
    "Mole Dojo": 28,
    "Mole Dojo vs. Doug": 28,
    "Mole Dojo vs. Digby": 28,
    "Doc's Lab": 29,
    "Pecky's Mansion": 30,
    "Motoro's Gym": 31,
    "Asparagus Lake": 32,
    "Fountain Clearing": 33,
    "Pimento Park": 34
}
minigameClearAddrs = 
{
    "Mole Dojo": dword(0xe30b98),
    "Doc's Lab": dword(0xe30b9c),
    "Pecky's Mansion": dword(0xe30ba0),
    "Motoro's Gym": dword(0xe30ba4)
}
minigameClearTitles = 
{
    "Mole Dojo": "Parin Used Rock Smash",
    "Doc's Lab": "Hopscotch",
    "Pecky's Mansion": "Whac-A-Mole Winner",
    "Motoro's Gym": "Ackchyually, It's Called Hutbol"
}
monsterFurnitureItems = 
{
    "Poco": ["Boombox", "Shoebox", "Bookshelf", "Stereo", "Phonograph"],
    "Pierre": ["Table", "Hat Rack", "Couch", "Fancy Shelf", "Potted Plant"],
    "Chucky": ["Umbrella Box", "Dresser", "Ducky", "Teddy Bear", "Toy Car"],
    "Rocko": ["Low Table", "Cedar Chest", "Statue", "Old Scroll", "Goldfish"]
}
monsterFurnitureLocations = 
{
    "Poco": ["Meter Corridor", "Eerie Way", "Serpent Road", "Dragon's Back", "Kilometer Path"],
    "Pierre": ["Mile Palace", "Bracken Hollow", "Cheery Forest Path", "Heaven's Hill", "Nanometer Shrine"],
    "Chucky": ["Tumultuous Cave", "Sky Steps", "Crystal Way", "Amethyst Road", "Shadow Grotto"],
    "Rocko": ["Forgotten Den", "Sapphire Line", "Fairies' Nest", "Ruby Cave", "Bats' Hideaway"]
}
monsterFurnitureTitles = 
{
    "Poco": ["Dance is Life", "For What Shoes?!", "Secret Dance Techniques", "Pump It Louder", "Retro Beats"],
    "Pierre": ["Coffee and Croissants", "Not Just a Hat Rack", "Gentlemonster High Life", "Conversation Piece", "Photosynthesis"],
    "Chucky": ["Rain Begone", "Household Essential", "Bathtime Buddy", "Imaginary Friend", "Real Speed"],
    "Rocko": ["Welcome Home", "Rock and Pebble Snacks", "Family Reunion", "Family Heirloom", "Golden the Goldfish"]
}
pictureAddrs = 
{
    "Lots of Roofs": dword(0xe30794),
    "Evening Stroll": dword(0xe3076c),
    "Gas Mask Manga": dword(0xe30764),
    "Everyone's Story": dword(0xe30728),
    "Nap Time": dword(0xe30784),
    "Devices and Gear": dword(0xe3079c),
    "A Young Hero": dword(0xe30744),
    "Redone in Clay": dword(0xe30758),
    "Yearning for Home": dword(0xe3078c)
}
specialMoveAddr = 
{
    "Forward Slash": dword(0xe303a8),
    "Pretty Missile": dword(0xe303b4),
    "Dragon Flame": dword(0xe303b0),
    "Drill Tornado": dword(0xe303bc),
    "Spinning Dance": dword(0xe303c0),
    "Downward Lunge": dword(0xe303b8)
}
specialMovePart = 
{
    "Forward Slash": "Alpha",
    "Pretty Missile": "Beta",
    "Dragon Flame": "Master",
    "Drill Tornado": "Storm",
    "Spinning Dance": "Cyclo",
    "Downward Lunge": "Wind" 
}

// Functions
function anyEnding() => badEnding() || goodEnding()
function badEnding() => inGame() && prev(room) == 0x191 && room == 0x3e6
function character(characterName)
{
    if (characterName == "Parin") return dword(0xe325ac) == 0
    else if (characterName == "Popon") return dword(0xe325ac) == 1
}
function clearAnyLevel() => inGame() && dword(0xe80c9c) == 3 && dword(0xe80cbc) == 1 && prev(dword(0xe80cb4)) < 0x63 && dword(0xe80cb4) >= 0x63
function clearLevel(levelID) => inGame() && level == levelID && dword(0xe80c9c) == 3 && dword(0xe80cbc) == 1 && prev(dword(0xe80cb4)) < 0x63 && dword(0xe80cb4) >= 0x63
function destroyJar() => byte(0xd6f202) < prev(byte(0xd6f202))
function difficulty(difficultyName)
{
    if (difficultyName == "Beginner") return dword(0xe2eef4) == 1
    else if (difficultyName == "Normal") return dword(0xe2eef4) == 0
    else if (difficultyName == "Hard") return dword(0xe2eef4) == 2 && dword(0xe325bc) == 0
    else if (difficultyName == "Happy") return dword(0xe2eef4) == 2 && dword(0xe325bc) == 1
    else if (difficultyName == "Crazy") return dword(0xe2eef4) == 2 && dword(0xe325bc) == 2
}
function endDialogue() => dialogueSequenceID < prev(dialogueSequenceID)
function endMinigame(levelID) => inGame() && level == levelID && prev(dword(0xe30958)) < 0xfffffff0 && dword(0xe30958) >= 0xfffffff0 // signed int
function ending(leaderboardEndingName)
{
    if (leaderboardEndingName == "Any%") return anyEnding()
    else if (leaderboardEndingName == "Bad Ending") return badEnding()
    else if (leaderboardEndingName == "True Ending") return goodEnding()
}
function goodEnding() => inGame() && prev(room) == 0xc && room == 0x3e6
function inGame() => prev(gameState) != 0 && gameState == 1
function maxRank() => ascii_string_equals(0xe80f27, "S+++")
function NG() => dword(0xe3082c) == 0
function NGPlus() => dword(0xe3082c) == 1
function notInGame() => gameState != 0
function openAllPresents(presentAddrs)
{
    trigger = always_true()
    for presentAddr in presentAddrs trigger = trigger && presentAddr == 0x80000001
    return trigger
}
function sRank() => ascii_string_equals(0xe80f27, "S")
function someOpenPresents(presentAddrs)
{
    trigger = always_false()
    for presentAddr in presentAddrs trigger = __ornext(trigger || prev(presentAddr) != 0x80000001)
    return trigger
}
function startDialogue() => prev(dialogueSequenceID) == 0 && dialogueSequenceID == 1

function acquireOmegaDrillParts() => inGame() && level == 0x1f && prev(dword(0xe303cc)) == 0 && dword(0xe303cc) == 1
function changeVoice() => gameState == 0xa && prev(byte(0xd6e0b8)) == 0 && byte(0xd6e0b8) == 1
function destroyMonsterVillageJars() => never(notInGame() || room != 0x191) && once(byte(0xd6f202) == 3) && trigger_when(repeated(3, destroyJar()))
function hoccerChallenge() => inGame() && room == 0x18 && dword(0xe30edc) == 1 && dword(0xe63fb0) == 0 && trigger_when(dword(0xe63fb8) != 0 && prev(dword(0xe30958)) < 0xfffffff0 && dword(0xe30958) >= 0xfffffff0) // signed int
function makePeckyLaugh() => inGame() && room == 0x17 && prev(dword(0xe30fc0)) == 0 && trigger_when(headgear != 0x2a && headgear != 0x38 && dword(0xe30fc0) == 1) // Gas Mask and Monkey Hat both make Pecky laugh while seemingly covering your face. All the other headgear either almost make him laugh, or make him laugh at Parin's real face
function maxAnyHeadgear()
{
    trigger = always_false()
    for headgearAddr in range(0xe31a40, 0xe31a78, 4)
    {
        trigger = trigger || (prev(dword(headgearAddr)) == 3 && dword(headgearAddr) == 4)
    }
    return inGame() && level == 0 && trigger
}
function openBatsHideawayDoor() => inGame() && level == 0xa && room == 0x1fb && dialogueChoice != 3 && prev(dword(0xe307c0)) == 0 && trigger_when(dword(0xe307c0) == 1)
function openCentimeterHallPresents() => inGame() && level == 3 && room == 0x6d && someOpenPresents(centimeterHallPresents) && trigger_when(openAllPresents(centimeterHallPresents))
function openHeavensHillDoor() => inGame() && level == 0x14 && room == 0x25f && prev(dword(0xe307e0)) == 0 && trigger_when(dword(0xe307e0) == 2)
function openOblivionAbyssPresents() => inGame() && room == 0x13b && someOpenPresents(oblivionAbyssPresents) && trigger_when(openAllPresents(oblivionAbyssPresents))
function readDadsBooks() => inGame() && room == 2 && __ornext(dialogue == 0x41e || dialogue == 0x46e) && prev(dialogueSequenceID) == 1 && trigger_when(dialogueChoice == 1 && dialogueSequenceID == 3)
function readUselessSign() => inGame() && level == 0xc && room == 0xcb && trigger_when(__ornext(dialogue == 0xa4 || dialogue == 0xbb) && endDialogue())
function stealFromDisk() => inGame() && room == 5 && trigger_when(__ornext(dialogue == 0xe7 || dialogue == 0xfe) && endDialogue())
function switchWithPopon() => inGame() && room == 0xc && dword(0xe325b8) == 1 && prev(dword(0xe325ac)) == 0 && trigger_when(dword(0xe325ac) == 1)
function talkToDevs()
{
    dialogues = []
    for dialogueID in devDialogueIDs array_push(dialogues, once(dialogue == dialogueID && startDialogue()))
    return never(notInGame() || room != 6) && measured(tally(8, dialogues))
}
function tryRomanceCompatabilityTest() => inGame() && room == 0x16 && __ornext(dialogue == 0x72e || dialogue == 0x750) && prev(dialogueSequenceID) == 1 && trigger_when(dialogueChoice == 1 && textInput != 0 && dialogueSequenceID == 2)
function upgradeAnyHeadgear()
{
    trigger = always_false()
    for headgearAddr in range(0xe31a40, 0xe31a78, 4) trigger = trigger || (dword(headgearAddr) > prev(dword(headgearAddr)))
    return inGame() && level == 0 && trigger
}
function useFortuneTellingMachine() => inGame() && room == 0x16 && __ornext(dialogue == 0x42d || dialogue == 0x4a6) && prev(dialogueSequenceID) == 1 && trigger_when(dialogueChoice == 1 && dialogueSequenceID == 2)
function usePimentoSlide() => inGame() && room == 0x1b && dword(0xe75834) == 0x4e21 && prev(xCoordinate) <= -200.0 && trigger_when(xCoordinate > -200.0)
function wearKimono() => inGame() && room == 2 && dword(0xe3087c) == 1 && prev(outfit) != kimono && trigger_when(outfit == kimono)
function wearSantaOutfit() => inGame() && room == 2 && dword(0xe30878) == 1 && prev(outfit) != santaOutfit && trigger_when(outfit == santaOutfit)

// Achievements
achievement("You Are Worthy", "Acquire the Drill", 1, inGame() && level == 0 && prev(dword(0xe30bc8)) == 0 && dword(0xe30bc8) == 1)

addr = 0xe303d8
for monsterName in monsterNames
{
    index = 0
    for item in monsterFurnitureItems[monsterName]
    {
        trigger = inGame() && level == 0 && bit(index, addr) > prev(bit(index, addr))
        achievement(monsterFurnitureTitles[monsterName][index], "Return the " + item + " to " + monsterName, 5, trigger)
        index = index + 1
    }
    addr = addr + 1
}

for minigameLevelName in minigameLevelNames achievement(minigameClearTitles[minigameLevelName], "Clear the " + minigameLevelName + " minigame for the first time", 5, inGame() && level == levelNameID[minigameLevelName] && prev(minigameClearAddrs[minigameLevelName]) == 0 && minigameClearAddrs[minigameLevelName] != 0)
for bossLevelName in bossLevelNames achievement(bossClearTitles[bossLevelName], "Clear " + bossLevelName + " for the first time", 5, inGame() && level == levelNameID[bossLevelName] && prev(bossClearAddrs[bossLevelName]) == 0 && bossClearAddrs[bossLevelName] != 0)

achievement("False Reality", "Clear the game with the bad ending", 5, badEnding()) // Missable
achievement("Monkey See, Monkey Do", "Clear the game with the True Ending on Beginner difficulty and acquire the Monkey Suit", 5, inGame() && bit0(0xe7987e) > prev(bit0(0xe7987e)))
achievement("Relaxation Break", "Clear the game with the True Ending on Normal difficulty and acquire the Pajamas", 10, inGame() && bit1(0xe7987e) > prev(bit1(0xe7987e)))
achievement("The Year of the Monster", "Clear the game with the True Ending on Hard difficulty and acquire the Chinese Dress", 10, inGame() && bit2(0xe7987e) > prev(bit2(0xe7987e)))
achievement("School's in Session", "Clear the game with the True Ending on Happy difficulty and acquire the School Uniform", 25, inGame() && bit4(0xe7987e) > prev(bit4(0xe7987e)))
achievement("Savage Tendencies", "Clear the game with the True Ending on Crazy difficulty and acquire the Leopard Suit", 50, inGame() && bit0(0xe7987f) > prev(bit0(0xe7987f)))

for specialMoveName in specialMoveNames achievement(specialMoveName, "Buy the " + specialMovePart[specialMoveName] + " Parts and learn the \"" + specialMoveName + "\" Special Move", 5, inGame() && level == 0 && prev(specialMoveAddr[specialMoveName]) == 0 && specialMoveAddr[specialMoveName] == 1)
for pictureName in pictureNames achievement(pictureName, "Add the \"" + pictureName + "\" picture to your Album", 10, inGame() && level == 0 && prev(pictureAddrs[pictureName]) == 0 && pictureAddrs[pictureName] == 1)

achievement("Unlocked Potential", "Upgrade any headgear", 5, upgradeAnyHeadgear())
achievement("Limit Break", "Fully upgrade any headgear", 25, maxAnyHeadgear())

for itemName in itemNames
{
    description = "Acquire "
    if (itemName == "Mystery Bag") description = description + "a Mystery Bag"
    else description = description + "the " + itemName

    points = 10
    if (itemName == "Yellow Urn" || itemName == "Green Urn" || itemName == "Purple Urn" || itemName == "Mystery Bag" || itemName == "Black Urn") points = 1
    
    trigger = inGame()
    if (itemLevel[itemName] != "N/A") trigger = trigger && inGame() && level == levelNameID[itemLevel[itemName]]

    achievement(itemTitles[itemName], description, points, trigger && itemAddrs[itemName] > prev(itemAddrs[itemName]))
}

for platinumMedalLevelName in platinumMedalLevelNames achievement("Secret of " + platinumMedalLevelName, "Find the Platinum Medal in " + platinumMedalLevelName, 10, inGame() && level == levelNameID[platinumMedalLevelName] && platMedals > prev(platMedals))
achievement("Motoro the Medal Maniac", "Acquire the Omega Parts from Motoro in exchange for 11 Platinum Medals", 25, acquireOmegaDrillParts())

for crazyMasterLevelName in crazyMasterLevelNames
{
    points = 10
    if (crazyMasterLevelName == "Oblivion Abyss") points = 25

    trigger = difficulty("Crazy") && inGame() && level == levelNameID[crazyMasterLevelName]
    if (crazyMasterLevelName == "Sky Steps") trigger = trigger && room == 0x264
    else if (crazyMasterLevelName == "Dragon's Back") trigger = trigger && room == 0x263
    
    achievement(crazyMasterLevelName + " Master", "Earn a Gold Medal in " + crazyMasterLevelName + " on Crazy difficulty", points, trigger && goldMedals > prev(goldMedals))
}

achievement("Over and Under", "Earn a Gold Medal after the minecart segment in Sky Steps", 10, inGame() && level == 0x11 && room == 0x262 && goldMedals > prev(goldMedals))
achievement("Loop de Loop", "Earn a Gold Medal after the minecart segment in Dragon's Back", 10, inGame() && level == 0x13 && room == 0x262 && goldMedals > prev(goldMedals))

index = 0
addr = 0xe75900
for awardName in awardNames
{
    points = 25
    if (index == 0) points = 10
    else if (index == 3) points = 50
    else if (index == 4) points = 100
    
    achievement(awardTitles[awardName], "Trade 30 Gold Medals with Hyperbolic on " + difficultyNames[index] + " difficulty and acquire the " + awardName + " Award and the " + awardOutfit[awardName], points, inGame() && level == 0 && prev(byte(addr)) == 0 && byte(addr) == 1)
    index = index + 1
    addr = addr + 1
}

achievement("Step it Up", "Clear the Boss Rush on Beginner or Normal difficulty and acquire the Workout Gear", 10, inGame() && level == 0 && bit5(0xe7987e) > prev(bit5(0xe7987e)))
achievement("On the Grind", "Clear the Boss Rush on Hard difficulty and acquire the Work Uniform", 25, inGame() && level == 0 && bit7(0xe7987e) > prev(bit7(0xe7987e)))
achievement("Certified R.N.", "Clear the Boss Rush on Happy difficulty and acquire the Nurse Outfit", 25, inGame() && level == 0 && bit6(0xe7987e) > prev(bit6(0xe7987e)))
achievement("Pari-don", "Clear the Boss Rush on Crazy difficulty and acquire the Swimsuit", 50, inGame() && level == 0 && bit1(0xe7987f) > prev(bit1(0xe7987f)))

achievement("How Dare You?!", "Make Pecky laugh with your real face", 1, makePeckyLaugh()) // Missable
achievement("Mark of the Sentry", "Have the Sentry open the gate to Bats' Hideaway without paying for entry", 10, openBatsHideawayDoor()) // Missable
achievement("True Heir of the Drill", "Have the Sentry open the gate to Heaven's Hill without performing a Special Move", 5, openHeavensHillDoor()) // Missable

achievement("Maximum Overdrive", "Clear a level with an S+++ rank", 5, clearAnyLevel() && maxRank())

achievement("Cities of the World", "Read the books from Dad in Parin's room", 1, readDadsBooks())
achievement("Honest Mistake", "Attempt to steal from Disk's Discount Shop", 1, stealFromDisk())
achievement("Snacks for the Road", "Collect the items from both presents at the entrance of Centimeter Hall", 1, openCentimeterHallPresents())
achievement("Token Useless Sign", "Read the useless sign in Spinach Caverns - Forgotten Den", 1, readUselessSign())
achievement("Mushy Machine", "Try the Romance Compatability Test in Doc's Lab", 1, tryRomanceCompatabilityTest())
achievement("Miss Lucky", "Use the fortunetelling machine in Doc's Lab", 1, useFortuneTellingMachine())
achievement("Embrace Your Youth", "Slide down the slide in Pimento Park", 1, usePimentoSlide())
achievement("FIHA World Cup Champs", "Win a game of Hoccer without letting Motoro's team score", 10, hoccerChallenge())
achievement("Search and Destroy", "Destroy all 3 jars in Monster Village", 3, destroyMonsterVillageJars())
achievement("Bad Omen", "Collect the items from all 6 presents at the entrance of Oblivion Abyss", 3, openOblivionAbyssPresents())

achievement("Ojii-San", "Change the cutscenes to Japanese on the difficulty select screen after clearing the True Ending", 1, changeVoice())
achievement("New Girl in Town", "Switch places with Popon", 1, switchWithPopon())
achievement("One Person at First", "Talk to all 8 bosses in the Boss Rush room", 1, talkToDevs())

achievement("'Tis the Season", "Try on the Santa Outfit sometime during Christmas", 1, wearSantaOutfit())
achievement("Traditional Attire", "Try on the Kimono sometime during the New Year", 1, wearKimono())

// Leaderboards
id = 86771
for leaderboardEndingName in leaderboardEndingNames
{
    for difficultyName in difficultyNames
    {
        description = "Clear the game "
        if (leaderboardEndingName == "True Ending") description = description + "with the True Ending "
        
        leaderboard(leaderboardEndingName + " Speedrun - " + difficultyName + " - NG", description + "on " + difficultyName + " difficulty during a NG playthrough in the fastest time", difficulty(difficultyName) && NG() && ending(leaderboardEndingName), always_false(), always_true(), measured(totalTime), format="SECS", lower_is_better=true, id=id)
        leaderboard(leaderboardEndingName + " Speedrun - " + difficultyName + " - NG+", description + "on " + difficultyName + " difficulty during a NG+ playthrough in the fastest time", difficulty(difficultyName) && NGPlus() && ending(leaderboardEndingName), always_false(), always_true(), measured(totalTime), format="SECS", lower_is_better=true, id=id+1)
        id = id + 2
    }
}

for levelName in leaderboardLevelNames
{
    for leaderboardClearName in leaderboardClearNames
    {
        for difficultyName in difficultyNames
        {
            for characterName in characterNames
            {
                if (leaderboardClearName == "Any%")
                {
                    description = "Clear "
                    if (levelName == "Boss Rush") description = description + "the "
                    
                    leaderboard(levelName + " Speedrun - " + difficultyName + " - " + characterName, description + levelName + " on " + difficultyName + " difficulty using " + characterName + " in the fastest time", difficulty(difficultyName) && character(characterName) && clearLevel(levelNameID[levelName]), always_false(), always_true(), measured(levelTime), format="SECS", lower_is_better=true, id=id)
                    id = id + 1
                }
                else if (leaderboardClearName == "S Rank" && none_of(leaderboardBossLevelNames, s => s == levelName))
                {
                    leaderboard(levelName + " S Rank Speedrun - " + difficultyName + " - " + characterName, "Clear " + levelName + " on " + difficultyName + " difficulty using " + characterName + " with an S rank in the fastest time", difficulty(difficultyName) && character(characterName) && clearLevel(levelNameID[levelName]) && sRank(), always_false(), always_true(), measured(levelTime), format="SECS", lower_is_better=true, id=id)
                    id = id + 1
                }
            }
        }
    }
}

for minigameName in leaderboardMinigameLevelNames
{
    for difficultyName in difficultyNames
    {
        for characterName in characterNames
        {
            start = difficulty(difficultyName) && character(characterName) && endMinigame(levelNameID[minigameName])
            if (minigameName == "Mole Dojo vs. Doug") start = start && dword(0xe30c08) == 0
            else if (minigameName == "Mole Dojo vs. Digby") start = start && dword(0xe30c08) == 1

            leaderboard(minigameName + " High Score" + " - " + difficultyName + " - " + characterName, "Complete the " + minigameName + " minigame on " + difficultyName + " difficulty using " + characterName + " with the highest score", start, always_false(), always_true(), measured(minigameScore), format="VALUE", lower_is_better=false, id=id)
            id = id + 1
            if (id == 87266) id = 87273
            else if (id == 87278) id = 87455
        }
    }
}