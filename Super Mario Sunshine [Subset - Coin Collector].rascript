// Super Mario Sunshine [Subset - Coin Collector]
// #ID = 28657
// Author: timenoe
// Date Published: 2024-02-24

// #region Constant

// #region Common

ptrMask = 0x7fffffff

iterations = ["first", "second", "third"]
mainCourseNames = ["Bianco Hills", "Ricco Harbor", "Gelato Beach", "Pinna Park", "Sirena Beach", "Noki Bay", "Pianta Village"]
coinShineInstanceID = 0x879d
romanNumerals = ["I", "II", "III", "IV", "V", "VI", "VII", "VIII"]

courseShorthand = 
{
	"Bianco Hills": "Bianco",
	"Ricco Harbor": "Ricco",
	"Gelato Beach": "Gelato",
	"Pinna Park": "Pinna",
	"Sirena Beach": "Sirena",
	"Noki Bay": "Noki",
	"Pianta Village": "Pianta"
}
maxCoinCounts = 
{
	"Bianco Hills": [111, 116, 171, 158, 115, 177, 143, 212],
	"Ricco Harbor": [149, 128, 132, 129, 131, 132, 121, 130],
	"Gelato Beach": [123, 125, 122, 126, 126, 127, 130, 161],
	"Pinna Park": [92, 999, 83, 74, 214, 218, 214, 228],
	"Sirena Beach": [101, 82, 117, 154, 999, 14, 123, 112],
	"Noki Bay": [172, 179, 65, 199, 125, 212, 129, 235],
	"Pianta Village": [110, 26, 130, 15, 175, 999, 77, 35]
}
secretCoinShines = 
{
	"Delfino Plaza": ["Flooded Delfino Plaza", "Red Coin Field", "Delfino Airstrip"],
	"Bianco Hills": ["Down with Petey Piranha!", "The Hillside Cave Secret"],
	"Ricco Harbor": ["The Secret of Ricco Tower"],
	"Gelato Beach": ["Dune Bud Sand Castle Secret", "The Sand Bird is Born"],
	"Pinna Park": ["Park", "The Beach Cannon's Secret", "The Yoshi-Go-Round's Secret"],
	"Sirena Beach": ["Casino", "King Boo Down Below"],
	"Noki Bay": ["Underwater", "The Shell's Secret"],
	"Pianta Village": ["Secret of the Village Underside"]
}

// #endregion

// #region Region

bitflagBaseAddr = 0x578940

// #endregion

// #region ID

courseIDs = 
{
	"Delfino Airstrip": 0,
	"Delfino Plaza": 1,
	"Bianco Hills": 2,
	"Ricco Harbor": 3,
	"Gelato Beach": 4,
	"Pinna Park - Beach": 5,
	"Sirena Beach - Beach": 6,
	"Sirena Beach - Hotel": 7,
	"Pianta Village": 8,
	"Noki Bay": 9,
	"Test Course": 0xc,
	"Pinna Park - Park": 0xd,
	"Sirena Beach - Casino": 0xe,
	"Title Screen/Credits": 0x0f, 
	"Noki Bay - The Red Coin Fish": 0x10, 
	"Delfino Plaza - Delfino Airstrip": 0x14, 
	"Delfino Plaza - Super Slide": 0x15, 
	"Delfino Plaza - Pachinko Game": 0x16,
	"Delfino Plaza - Red Coin Field": 0x17, 
	"Delfino Plaza - Lily Pad Ride": 0x18, 
	"Delfino Plaza - Turbo Track": 0x1d, 
	"Ricco Harbor - Blooper Surfing Safari": 0x1e, 
	"Noki Bay - The Shell's Secret": 0x1f, 
	"Gelato Beach - Dune Bud Sand Castle Secret": 0x20, 
	"Gelato Beach - The Sand Bird is Born": 0x21, 
	"Sirena Beach - The Secret of Casino Delfino": 0x28, 
	"Pinna Park - The Yoshi-Go-Round's Secret": 0x29, 
	"Pianta Village - Secret of the Village Underside": 0x2a, 
	"Noki Bay - Red Coins in a Bottle": 0x2c, 
	"Bianco Hills - The Secret of the Dirty Lake": 0x2e, 
	"Bianco Hills - The Hillside Cave Secret": 0x2f, 
	"Ricco Harbor - The Secret of Ricco Tower": 0x30, 
	"Pinna Park - The Beach Cannon's Secret": 0x32, 
	"Sirena Beach - The Hotel Lobby's Secret": 0x33, 
	"Corona Mountain": 0x34, 
	"Bianco Hills - Down with Petey Piranha!": 0x37, 
	"Sirena Beach - King Boo Down Below": 0x38, 
	"Noki Bay - Eely-Mouth's Dentist": 0x39, 
	"Pinna Park - Roller Coaster": 0x3a, 
	"Ricco Harbor - Gooper Blooper Breaks Out": 0x3b, 
	"Corona Mountain - Father and Son Shine!": 0x3c
}
courseStateIDs = 
{
	"dolpic9": 9,
	"Episode 1": 0,
	"Episode 2": 1,
	"Episode 3": 2,
	"Episode 4": 3,
	"Episode 5": 4,
	"Episode 6": 5,
	"Episode 7": 6,
	"Episode 8": 7,
}
gameStateIDs = 
{
	"Enter": 3
}
shineIDs = 
{
	"Bianco 1": 0x0000,
	"Bianco 2": 0x0001,
	"Bianco 3": 0x0002,
	"Bianco 4": 0x0003,
	"Bianco 5": 0x0004,
	"Bianco 6": 0x0005,
	"Bianco 7": 0x0006,
	"Bianco 8": 0x0007,
	"Bianco Secret 1": 0x0008,
	"Bianco Secret 2": 0x0009,

	"Ricco 1": 0x000a,
	"Ricco 2": 0x000b,
	"Ricco 3": 0x000c,
	"Ricco 4": 0x000d,
	"Ricco 5": 0x000e,
	"Ricco 6": 0x000f,
	"Ricco 7": 0x0010,
	"Ricco 8": 0x0011,
	"Ricco Secret 1": 0x0012,
	"Ricco Secret 2": 0x0013,

	"Gelato 1": 0x0014,
	"Gelato 2": 0x0015,
	"Gelato 3": 0x0016,
	"Gelato 4": 0x0017,
	"Gelato 5": 0x0018,
	"Gelato 6": 0x0019,
	"Gelato 7": 0x001a,
	"Gelato 8":  0x001b,
	"Gelato Secret 1": 0x001c,
	"Gelato Secret 2": 0x001d,

	"Pinna 1": 0x001e,
	"Pinna 2": 0x001f,
	"Pinna 3": 0x0020,
	"Pinna 4": 0x0021,
	"Pinna 5": 0x0022,
	"Pinna 6": 0x0023,
	"Pinna 7": 0x0024,
	"Pinna 8": 0x0025,
	"Pinna Secret 1": 0x0026,
	"Pinna Secret 2": 0x0027,

	"Sirena 1": 0x0028,
	"Sirena 2": 0x0029,
	"Sirena 3": 0x002a,
	"Sirena 4": 0x002b,
	"Sirena 5": 0x002c,
	"Sirena 6": 0x002d,
	"Sirena 7": 0x002e,
	"Sirena 8": 0x002f,
	"Sirena Secret 1": 0x0030,
	"Sirena Secret 2": 0x0031,

	"Noki 1": 0x0032,
	"Noki 2": 0x0033,
	"Noki 3": 0x0034,
	"Noki 4": 0x0035,
	"Noki 5": 0x0036,
	"Noki 6": 0x0037,
	"Noki 7": 0x0038,
	"Noki 8": 0x0039,
	"Noki Secret 1": 0x003a,
	"Noki Secret 2": 0x003b,

	"Pianta 1": 0x003c,
	"Pianta 2": 0x003d,
	"Pianta 3": 0x003e,
	"Pianta 4": 0x003f,
	"Pianta 5": 0x0040,
	"Pianta 6": 0x0041,
	"Pianta 7": 0x0042,
	"Pianta 8": 0x0043,
	"Pianta Secret 1": 0x0044,
	"Pianta Secret 2": 0x0045,
}

// #endregion

// #region Offset

objectOffsets = 
{
	"Instance": 8
}

// #endregion

// #endregion

// #region Function

// #region Common

function nextBit(addr)
{
	if (addr[0] == 7) return [0, addr[1] + 1]
	else return [addr[0] + 1, addr[1]]
}

// #endregion

// #region Region

function regionBit(addr) => bit(addr[0], bitflagPtr() + addr[1] - bitflagBaseAddr)
function regionDword(addr) => dword_be(bitflagPtr() + addr - bitflagBaseAddr)

// #endregion

// #region Pointer

function bitflagPtr() => dword_be(regionPtr() + 0x34) & ptrMask
function collectedShinePtr() => dword_be(gamePtr() + 0x25c) & ptrMask
function gamePtr() => dword_be(regionPtr() + 4) & ptrMask
function regionPtr() => dword_be(0x5518) & ptrMask

// #endregion

// #region Address

function coins() => regionDword(0x578a60)
function course() => byte(regionPtr() + 0xe)
function courseState() => byte(regionPtr() + 0xf)
function gameState() => byte(gamePtr() + 0x64)

// #endregion

// #region Helper

function collectAnyShine() => regionBit([6, 0x578a54]) > prev(regionBit([6, 0x578a54]))
function collectCoinShine() => collectAnyShine() && word_be(collectedShinePtr() + objectOffsets["Instance"]) == coinShineInstanceID
function enterCourseEpisode(courseName, courseStateName) => once(inCourse(courseName) && inCourseState(courseStateName) && inGameState("Enter"))
function gainCoins(increment) => coins() - prev(coins()) == increment
function inAnyCourse(courseNames)
{
	courseCheck = always_false()
	for courseName in courseNames courseCheck = courseCheck || inCourse(courseName)
	return __ornext(courseCheck)
}
function inCourse(courseName) => course() == courseIDs[courseName]
function inCourseState(courseStateName) => courseState() == courseStateIDs[courseStateName]
function inGameState(gameStateName) => gameState() == gameStateIDs[gameStateName]
function loseCoins() => coins() < prev(coins())
function nextCourse() => byte(regionPtr() + 0x12)
// I have no idea how many coins you can actually collect in a single frame. I'm currently only accounting for 10 (which should be more than enough), but will change it if I need to
function tallyCoins(count)
{
	coinIncrements = []
	for increment in range(1, 10) array_push(coinIncrements, gainCoins(increment))
	return tally(count, coinIncrements)
}
function warpToCourse(courseName) => nextCourse() == courseIDs[courseName]

// #endregion

// #endregion

// #region Achievement/Leaderboard

achievement("Delfino Isle Treasure", "Collect 999 coins in Delfino Plaza, Red Coin Field, or Delfino Airstrip", 25, inAnyCourse(["Delfino Plaza", "Delfino Plaza - Red Coin Field", "Delfino Plaza - Delfino Airstrip"]) && prev(coins()) < 999 && coins() == 999)
achievement("Delfino Plaza Treasure", "Collect 162 coins in Delfino Plaza without leaving", 25, never(!inCourse("Delfino Plaza")) && measured(tallyCoins(162)))
achievement("Delfino Airstrip Treasure", "Collect 144 coins in Delfino Airstrip without leaving", 25, never(!inCourse("Delfino Plaza - Delfino Airstrip")) && measured(tallyCoins(144)))

index = 0
for courseAreaName in secretCoinShines["Delfino Plaza"]
{
	if (courseAreaName == "Flooded Delfino Plaza") desc = "when the plaza is flooded"
	else desc = "in " + courseAreaName

	if (courseAreaName == "Flooded Delfino Plaza") courseCheck = inCourse("Delfino Plaza") && inCourseState("dolpic9")
	else courseCheck = inCourse("Delfino Plaza - " + courseAreaName)
	
	if (courseAreaName == "Flooded Delfino Plaza") type = "missable"
	else type = ""
	
	achievement("Delfino Plaza Secret " + romanNumerals[index], "Collect the Delfino Plaza 100-coin Shine Sprite " + desc, 5, courseCheck && collectCoinShine(), type=type)

	index = index + 1
}

// Store a hit when entering the episode to account for episodes where you must enter sub-areas. Reset the hit when soft-resetting or losing coins (can no longer get max coins if you die in a sub-area)
for courseName in mainCourseNames
{
	episode = 1
	for maxCoinCount in maxCoinCounts[courseName]
	{
		episodeName = "Episode " + episode
		courseShorthandName = courseShorthand[courseName] + " " + episode

		if (maxCoinCount < 100) points = 5
		else if (maxCoinCount < 150) points = 10
		else if (courseName == "Noki Bay" && episodeName == "Episode 8") points = 50
		else if (courseName == "Pianta Village" && episodeName == "Episode 6") points = 50
		else points = 25
		
		if (courseName == "Pinna Park") logicalCourseName = "Pinna Park - Beach"
		else if (courseName == "Sirena Beach") logicalCourseName = "Sirena Beach - Beach"
		else logicalCourseName = courseName

		if (maxCoinCount == 999) coinCheck = coins() == maxCoinCount
		else coinCheck = coins() >= maxCoinCount
		
		trigger = never(inCourse("Title Screen/Credits") || warpToCourse("Delfino Plaza") || loseCoins()) && once(enterCourseEpisode(logicalCourseName, episodeName)) && prev(coins()) < maxCoinCount && trigger_when(coinCheck)
		
		achievement(courseName + " Treasure " + romanNumerals[episode - 1], "Collect " + maxCoinCount + " coins in " + episodeName + " of " + courseName, points, trigger)
		if (maxCoinCount < 999) leaderboard(courseShorthandName + " Coin High Score", "Collect the most coins in " + courseShorthandName, enterCourseEpisode(logicalCourseName, episodeName), __ornext(inCourse("Title Screen/Credits") || inCourse("Delfino Plaza")), loseCoins(), prev(coins()), format="VALUE")
		
		episode = episode + 1
	}
	
	index = 0
	for courseAreaName in secretCoinShines[courseName]
	{
		if (length(secretCoinShines[courseName]) == 1) title = courseName + " Secret"
		else title = courseName + " Secret " + romanNumerals[index]
		
		if (courseAreaName == "Down with Petey Piranha!") desc = "while fighting Petey Piranha"
		else if (courseAreaName == "Park") desc = "in the park"
		else if (courseAreaName == "Casino") desc = "in the casino"
		else if (courseAreaName == "King Boo Down Below") desc = "while fighting King Boo"
		else if (courseAreaName == "Underwater") desc = "in the underwater ruins"
		else desc = "in " + courseAreaName

		if (courseAreaName == "Underwater") courseCheck = inAnyCourse(["Noki Bay - The Red Coin Fish", "Noki Bay - Eely-Mouth's Dentist"])
		else courseCheck = inCourse(courseName + " - " + courseAreaName)
		
		achievement(title, "Collect the " + courseName + " 100-coin Shine Sprite " + desc, 5, courseCheck && collectCoinShine())
	
		index = index + 1
	}
}

// #endregion