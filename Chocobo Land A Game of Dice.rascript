// Chocobo Land: A Game of Dice
// #ID = 7211
// timenoe

// Common

function bitFlip(index, addr) => bit(index, addr) > prev(bit(index, addr))

// Constants

mapName = ["Mage Plains", "Sahagin Marsh", "Gigantoad Swamp", "Behemoth Plains", "Morbol Forest", "Cockatrice Wood", "Tonberry Cave", "Goblin Crag", "Lamia Volcano", "Golem's Domain", "Ancient Ruins"]

// Functions

function state() => byte(0x4514)
function mainMenuState() => state() == 3
function mapState() => state() == 6
function gameState() => state() > 4 && state() < 10

function mode() => byte(0x4730)
function storyMode() => mode() == 0
function localVersusMode() => mode() == 1

function map() => byte(0x4731)
function noDemo() => bit3(0x4740) == 0 // Only need to check when in Versus mode
function auto() => bit2(0x4771) == 1 // Only need to check when in Versus mode
function noAuto() => disable_when(auto(), until = mainMenuState()) // Only need to check when in Versus mode
function defaultVersusSettings() => byte(0x4732) == 2 && byte(0x267e9) == 0 && byte(0x267ea) == 0 && byte(0x267f9) == 4 && byte(0x267fa) == 0 && byte(0x2682e) == 0

function progress() => byte(0x4559)
function time() => dword(0x455c)

function mapTime() => dword(0x4748)
function CP() => dword(0x47a0)
function perfectLaps() => byte(0x479c)
function gotFeesCounter() => dword(0x253bc)
function capturesCounter() => dword(0x253c4)

function victory() => bit6(0x4788) == 1 && byte(0x410) != prev(byte(0x410)) && byte(0x410) == 0xe5
function finalSquares() => dword(0x253ac)
function finalMaxSquareCP() => dword(0x253b0)

// Use for save bitflag flips
function activeStory() => gameState() && storyMode()

// Use for story map triggers
function activeStoryMap() => mapState() && storyMode()

// Use for default settings local versus map triggers
function activeDefaultLocalVersusMap() => noAuto() && mapState() && localVersusMode() && noDemo() && defaultVersusSettings()

// Use for misc. challenges
function activeMap() => noAuto() && mapState() && noDemo()

// Achievements
id = 364729
badge = 410249

for map in range(1, 0xb)
{
	points = 5
	if (map == 10) points = 25
	else if (map == 11) points = 10
	achievement(mapName[map - 1], "Complete " + mapName[map - 1] + " for the first time", 5, activeStory() && prev(progress()) == map && progress() == map + 1, id = id, badge = format("", badge))
	id = id + 1
}

allAllies = 0
for allyAddr in range(0x4574, 0x4578) allAllies = allAllies + bitcount(allyAddr)
for allyBit in range(0, 5) allAllies = allAllies + bit(allyBit, 0x4579)
achievement("Chummy Choco", "Unlock 12 allies", 5, activeStory() && prev(allAllies) < 12 && allAllies == 12, id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Popular Poulet", "Unlock 24 allies", 10, activeStory() && prev(allAllies) < 24 && allAllies == 24, id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Pile of Gems", "Unlock 36 allies", 25, activeStory() && prev(allAllies) < 36 && allAllies == 36, id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Ally Army", "Unlock all 46 allies", 50, activeStory() && prev(allAllies) < 46 && measured(allAllies == 46), id = id, badge = format("", badge))
id = id + 1
badge = badge + 1

allArena = bit7(0x457d)
for arenaAddr in range(0x457e, 0x4589) allArena = allArena + bitcount(arenaAddr)
allArena = allArena + bit0(0x458a) + bit1(0x458a) + bit2(0x458a)
achievement("Just the Beginning", "Complete 25 variations of Hidden Arena", 25, activeStory() && prev(allArena) == 24 && allArena == 25, id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Halfway Hero", "Complete 50 variations of Hidden Arena", 50, activeStory() && prev(allArena) == 49 && allArena == 50, id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("End in Sight", "Complete 75 variations of Hidden Arena", 50, activeStory() && prev(allArena) == 74 && allArena == 75, id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Arena Ascension", "Complete all 100 variations of Hidden Arena", 100, activeStory() && prev(allArena) == 99 && measured(allArena == 100), id = id, badge = format("", badge))
id = id + 1
badge = badge + 1

allRevisits = bit5(0x4598) + bit6(0x4598) + bit7(0x4598) + bitcount(0x4599)
achievement("Trip Down Memory Lane", "Revisit and complete all 11 zones after completing 50 variations of Hidden Arena", 25, activeStory() && prev(allRevisits) == 10 && measured(allRevisits == 11), id = id, badge = format("", badge))
id = id + 1
badge = badge + 1

achievement("Galewood", "Complete a local skirmish versus match in Galewood with default settings", 5, activeDefaultLocalVersusMap() && map() == 0xc && trigger_when(victory()), id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Springwood", "Complete a local skirmish versus match in Springwood with default settings", 5, activeDefaultLocalVersusMap() && map() == 0xd && trigger_when(victory()), id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Nameless Cavern", "Complete a local skirmish versus match in Nameless Cavern with default settings", 5, activeDefaultLocalVersusMap() && map() == 0xe && trigger_when(victory()), id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Twilight Cave", "Complete a local skirmish versus match in Twilight Cave with default settings", 5, activeDefaultLocalVersusMap() && map() == 0xf && trigger_when(victory()), id = id, badge = format("", badge))
id = id + 1
badge = badge + 1

achievement("Technicolor", "Complete a perfect lap in story mode", 5, activeStoryMap() && perfectLaps() - prev(perfectLaps()) == 1, id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Yoink", "Capture an enemy square in story mode", 5, activeStoryMap() && capturesCounter() - prev(capturesCounter()) == 1, id = id, badge = format("", badge))
id = id + 1
badge = badge + 1

allSets = 0
for setAddr in range(0x5624, 0x569c, 0x18) allSets = allSets + byte(setAddr)/byte(setAddr)
achievement("Half Zone Tour", "Own 3 different type of squares at once in story mode", 5, activeStoryMap() && prev(allSets) == 2 && allSets == 3, id = id, badge = format("", badge))
id = id + 1
badge = badge + 1
achievement("Full Zone Tour", "Own all 6 different type of squares at once in story mode", 10, prev(allSets) == 5 && measured(allSets == 6, when = activeStoryMap()), id = id, badge = format("", badge))

// Leaderboards
id = 80844

leaderboard("Green Save Crystal (Beat the Game) Speedrun", "", activeStory() && bitFlip(1, 0x4595), always_false(), always_true(), time(), format = "FRAMES", lower_is_better = true, id = id)
id = id + 1
leaderboard("Red Save Crystal (46 Allies) Speedrun", "", activeStory() && prev(allAllies) < 46 && allAllies == 46, always_false(), always_true(), time(), format = "FRAMES", lower_is_better = true, id = id)
id = id + 1
leaderboard("Blue Save Crystal (50 Hidden Arena) Speedrun", "", activeStory() && bitFlip(2, 0x4595), always_false(), always_true(), time(), format = "FRAMES", lower_is_better = true, id = id)
id = id + 1
leaderboard("Yellow Save Crystal (100 Hidden Arena/Zone Revisits) Speedrun", "", activeStory() && bitFlip(3, 0x4595), always_false(), always_true(), time(), format = "FRAMES", lower_is_better = true, id = id)
id = id + 1

for map in range(1, 0xb)
{
	leaderboard(mapName[map - 1] + " - Speedrun", "", activeStoryMap() && map() == map && victory(), always_false(), always_true(), mapTime(), format = "FRAMES", lower_is_better = true, id = id)
	id = id + 1
	leaderboard(mapName[map - 1] + " - Most CP", "", activeStoryMap() && map() == map && victory(), always_false(), always_true(), CP(), format = "VALUE", lower_is_better = false, id = id)
	id = id + 1
	leaderboard(mapName[map - 1] + " - Most Captures", "", activeStoryMap() && map() == map && victory() && capturesCounter() != 0, always_false(), always_true(), capturesCounter(), format = "VALUE", lower_is_better = false, id = id)
	id = id + 1
}

for map in range(0x10, 0x73)
{
	leaderboard("Hidden Arena (ID " + map + ") - Speedrun", "", activeStoryMap() && map() == map && victory(), always_false(), always_true(), mapTime(), format = "FRAMES", lower_is_better = true, id = id)
	id = id + 1
	leaderboard("Hidden Arena (ID " + map + ") - Most CP", "", activeStoryMap() && map() == map && victory(), always_false(), always_true(), CP(), format = "VALUE", lower_is_better = false, id = id)
	id = id + 1
	leaderboard("Hidden Arena (ID " + map + ") - Most Captures", "", activeStoryMap() && map() == map && victory() && capturesCounter() != 0, always_false(), always_true(), capturesCounter(), format = "VALUE", lower_is_better = false, id = id)
	id = id + 1
}