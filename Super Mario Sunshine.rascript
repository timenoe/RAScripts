// Super Mario Sunshine
// #ID = 6049
// timenoe

//// Constants

courseName = ["Bianco Hills", "Ricco Harbor", "Gelato Beach", "Pinna Park", "Sirena Beach", "Noki Bay", "Pianta Village"]

episodeShinesTitle = ["Country Livin'", "Work-Life Balance", "Beach Bum", "Childhood Dream", "All-Exclusive Stay", "Out of This World", "Honorary Pianta"]
secretShinesTitle = ["Cave Story", "Pure-Bred Blooper", "Magic Castle", "Ring Around the Rosie", "Welcome to the Hotel Delfino", "Sea Shells by the Sea Shore", "King of the Underground"]
coinShineTitle = ["Bianco Bullion", "Rare Catch", "Metal Detector Mario", "Lost and Found", "Tip the Staff", "Ancient Arifacts", "Toadstool Tour"]
blueCoinsTitle = ["Traveling Shower Service", "Klamber Chaos", "Wakey, Wakey, Cataquack", "Break the Targets", "Waterlogged Furniture", "Rule 1: Check Waterfalls", "Blue Moon"]

timedRedCoinCourses = [0x2f, 0x2e, 0x30, 0x20, 0x32, 0x29, 0x07, 0x33, 0x28, 0x1f, 0x2a, 0x14]
timedRedCoinTitles = ["Red Coins of the Hillside Cave", "Red Coins of the Dirty Lake", "Red Coins in Ricco Tower", "Red Coins in the Sand Castle", "Red Coins in the Cannon", "Red Coins in the Yoshi-Go-Round", "Red Coins in the Hotel", "Red Coins in Boo's Big Mouth", "Red Coin Winnings in the Casino", "Red Coins on the Half Shell", "Red Coin Chucksters", "Red Coin Waterworks"]
raceCourses = [0x4, 0x9, 0x8]
raceCourseStates = [4, 4, 1]
raceTitles = ["Il Piantissimo's Sand Sprint", "Il Piantissimo's Surf Swim", "Il Piantissimo's Crazy Climb"]

bitflagBaseAddr = 0x00578940

// Progression

firstShineAddr = [6, 0x00578992]
unlockBiancoHillsAddr = [4, 0x005789f8]
unlockYoshiAddr = [1, 0x0057898c]
befriendYoshiAddr = [7, 0x005789f9]
unlockDelfinoTurboAddr = [7, 0x005789f4]
finalShineAddr = [7, 0x00578996]

// Collection 1

episodeShineBaseAddr = [0, 0x00578988]
coinShineBaseAddr = [4, 0x00578994]
blueCoinsBaseAddr = [[2, 0x0057899d], [4, 0x005789a3], [6, 0x005789a9], [0, 0x005789b0], [2, 0x005789b6], [4, 0x005789bc], [6, 0x005789c2]]

// Collection 2

plazaShineAddr = [[5, 0x00578993], [6, 0x00578993], [7, 0x00578993], [0, 0x00578994], [1, 0x00578994], [2, 0x00578994], [3, 0x00578994], [4, 0x00578996], [5, 0x00578996], [6, 0x00578996]]
slideShineAddr = [2, 0x00578993]
pachinkoShineAddr = [1, 0x00578993]
lilyShineAddr = [3, 0x00578993]
turboShineAddr = [7, 0x00578992]
fieldShineAddr = [4, 0x00578993]
tradeShineBaseAddr = [[6, 0x00578990], [4, 0x00578995]]
tradeShineCount = [16, 8]
plazaCoinShineAddr = [3, 0x00578995]
plazaBlueCoinBaseAddr = [1, 0x00578997]
coronaBlueCoinBaseAddr = [4, 0x005789cb]
airstripShineAddr = [0, 0x00578993]
airstripBlueCoinAddr = [0, 0x00578997]

// Secret

tropicalFitAddr = [5, 0x00578a6d]

// Leaderboards

boxingCleverAddr = [6, 0x00578993]
reachRaceFlagAddr = [5, 0x00578a6c]

//// Functions

function nextBit(addr)
{
	if (addr[0] == 7) return [0, addr[1] + 1]
	else return [addr[0] + 1, addr[1]]
}

function regionPtr() => dword_be(0x00005518) & 0x7fffffff

function course() => byte(regionPtr() + 0x0000000e)
function courseState() => byte(regionPtr() + 0x0000000f)
function inACourse() => course() != 0xf
function inACourseOrEnding() => course() != 0xf && notLoading() || course() == 0xf && watching()

function inAirstrip() => course() == 0
function inPinnaParkBeach() => course() == 5
function inEnding() => course() == 0xf

function inEpisodeShineCourse(course)
{
	if (course == 0) return __ornext(course() == 2 || course() == 0x2e || course() == 0x2f || course() == 0x37) //Bianco Hills
	else if (course == 1) return __ornext(course() == 3 || course() == 0x1e || course() == 0x30 || course() == 0x3b) //Ricco Harbor
	else if (course == 2) return __ornext(course() == 4 || course() == 0x20 || course() == 0x21) //Gelato Beach
	else if (course == 3) return __ornext(course() == 5 || course() == 0xd || course() == 0x29 || course() == 0x32) //Pinna Park
	else if (course == 4) return __ornext(course() == 6 || course() == 7 || course() == 0xe || course() == 0x28 || course() == 0x33 || course() == 0x38) //Sirena Beach
	else if (course == 5) return __ornext(course() == 9 || course() == 0x10 || course() == 0x1f || course() == 0x2c || course() == 0x39) //Noki Bay
	else if (course == 6) return __ornext(course() == 8 || course() == 0x2a) //Pianta Village
}
function inSecretShineCourse(course)
{
	if (course == 0) return __ornext(course() == 0x2e || course() == 0x2f) //Bianco Hills
	else if (course == 1) return __ornext(course() == 0x1e || course() == 0x30) //Ricco Harbor
	else if (course == 2) return __ornext(course() == 4 || course() == 0x20) //Gelato Beach
	else if (course == 3) return __ornext(course() == 0x29 || course() == 0x32) //Pinna Park
	else if (course == 4) return __ornext(course() == 0x28 || course() == 0x33) //Sirena Beach
	else if (course == 5) return __ornext(course() == 9 || course() == 0x1f) //Noki Bay
	else if (course == 6) return __ornext(course() == 8 || course() == 0x2a) //Pianta Village
}
function inYellowCoinCourse(course)
{
	if (course == 0) return __ornext(course() == 2 || course() == 0x2f || course() == 0x37) //Bianco Hills
	else if (course == 1) return __ornext(course() == 3 || course() == 0x30 || course() == 0x3b) //Ricco Harbor
	else if (course == 2) return __ornext(course() == 4 || course() == 0x20 || course() == 0x21) //Gelato Beach
	else if (course == 3) return __ornext(course() == 5 || course() == 0xd || course() == 0x29 || course() == 0x32) //Pinna Park
	else if (course == 4) return __ornext(course() == 6 || course() == 7 || course() == 0xe || course() == 0x38) //Sirena Beach
	else if (course == 5) return __ornext(course() == 9 || course() == 0x10 || course() == 0x1f || course() == 0x39) //Noki Bay
	else if (course == 6) return __ornext(course() == 8 || course() == 0x2a) //Pianta Village
}
function inBlueCoinCourse(course)
{
	if (course == 0) return course() == 2 //Bianco Hills
	else if (course == 1) return __ornext(course() == 3 || course() == 0x3b) //Ricco Harbor
	else if (course == 2) return __ornext(course() == 4 || course() == 0x21) //Gelato Beach
	else if (course == 3) return __ornext(course() == 5 || course() == 0xd) //Pinna Park
	else if (course == 4) return __ornext(course() == 6 || course() == 7 || course() == 0xe) //Sirena Beach
	else if (course == 5) return __ornext(course() == 9 || course() == 0x10 || course() == 0x39) //Noki Bay
	else if (course == 6) return course() == 8 //Pianta Village
}

function inPlaza() => course() == 1
function inSlide() => course() == 0x15
function inPachinko() => course() == 0x16
function inLily() => course() == 0x18
function inTurbo() => course() == 0x1d
function inField() => course() == 0x17
function inCoronaMain() => course() == 0x34
function inAirstripNew() => course() == 0x14
function inCaveSecret() => course() == 0x2f
function inLakeSecret() => course() == 0x2e

function cutscene() => byte(regionPtr() + 0x0000001b)

function gamePtr() => dword_be(regionPtr() + 0x00000004) & 0x7fffffff
function validPtr() => prev(dword_be(0x00005518)) != 0 && dword_be(regionPtr() + 0x00000004) != 0 // The prev protects against a potential memory flicker
function gameState() => byte(gamePtr() + 0x00000064)
function notLoading() => gameState() != 0
function active() => gameState() == 4
function watching() => gameState() == 0x78

function hudPtr() => dword_be(gamePtr() + 0x00000074) & 0x7fffffff
function timerActive() => byte(hudPtr() + 0x0000004a) == 1
function timerComplete() => byte(hudPtr() + 0x0000004a) < prev(byte(hudPtr() + 0x0000004a))
function timer() => dword_be(hudPtr() + 0x00000500)

function scriptPtr() => dword_be(gamePtr() + 0x00000080) & 0x7fffffff
function winBoxingClever()
{
	return __ornext(courseState() == 2 || courseState() == 6 || courseState() == 7) && prev(word_be(scriptPtr() + 0x00000f2e)) == 0x470 && word_be(scriptPtr() + 0x00000f2e) == 0x32f || 
	courseState() == 8 && prev(word_be(scriptPtr() + 0x0000124a)) == 0x470 && word_be(scriptPtr() + 0x0000124a) == 0x32f || 
	courseState() == 5 && prev(word_be(scriptPtr() + 0x00001566)) == 0x470 && word_be(scriptPtr() + 0x00001566) == 0x32f
}
function finishBlooperRace() => prev(word_be(scriptPtr() + 0x00000372)) == 0x38a && word_be(scriptPtr() + 0x00000372) == 0x46e
function cleanTheBeach() => prev(word_be(scriptPtr() + 0x00000372)) == 0x1c3 && word_be(scriptPtr() + 0x00000372) == 0x2cd
function winMonteRace(course)
{
	if (course == 4 || course == 9) return word_be(scriptPtr() + 0x0000068e) == 0x27d && reachRaceFlag() // Gelato or Noki
	else return word_be(scriptPtr() + 0x00000372) == 0x279 && reachRaceFlag() // Pianta
}

function bitflagPtr() => dword_be(regionPtr() + 0x00000034) & 0x7fffffff
function regionBit(addr) => bit(addr[0], bitflagPtr() + addr[1] - bitflagBaseAddr)
function countRegionBits(addr, count)
{
	sum = 0
	for bit in range(1, count)
	{
		sum = sum + regionBit(addr)
		addr = nextBit(addr)
	}
	return sum
}
function regionBitflip(addr) => regionBit(addr) > prev(regionBit(addr))
function allEpisode7s()
{
	sum = 0
	addr = episodeShineBaseAddr
	for course in range(1, 7)
	{
		for episode in range(1, 10)
		{
			if (episode == 7) sum = sum + regionBit(addr)
			addr = nextBit(addr)
		}
	}
	return sum
}
function totalShines() => dword_be(bitflagPtr() + 0x00578a58 - bitflagBaseAddr)
function boxingClever(level) => countRegionBits(boxingCleverAddr, 2) == level - 1
function redCoins() => dword_be(bitflagPtr() + 0x00578a7c - bitflagBaseAddr)
function allRedCoins() => prev(redCoins()) == 7 && redCoins() == 8
function piantasRescued() => dword_be(bitflagPtr() + 0x00578a84 - bitflagBaseAddr)
function allPiantasRescued() => piantasRescued() == 10
function reachRaceFlag() => regionBit(reachRaceFlagAddr) > prev(regionBit(reachRaceFlagAddr))

//// Achievements

// Template: achievement(title, description, points, trigger, id=0, published="", modified="", badge="0")

// Progression

achievement("Delfino Airstrip Dilemma", "Collect the first Shine Sprite in Delfino Airstrip", 1, validPtr() && inAirstrip() && notLoading() && regionBitflip(firstShineAddr))
achievement("New Challenger Approaching", "Defeat the Polluted Piranha covering the Grand Pianta Statue", 2, validPtr() && inPlaza() && notLoading() && regionBitflip(unlockBiancoHillsAddr))
achievement("Boathouse Blues", "Collect 3 Shine Sprites", 3, validPtr() && inACourse() && notLoading() && prev(totalShines()) < 3 && totalShines() == 3)
achievement("Shiny Landmark", "Collect 5 Shine Sprites", 5, validPtr() && inACourse() && notLoading() && prev(totalShines()) < 5 && totalShines() == 5)
achievement("Kidnapped...Again?!", "Collect 10 Shine Sprites", 5, validPtr() && inACourse() && notLoading() && prev(totalShines()) < 10 && totalShines() == 10)
achievement("Retro Reunion", "Complete Episode 4 of Pinna Park", 5, validPtr() && inPinnaParkBeach() && notLoading() && regionBitflip(unlockYoshiAddr))
achievement("Look into the Light", "Collect 20 Shine Sprites", 10, validPtr() && inACourse() && notLoading() && prev(totalShines()) < 20 && totalShines() == 20)
achievement("Time to Speed Things Up", "Collect 25 Shine Sprites and befriend Yoshi", 10, validPtr() && inACourse() && notLoading() && __ornext(prev(totalShines()) < 20 || prev(regionBit(befriendYoshiAddr)) == 0) && totalShines() == 20 && regionBit(befriendYoshiAddr) == 1)
achievement("First Jump Man, Now Rocket Man", "Collect 30 Shine Sprites and obtain the Turbo Nozzle in Delfino Plaza", 10, validPtr() && inACourse() && notLoading() && __ornext(prev(totalShines()) < 30 || prev(regionBit(unlockDelfinoTurboAddr)) == 0) && totalShines() == 30 && regionBit(unlockDelfinoTurboAddr) == 1)
achievement("Shadow Tsunami", "Complete Episode 7 in all 7 main courses", 10, prev(allEpisode7s()) == 6 && measured(allEpisode7s() == 7, when = validPtr()) && inACourse() && notLoading())
achievement("Bonding Time", "Collect the final Shine Sprite in Corona Mountain", 25, validPtr() && inEnding() && watching() && regionBitflip(finalShineAddr))

// Collection 1

coinShineAddr = coinShineBaseAddr
for course in range(0, 6)
{
	episodeShineAddr = episodeShineBaseAddr
	if (course > 0) for counter in range(1, course*10) episodeShineAddr = nextBit(episodeShineAddr)
	achievement(episodeShinesTitle[course], "Complete all 8 episodes in " + courseName[course], 10, prev(countRegionBits(episodeShineAddr, 8)) == 7 && measured(countRegionBits(episodeShineAddr, 8) == 8, when = validPtr()) && inEpisodeShineCourse(course) && notLoading())
	
	secretShineAddr = episodeShineBaseAddr
	for counter in range(1, 8 + course*10) secretShineAddr = nextBit(secretShineAddr)
	achievement(secretShinesTitle[course], "Collect both secret Shine Sprites in " + courseName[course], 5, prev(countRegionBits(secretShineAddr, 2)) == 1 && measured(countRegionBits(secretShineAddr, 2) == 2, when = validPtr()) && inSecretShineCourse(course) && notLoading())
	
	achievement(coinShineTitle[course], "Gather 100 Yellow Coins and collect the Shine Sprite in " + courseName[course], 5, validPtr() && inYellowCoinCourse(course) && notLoading() && regionBitflip(coinShineAddr))
	coinShineAddr = nextBit(coinShineAddr)
	
	achievement(blueCoinsTitle[course], "Collect all 30 Blue Coins in " + courseName[course], 25, prev(countRegionBits(blueCoinsBaseAddr[course], 30)) == 29 && measured(countRegionBits(blueCoinsBaseAddr[course], 30) == 30, when = validPtr()) && inBlueCoinCourse(course) && notLoading())
}

// Collection 2

plazaShines = 0
for shine in range(0, length(plazaShineAddr) - 1) plazaShines = plazaShines + regionBit(plazaShineAddr[shine])
achievement("Janitor of the Year", "Collect all 10 Shine Sprites within Delfino Plaza", 25, prev(plazaShines) == 9 && measured(plazaShines == 10, when = validPtr()) && inPlaza() && notLoading())

achievement("Slip and Slide", "Collect the Shine Sprite in Super Slide", 3, validPtr() && inSlide() && notLoading() && regionBitflip(slideShineAddr))
achievement("Nothing But Pain", "Collect the Shine Sprite in Pachinko Game", 5, validPtr() && inPachinko() && notLoading() && regionBitflip(pachinkoShineAddr))
achievement("Thank You Lilly", "Collect the Shine Sprite in Lily Pad Ride", 5, validPtr() && inLily() && notLoading() && regionBitflip(lilyShineAddr))
achievement("F-Zero Sunshine", "Collect the Shine Sprite in Turbo Track", 3, validPtr() && inTurbo() && notLoading() && regionBitflip(turboShineAddr))
achievement("Scavenger Hunt", "Collect the Shine Sprite in Red Coin Field", 3, validPtr() && inField() && notLoading() && regionBitflip(fieldShineAddr))

tradedBlueCoins = 0
for bitBlock in range(0, length(tradeShineBaseAddr) - 1)
{
	tradeShineAddr = tradeShineBaseAddr[bitBlock]
	for trade in range(1, tradeShineCount[bitBlock])
	{
		tradedBlueCoins = tradedBlueCoins + regionBit(tradeShineAddr) * 10
		tradeShineAddr = nextBit(tradeShineAddr)
	}
}
achievement("Inequivalent Exchange", "Trade all 240 Blue Coins for 24 Shine Sprites in the boathouse of Delfino Plaza", 25, prev(tradedBlueCoins) < 240 && measured(tradedBlueCoins == 240, when = validPtr()) && inPlaza() && notLoading())

achievement("Easy Way or the Hard Way", "Gather 100 Yellow Coins and collect the Shine Sprite in Delfino Plaza, Red Coin Field, or Delfino Airstrip", 5, validPtr() && __ornext(inPlaza() || inField() || inAirstripNew()) && notLoading() && regionBitflip(plazaCoinShineAddr))

achievement("Surf and Turf", "Collect all 19 Blue Coins in Delfino Plaza", 25, prev(countRegionBits(plazaBlueCoinBaseAddr, 19)) == 18 && measured(countRegionBits(plazaBlueCoinBaseAddr, 19) == 19, when = validPtr()) && inPlaza() && notLoading())

achievement("Get Rich or Die Trying", "Collect all 10 Blue Coins in Corona Mountain", 10, prev(countRegionBits(coronaBlueCoinBaseAddr, 10)) == 9 && measured(countRegionBits(coronaBlueCoinBaseAddr, 10) == 10, when = validPtr()) && inCoronaMain() && notLoading())

achievement("Red Coin Waterworks", "Collect the Shine Sprite in Delfino Airstrip after visiting Corona Mountain", 3, validPtr() && inAirstripNew() && notLoading() && regionBitflip(airstripShineAddr))
achievement("Melty Block", "Collect the Blue Coin in Delfino Airstrip after visiting Corona Mountain", 2, validPtr() && inAirstripNew() && notLoading() && regionBitflip(airstripBlueCoinAddr))

achievement("Shine On!", "Collect all 120 Shine Sprites", 50, validPtr() && inACourseOrEnding() && prev(totalShines()) < 120 && totalShines() == 120)

allBlueCoins = 0
allBlueCoins = allBlueCoins + regionBit(airstripBlueCoinAddr) // Delfino Airstrip Blue Coin
allBlueCoins = allBlueCoins + countRegionBits(plazaBlueCoinBaseAddr, 19) // Delfino Plaza Blue Coins
for course in range(0, 6) allBlueCoins = allBlueCoins + countRegionBits(blueCoinsBaseAddr[course], 30) // Main Course Blue Coins
allBlueCoins = allBlueCoins + countRegionBits(coronaBlueCoinBaseAddr, 10) // Corona Mountain Blue Coins
achievement("Tanuki Time", "Collect all 240 Blue Coins", 50, prev(allBlueCoins) == 239 && measured(allBlueCoins == 240, when = validPtr()) && inACourse() && notLoading())

// Secrets

achievement("Optometrist Approved", "Borrow a pair of sunglasses from a Pianta", 2, validPtr() && inACourse() && notLoading() && regionBitflip(tropicalFitAddr))
achievement("Ready to Party", "Borrow a tropical shirt from a Pianta", 3, validPtr() && inACourse() && notLoading() && regionBit(finalShineAddr) == 1 && regionBitflip(tropicalFitAddr))
achievement("Have a Relaxing Vacation", "View the alternate ending", 5, validPtr() && inEnding() && watching() && prev(cutscene()) == 0xf && cutscene() == 0x11)

//// Leaderboards

// Template: leaderboard(title, description, start, cancel, submit, value, format="VALUE", lower_is_better=false, id=0)

// Countdown timers
for level in range(1, 3) leaderboard("Boxing Clever " + level + " Speedrun", "", inPlaza() && boxingClever(level) && timerComplete() && winBoxingClever(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false, id=0)
for course in range(0, length(timedRedCoinCourses) - 1) leaderboard(timedRedCoinTitles[course] + " Speedrun", "", course() == timedRedCoinCourses[course] && timerComplete() && allRedCoins(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false, id=0)
leaderboard("Scrubbing Sirena Beach Speedrun", "", course() == 0x6 && courseState() == 5 && timerComplete() && cleanTheBeach(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false, id=0)
leaderboard("Piantas in Need Speedrun", "", course() == 0x8 && courseState() == 5 && timerComplete() && allPiantasRescued(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false, id=0)

// Race timers
leaderboard("Blooper Surfing Safari Speedrun", "", course() == 0x1e && timerComplete() && finishBlooperRace(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=true, id=0)
for course in range(0, length(raceCourses) - 1) leaderboard(raceTitles[course] + " Speedrun", "", course() == raceCourses[course] && courseState() == raceCourseStates[course] && timerComplete() && reachRaceFlag(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=true, id=0) // Don't do winMonteRace() because Monteman gets faster and faster to keep up with the record