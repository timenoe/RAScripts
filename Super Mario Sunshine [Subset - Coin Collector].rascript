// Super Mario Sunshine [Subset - Coin Collector]
// #ID = 28657
// Author: timenoe
// Date Published: 2024-02-24

// #region Constant

// #region Common

ptrMask = 0x7fffffff

iterations = ["first", "second", "third"]
mainCourseNames = ["Bianco Hills", "Ricco Harbor", "Gelato Beach", "Pinna Park", "Sirena Beach", "Noki Bay", "Pianta Village"]
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
	"Noki Bay": ["Eely-Mouth's Dentist", "The Shell's Secret"],
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

function regionDword(addr) => dword_be(bitflagPtr() + addr - bitflagBaseAddr)

// #endregion

// #region Pointer

function bitflagPtr() => dword_be(regionPtr() + 0x34) & ptrMask
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

achievement("Delfino Isle Treasure", "Collect 999 Coins in Delfino Plaza, Red Coin Field, or Delfino Airstrip", 25, inAnyCourse(["Delfino Plaza", "Delfino Plaza - Red Coin Field", "Delfino Plaza - Delfino Airstrip"]) && prev(coins()) < 999 && coins() == 999)
achievement("Delfino Plaza Treasure", "Collect 162 Coins in Delfino Plaza without leaving", 25, never(!inCourse("Delfino Plaza")) && measured(tallyCoins(162)))
achievement("Delfino Airstrip Treasure", "Collect 144 Coins in Delfino Airstrip without leaving", 25, never(!inCourse("Delfino Plaza - Delfino Airstrip")) && measured(tallyCoins(144)))

index = 0
for courseAreaName in secretCoinShines["Delfino Plaza"]
{
	if (courseAreaName == "Flooded Delfino Plaza") desc = "when the plaza is flooded"
	else desc = "in " + courseAreaName

	if (courseAreaName == "Flooded Delfino Plaza") courseCheck = inCourse("Delfino Plaza") && inCourseState("dolpic9")
	else courseCheck = inCourse("Delfino Plaza - " + courseAreaName)
	
	if (courseAreaName == "Flooded Delfino Plaza") type = "missable"
	else type = ""
	
	achievement("Delfino Plaza Secret " + romanNumerals[index], "Spawn the Delfino Plaza 100 Coin Shine Sprite " + desc, 5, courseCheck && prev(coins()) < 100 && coins() >= 100, type=type)

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
		else if (courseName == "Pianta Village" && episodeName == "Episode 6") points = 50
		else points = 25
		
		if (courseName == "Pinna Park") logicalCourseName = "Pinna Park - Beach"
		else if (courseName == "Sirena Beach") logicalCourseName = "Sirena Beach - Beach"
		else logicalCourseName = courseName

		if (maxCoinCount == 999) coinCheck = coins() == maxCoinCount
		else coinCheck = coins() >= maxCoinCount
		
		trigger = never(inCourse("Title Screen/Credits") || warpToCourse("Delfino Plaza") || loseCoins()) && once(enterCourseEpisode(logicalCourseName, episodeName)) && prev(coins()) < maxCoinCount && trigger_when(coinCheck)
		
		achievement(courseName + " Treasure " + romanNumerals[episode - 1], "Collect " + maxCoinCount + " Coins in " + episodeName + " of " + courseName, points, trigger)
		if (maxCoinCount < 999) leaderboard(courseShorthandName + " Coin High Score", "Collect the most Coins in " + courseShorthandName, enterCourseEpisode(logicalCourseName, episodeName), __ornext(inCourse("Title Screen/Credits") || inCourse("Delfino Plaza")), loseCoins(), prev(coins()), format="VALUE")
		
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
		else if (courseAreaName == "Eely-Mouth's Dentist") desc = "while fighting Eely-Mouth"
		else desc = "in " + courseAreaName
		
		achievement(title, "Spawn the " + courseName + " 100 Coin Shine Sprite " + desc, 5, inCourse(courseName + " - " + courseAreaName) && prev(coins()) < 100 && coins() >= 100)
	
		index = index + 1
	}
}

// #endregion