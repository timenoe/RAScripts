// Umihara Kawase Shun:  Second Edition Kanzenban
// #ID = 18215
// Author: timenoe

//// Notes

// DS exclusive fields: 16, 17, 26, 40, 49, 61, 62, 63
// DS exclusive exits: 12→16, 24→26

//// Constants

// Umihara Kawase Shun

UKS_fields =
{
	0: 0x46,
	1: 0x47,
	2: 0x48,
	3: 0x49,
	4: 4,
	5: 5,
	6: 6,
	7: 7,
	8: 8,
	9: 9,
	11: 0xb,
	12: 0x44,
	13: 0xd,
	14: 0xe,
	15: 0xf,
	16: 0x10,
	17: 0x11,
	18: 0x12,
	19: 0x13,
	20: 0x14,
	21: 0x15,
	22: 0x16,
	23: 0x17,
	24: 0x45,
	25: 0x19,
	26: 0x1a,
	27: 0x1b,
	28: 0x1c,
	29: 0x1d,
	30: 0x1e,
	31: 0x1f,
	32: 0x20,
	33: 0x21,
	34: 0x22,
	35: 0x23,
	36: 0x24,
	37: 0x25,
	38: 0x26,
	39: 0x27,
	40: 0x28,
	41: 0x29,
	42: 0x2a,
	43: 0x2b,
	44: 0x2c,
	45: 0x2d,
	46: 0x2e,
	47: 0x2f,
	48: 0x30,
	49: 0x31,
	50: 0x32,
	51: 0x33,
	52: 0x34,
	53: 0x35,
	54: 0x36,
	55: 0x37,
	56: 0x38,
	57: 0x39,
	58: 0x3a,
	61: 0x3d,
	62: 0x3e,
	63: 0x3f
}

UKS_exits =
{
	0: [1,11],
	1: [2],
	2: [3,5],
	3: [4,21],
	4: [8],
	5: [6,25],
	6: [7],
	7: [9,14],
	8: [9],
	9: [12],
	11: [23],
	12: [13,16],
	13: [18,42],
	14: [15],
	15: [35],
	16: [17],
	17: [40],
	18: [19,27],
	19: [20,28],
	20: [24],
	21: [22],
	22: [37],
	23: [9,14],
	24: [29,26],
	25: [19],
	26: [49],
	27: [28,36,41],
	28: [32],
	29: [30,39],
	30: [-1],
	31: [30],
	32: [33],
	33: [34],
	34: [38],
	35: [24,36],
	36: [39,31],
	37: [27,39],
	38: [43,31],
	39: [44],
	40: [62],
	41: [54,47],
	42: [44,50],
	43: [-1],
	44: [45],
	45: [46],
	46: [53],
	47: [48],
	48: [55,56],
	49: [62,61],
	50: [30,51],
	51: [52,47],
	52: [-1],
	53: [54],
	54: [55],
	55: [-1],
	56: [57,0],
	57: [58],
	58: [-1],
	61: [58],
	62: [31,63],
	63: [-1]
}

UKSLongestPathFields = [0,1,2,3,4,8,9,12,13,18,19,20,24,29,39,44,45,46,53,54,55]

UKSFieldBitsBase = 0x7e5dd
UKSFieldBitsOffset = 0x14

visitedSum=1
exitSum=0
for field in UKS_fields
{
	if (field != 0) visitedSum = visitedSum + bit3(UKSFieldBitsBase + field*UKSFieldBitsOffset)

	if (length(UKS_exits[field]) == 1) exitSum = exitSum + bit0(UKSFieldBitsBase + field*UKSFieldBitsOffset)
	else if (length(UKS_exits[field]) == 2) exitSum = exitSum + bit1(UKSFieldBitsBase + field*UKSFieldBitsOffset) + bit0(UKSFieldBitsBase + field*UKSFieldBitsOffset)
	else if (length(UKS_exits[field]) == 3) exitSum = exitSum + bit2(UKSFieldBitsBase + field*UKSFieldBitsOffset) + bit1(UKSFieldBitsBase + field*UKSFieldBitsOffset) + bit0(UKSFieldBitsBase + field*UKSFieldBitsOffset)
}

// Umihara Kawase

UK_fields =
{
	0: 0,
	1: 1,
	2: 2,
	3: 3,
	4: 4,
	5: 0x27,
	6: 6,
	7: 7,
	8: 8,
	10: 5,
	11: 9,
	12: 0xc,
	14: 0xa,
	15: 0xb,
	16: 0x37,
	17: 0xd,
	18: 0x14,
	20: 0xe,
	21: 0xf,
	22: 0x10,
	23: 0x33,
	24: 0x25,
	25: 0x3d,
	26: 0x12,
	28: 0x34,
	29: 0x38,
	30: 0x1c,
	31: 0x32,
	33: 0x31,
	34: 0x2c,
	35: 0x26,
	36: 0x3f,
	37: 0x35,
	38: 0x16,
	40: 0x3b,
	41: 0x36,
	42: 0x2b,
	43: 0x2e,
	45: 0x24,
	46: 0x39,
	47: 0x29,
	48: 0x28,
	49: 0x3c,
	50: 0x2d,
	51: 0x3a,
	52: 0x2a,
	55: 0x30,
	56: 0x3e,
	57: 0x2f
}

UK_exits =
{
	0: [1],
	1: [2],
	2: [3,10],
	3: [4],
	4: [5],
	5: [6],
	6: [7],
	7: [8],
	8: [14],
	10: [11],
	11: [8,18,12],
	12: [36],
	14: [15],
	15: [16,40],
	16: [17],
	17: [20,30],
	18: [23],
	20: [21],
	21: [22],
	22: [23,38],
	23: [24],
	24: [25,42],
	25: [26,29],
	26: [31],
	28: [-1],
	29: [34],
	30: [33,49],
	31: [46],
	33: [37],
	34: [35],
	35: [-1],
	36: [52,45],
	37: [38],
	38: [41],
	40: [35],
	41: [42],
	42: [26,43],
	43: [49],
	45: [50],
	46: [47],
	47: [48],
	48: [56],
	49: [52],
	50: [51],
	51: [56],
	52: [55],
	55: [-1],
	56: [57],
	57: [-1]
}

UKLongestPathFields = [0,1,2,3,4,5,6,7,8,14,15,16,17,20,21,22,23,24,42,26,31,46,47,48,56,57]

//// Functions

// Common

function bitFlip(index, addr) => bit(index, addr) > prev(bit(index, addr))
function gameMode() => byte(0x7e5b4)
function artGallerySum() => bitcount(0x7eb48) + bitcount(0x7eb49) + bitcount(0x7eb4a) + bitcount(0x7eb4b) + bitcount(0x7eb4c)
function musicGallerySum() => 2 + bitcount(0x07eb4d) + bitcount(0x07eb4e) + bitcount(0x07eb4f)

// Umihara Kawase Shun

function UKSContinues() => word(0x184bd4)
function UKSGameState() => byte(0x1834b0)
function UKSFinalDeaths() => word(0x184bfc)
function UKSFinalExits() => word(0x184bfa)
function UKSAction() => byte(0x1863aa)
function UKSExitTimer() => byte(0x1863e4)
function UKSExitDoor() => byte(0x1863e6)
function UKSField() => word(0x187f24)
function UKSFieldTimer() => byte(0x187f2a) * 3600 + byte(0x187f2c) * 60 + byte(0x187f2e) // FRAMES
function UKSRunTime() => byte(0x187f32)*3600 + byte(0x187f34)*60 + byte(0x187f36) // FRAMES
function UKSScore() => dword(0x187f4c)
function UKSLives() => word(0x187f50)

function UKSActive() => UKSRunning() && __ornext(UKSMain() || UKSPractice())
//function UKSEnding() => word(0x184be8) == 0xffff
function UKSEnding() => __ornext(UKSField() == UKS_fields[30] || UKSField() == UKS_fields[43] || UKSField() == UKS_fields[52] || UKSField() == UKS_fields[55] || UKSField() == UKS_fields[58] || UKSField() == UKS_fields[63]) && UKSExiting()
function UKSExitField(field, door)
{
	if (length(UKS_exits[field]) > 1) return UKSActive() && UKSField() == UKS_fields[field] && UKSExitDoor() == door && UKSExiting()
	else return UKSActive() && UKSField() == UKS_fields[field] && UKSExiting()
}
function UKSExiting() => UKSExitTimer() == 2 && UKSAction() == 0xdb
function UKSDeathless() => UKSFinalDeaths() == 0
//function UKSLongestPath() => UKSFinalExits() == length(UKSLongestPathFields)
function UKSLongestPath()
{
	check = always_true()
	for field in UKSLongestPathFields check = check && once(UKSField() == UKS_fields[field])
	return check
}
function UKSMain() => UKSGameState() == 1
function UKSMainActive() => UKSRunning() && UKSMain()
function UKSPractice() => UKSGameState() == 3
function UKSPracticeActive() => UKSRunning() && UKSPractice()
function UKSRunning() => __ornext(gameMode() == 2 || gameMode() == 3)

// Umihara Kawase

function UKAction() => byte(0x1840b4)
function UKEnding() => __ornext(UKField() == UK_fields[28] || UKField() == UK_fields[35] || UKField() == UK_fields[55] || UKField() == UK_fields[57]) && UKExiting()
function UKExitTimer() => byte(0x1840cc)
function UKExitDoor() => byte(0x1840cd)
function UKField() => word(0x188422)
function UKFieldTimer() => byte(0x188424) * 3600 + byte(0x188426) * 60 + byte(0x18842a) // FRAMES
function UKGoodEnding() => __ornext(UKField() == UK_fields[35] || UKField() == UK_fields[55] || UKField() == UK_fields[57]) && UKExiting()
function UKRunTimer() => word(0x18842c) // SECS
function UKScore() => dword(0x188430)
function UKLives() => word(0x188434)
function UKGameState() => byte(0x188510)

function UKActive() => UKRunning() && UKMain()
function UKCollectLife(field) => UKActive() && UKField() == UK_fields[field] && trigger_when(UKLives() > prev(UKLives()))
function UKExitField(field, door)
{
	if (length(UK_exits[field]) > 1) return UKActive() && UKField() == UK_fields[field] && UKExitDoor() == door && UKExiting()
	else return UKActive() && UKField() == UK_fields[field] && UKExiting()
}
function UKExiting() => UKExitTimer() == 2 && UKAction() == 0x35
function UKHardMode() => word(0x188460) == 100
function UKLongestPath()
{
	check = always_true()
	for field in UKLongestPathFields check = check && once(UKField() == UK_fields[field])
	return check
}
function UKMain() => UKGameState() == 4
function UKRunning() => gameMode() == 4

//// Achievements

achIds = []
for id in range (345823, 346017) array_push(achIds, id)
badgeIds = []
for id in range (391111, 391147) array_push(badgeIds, id)
array_push(badgeIds, 391305)
for id in range (391148, 391167) array_push(badgeIds, id)
array_push(badgeIds, 391304)
array_push(badgeIds, 391169)
array_push(badgeIds, 391168)
for id in range (391170, 391303) array_push(badgeIds, id)

id = 0
badge = 0
for field in UKS_fields
{
	for exit in range(0, length(UKS_exits[field]) - 1)
	{
		points = 5
		if (exit > 0) points = 10
		
		if (UKS_exits[field][exit] != -1)
		{
			achievement("[UKS] F" + field + "→F" + UKS_exits[field][exit] + " Exit", "Exit to Field " + UKS_exits[field][exit] + " from Field " + field + " for the first time", points, UKSMainActive() && bit(exit, UKSFieldBitsBase + field*UKSFieldBitsOffset) > prev(bit(exit, UKSFieldBitsBase + field*UKSFieldBitsOffset)), id=achIds[id], badge=format("",badgeIds[badge]))
			id = id + 1
			badge = badge + 1
		}
	}
}

for field in [30, 43, 52, 55, 58, 63]
{
	points = 10
	if (field >= 58) points = 25
	
	achievement("[UKS] Field " + field + " Ending", "Exit to the ending from Field " + field + " for the first time", points, UKSMainActive() && UKSField() == UKS_fields[field] && bit0(UKSFieldBitsBase + field*UKSFieldBitsOffset) > prev(bit0(UKSFieldBitsBase + field*UKSFieldBitsOffset)), id=achIds[id], badge=format("",badgeIds[badge]))
	id = id + 1
	badge = badge + 1
}

achievement("[UKS] Yeahhh, Not Doing All That", "Exit to Field 45 from Field 44 within 10 seconds", 10, UKSActive() && UKSField() == UKS_fields[44] && UKSFieldTimer() >= 17400 && trigger_when(UKSExiting()), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1
achievement("[UKS] That Walking Bucket Is Scary", "Exit to Field 56 from Field 48 within 15 seconds", 10, UKSActive() && UKSField() == UKS_fields[48] && UKSFieldTimer() >= 9900 && trigger_when(UKSExitDoor() == 1) && trigger_when(UKSExiting()), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1

for field in [30, 43, 52, 55, 58, 63]
{
	points = 25
	if (field >= 58) points = 50
	
	achievement("[UKS] Field " + field + " Ending 1CC", "Exit to the ending from Field " + field + " without using a continue", points, UKSMainActive() && UKSField() == UKS_fields[field] && UKSContinues() == 0 && UKSExiting(), id=achIds[id], badge=format("",badgeIds[badge]))
	id = id + 1
	badge = badge + 1
}

//achievement("[UKS] Fishing Charter", "Take the longest path to an ending", 25, UKSMainActive() && UKSLongestPath() && UKSExiting(), id=achIds[id], badge=format("",badgeIds[badge]))
achievement("[UKS] Fishing Charter", "Take the longest path to an ending", 25, never(!UKSMain()) && UKSRunning() && UKSLongestPath() && UKSExiting(), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1
achievement("[UKS] I Just Wanna Fish", "Exit to an ending within 3 minutes", 50, UKSMainActive() && UKSRunTime() <= 10800 && trigger_when(UKSEnding()), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1

for field in UK_fields
{
	for exit in range(0, length(UK_exits[field]) - 1)
	{
		points = 5
		if (exit > 0) points = 10
		
		if (UK_exits[field][exit] != -1)
		{
			achievement("[UK] F" + field + "→F" + UK_exits[field][exit] + " Exit", "Exit to Field " + UK_exits[field][exit] + " from Field " + field, points, UKExitField(field, exit), id=achIds[id], badge=format("",badgeIds[badge]))
			id = id + 1
			badge = badge + 1
		}
	}
}

achievement("[UK] Field " + 28 + " Ending", "Exit to the bad ending from Field 28", 10, UKExitField(28, 0), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1

for field in [35, 55, 57]
{
	achievement("[UK] Field " + field + " Ending", "Exit to the good ending from Field " + field, 25, UKExitField(field, 0), id=achIds[id], badge=format("",badgeIds[badge]))
	id = id + 1
	badge = badge + 1
}

for field in [2, 4, 8, 10, 16, 18, 30, 31, 34, 46, 48, 50, 52]
{
	points = 5
	if (field == 50) points = 10
	
	achievement("[UK] Field " + field + " Explorer", "Collect the backpack in Field " + field, points, UKCollectLife(field), id=achIds[id], badge=format("",badgeIds[badge]))
	id = id + 1
	badge = badge + 1
}

achievement("[UK] Sightseeing", "Take the longest path to an ending", 25, never(!UKMain()) && UKRunning() && UKLongestPath() && UKExiting(), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1
achievement("[UK] Swing to Safety", "Exit to a good ending without dying", 25, disable_when(UKLives() < prev(UKLives()), until=!UKMain()) && UKRunning() && UKGoodEnding(), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1
achievement("[UK] Under Pressure", "Exit to a good ending in 5 Min. mode", 25, UKActive() && UKHardMode() && trigger_when(UKGoodEnding()), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1
//achievement("[UK] Straight to the Finish", "Exit to a good ending within 3 minutes", 50, (!UKHardMode() && UKRunTimer() >= 1620 || UKHardMode() && UKRunTimer() >= 120) && UKActive() && trigger_when(UKGoodEnding()))
// This achievement does not generate the Alt groups correctly in the current version of RATools. Instead paste the following definitions into RALibRetro after generation
achievement("[UK] Straight to the Finish", "Exit to a good ending within 3 minutes", 50, UKActive() && trigger_when(UKGoodEnding()), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1
// Alt 1: 0x 188460!=100_0x 18842c>=1620
// Alt 2: 0x 188460=100_0x 18842c>=120

/// In-game Achievements

//achievement("[UKS] ?", "Visit 10 fields", 5, UKSActive() && bitFlip(0, 0x7eb48))
//achievement("[UKS] ?", "Visit 15 fields", 5, UKSActive() && bitFlip(0, 0x7eb4d))
//achievement("[UKS] ?", "Visit 20 fields", 5, UKSActive() && bitFlip(2, 0x7eb48))
//achievement("[UKS] ?", "Visit 25 fields", 5, UKSActive() && bitFlip(2, 0x7eb4d))
//achievement("[UKS] ?", "Visit 30 fields", 10, UKSActive() && bitFlip(4, 0x7eb48))
//achievement("[UKS] ?", "Visit 35 fields", 10, UKSActive() && bitFlip(4, 0x7eb4d))
//achievement("[UKS] ?", "Visit 40 fields", 10, UKSActive() && bitFlip(6, 0x7eb48))
//achievement("[UKS] ?", "Visit 45 fields", 10, UKSActive() && bitFlip(6, 0x7eb4d))
//achievement("[UKS] ?", "Visit 50 fields", 10, UKSActive() && bitFlip(0, 0x7eb49))
//achievement("[UKS] ?", "Exit to Field 0 from Field 56", 5, UKSActive() && bitFlip(2, 0x7eb4c))
//achievement("[UKS] ?", "Exit to an ending", 25, UKSActive() && bitFlip(0, 0x7eb4e))
//achievement("[UKS] ?", "Exit Field 0 within 15 seconds", 5, UKSActive() && bitFlip(4, 0x7eb4e))
//achievement("[UK] ?", "Exit to a good ending", 25, UKActive() && bitFlip(4, 0x7eb4c))

achievement("[UKS] Umi the Explorer", "Visit all fields", 25, UKSMainActive() && bitFlip(4, 0x7eb4a), id=achIds[id], badge=format("",badgeIds[badge])) // Art - E3
id = id + 1
badge = badge + 1
achievement("[UKS] Seasoned Traveler", "Exit through all doors", 50, UKSMainActive() && bitFlip(6, 0x7eb4a), id=achIds[id], badge=format("",badgeIds[badge])) // Art - D3
id = id + 1
badge = badge + 1

achievement("[UKS] Backpack, Backpack", "Collect all backpacks", 25, UKSActive() && bitFlip(0, 0x7eb4b), id=achIds[id], badge=format("",badgeIds[badge])) // Art - F1
id = id + 1
badge = badge + 1

achievement("[UKS] Yatta!", "View a cutscene of Umihara celebrating", 1, UKSActive() && bitFlip(2, 0x7eb49), id=achIds[id], badge=format("",badgeIds[badge])) // Art - A1
id = id + 1
badge = badge + 1
achievement("[UKS] Why Does It Have Feet", "View a cutscene of Umihara inspecting a loach", 1, UKSActive() && bitFlip(4, 0x7eb49), id=achIds[id], badge=format("",badgeIds[badge])) // Art - A2
id = id + 1
badge = badge + 1
achievement("[UKS] Ornithologist", "View a cutscene of a sparrow resting on Umihara's head", 1, UKSActive() && bitFlip(6, 0x7eb49), id=achIds[id], badge=format("",badgeIds[badge])) // Art - A3
id = id + 1
badge = badge + 1
achievement("[UKS] Long Way From the Beach", "View a cutscene of Umihara walking with a loach in a snowstorm", 1, UKSActive() && bitFlip(0, 0x7eb4a), id=achIds[id], badge=format("",badgeIds[badge])) // Art - B1
id = id + 1
badge = badge + 1
achievement("[UKS] Brain Freeze", "View a cutscene of Umihara eating a popsicle", 1, UKSActive() && bitFlip(2, 0x7eb4a), id=achIds[id], badge=format("",badgeIds[badge])) // Art - B2
id = id + 1
badge = badge + 1
achievement("[UKS] Still as a Statue", "Have 3 birds perched on Umihara's body at the same time", 25, UKSActive() && bitFlip(4, 0x7eb4b), id=achIds[id], badge=format("",badgeIds[badge])) // Art - F3
id = id + 1
badge = badge + 1

achievement("[UKS] Muscle Memory", "Exit Field 0 within 10 seconds", 10, UKSActive() && bitFlip(6, 0x7eb4e), id=achIds[id], badge=format("",badgeIds[badge])) // Music - C2
id = id + 1
badge = badge + 1
achievement("[UKS] Careful Casting", "Exit to an ending without dying", 25, UKSMainActive() && bitFlip(2, 0x7eb4b), id=achIds[id], badge=format("",badgeIds[badge])) // Art - F2
id = id + 1
badge = badge + 1
achievement("[UKS] Not on My Watch", "Catch all 3 flying fish that jump from a bait bucket", 5, UKSActive() && bitFlip(2, 0x7eb4f), id=achIds[id], badge=format("",badgeIds[badge])) // Music - D1
id = id + 1
badge = badge + 1
achievement("[UKS] Yoink", "Catch a sharksucker while it's in the air after it's been thrown by a shark", 5, UKSActive() && bitFlip(0, 0x7eb4f), id=achIds[id], badge=format("",badgeIds[badge])) // Music - C3
id = id + 1
badge = badge + 1
achievement("[UKS] Gone Too Soon", "Catch all frogs in Field 9", 10, UKSActive() && bitFlip(6, 0x7eb4b), id=achIds[id], badge=format("",badgeIds[badge])) // Art - E2
id = id + 1
badge = badge + 1
achievement("[UKS] Calamari Dinner", "Catch all squid in Field 24", 25, UKSActive() && bitFlip(0, 0x7eb4c), id=achIds[id], badge=format("",badgeIds[badge])) // Art - D2
id = id + 1
badge = badge + 1
achievement("[UKS] Deadshot", "Defeat the pufferfish in Field 54 while only blowing it away twice", 10, UKSActive() && bitFlip(6, 0x7eb4c), id=achIds[id], badge=format("",badgeIds[badge])) // Art - G2
id = id + 1
badge = badge + 1
achievement("[UKS] All in the Wrist", "Ascend 2 screens without touching the ground", 10, UKSActive() && bitFlip(4, 0x7eb4f), id=achIds[id], badge=format("",badgeIds[badge])) // Music - D2
id = id + 1
badge = badge + 1
achievement("[UKS] Let's Journey Together", "Catch an enemy after moving more than 2 screens with your hook attached to it", 10, UKSActive() && bitFlip(6, 0x7eb4f), id=achIds[id], badge=format("",badgeIds[badge])) // Music - D3
id = id + 1
badge = badge + 1

achievement("Art Appreciator", "Collect all 20 art pieces", 50, (UKSActive() || UKActive()) && prev(artGallerySum()) < 20 && measured(artGallerySum() == 20), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1
achievement("[UKS] Jukebox Jams", "Collect all 14 music tracks", 50, UKSActive() && prev(musicGallerySum()) < 14 && measured(musicGallerySum() == 14), id=achIds[id], badge=format("",badgeIds[badge]))
id = id + 1
badge = badge + 1
achievement("[UKS] Born This Way", "Complete the fishing log", 25, UKSActive() && bitFlip(2, 0x7eb4e), id=achIds[id], badge=format("",badgeIds[badge]))

//// Leaderboards

LBIds = []
for id in range (67087, 67233) array_push(LBIds, id)
for id in range (73999, 74022) array_push(LBIds, id)
id = 0

// Umihara Kawase Shun

leaderboard("[UKS] Any% Speedrun", "", UKSMainActive(), !UKSMain(), UKSEnding(), UKSRunTime(), format="FRAMES", lower_is_better=true, id=LBIds[id])
id = id + 1

for field in [30, 43, 52, 55, 58, 63]
{
	leaderboard("[UKS] F" + field + " Ending Speedrun", "", UKSMainActive() && UKSField() == UKS_fields[field] && UKSExiting(), always_false(), always_true(), UKSRunTime(), format="FRAMES", lower_is_better=true, id=LBIds[id])
	id = id + 1
}

leaderboard("[UKS] Longest Path Speedrun", "", UKSMainActive() && UKSLongestPath() && UKSExiting(), always_false(), always_true(), UKSRunTime(), format="FRAMES", lower_is_better=true, id=LBIds[id])
id = id + 1

leaderboard("[UKS] Deathless Speedrun", "", UKSMainActive() && UKSDeathless() && UKSEnding(), always_false(), always_true(), UKSRunTime(), format="FRAMES", lower_is_better=true, id=LBIds[id])
id = id + 1

leaderboard("[UKS] High Score", "", UKSMainActive() && UKSEnding(), always_false(), always_true(), UKSScore(), format="VALUE", id=LBIds[id])
id = id + 1

leaderboard("[UKS] Most Backpacks", "", UKSMainActive() && UKSEnding(), always_false(), always_true(), UKSLives(), format="VALUE", id=LBIds[id])
id = id + 1

// Umihara Kawase

leaderboard("[UK] Any% Speedrun", "", UKActive() && !UKHardMode(), !UKMain(), UKGoodEnding(), UKRunTimer(), format="SECS", id=LBIds[id])
id = id + 1

leaderboard("[UK] [5 Min. Mode] Any% Speedrun", "", UKActive() && UKHardMode(), !UKMain(), UKGoodEnding(), UKRunTimer(), format="SECS", id=LBIds[id])
id = id + 1

for field in [35, 55, 57]
{
	leaderboard("[UK] F" + field + " Ending Speedrun", "", UKExitField(field, -1) && !UKHardMode(), always_false(), always_true(), UKRunTimer(), format="SECS", id=LBIds[id])
	id = id + 1
	
	leaderboard("[UK] [5 Min. Mode] F" + field + " Ending Speedrun", "", UKExitField(field, -1) && UKHardMode(), always_false(), always_true(), UKRunTimer(), format="SECS", id=LBIds[id])
	id = id + 1
}

leaderboard("[UK] Longest Path Speedrun", "", never(!UKMain()) && UKRunning() && UKLongestPath() && UKExiting(), always_false(), always_true(), UKRunTimer(), format="SECS", id=LBIds[id]) // Impossible in "Hard Mode", even with a TAS
id = id + 1

leaderboard("[UK] Deathless Speedrun", "", disable_when(UKLives() < prev(UKLives()), until=!UKMain()) && UKRunning() && UKGoodEnding() && !UKHardMode(), always_false(), always_true(), UKRunTimer(), format="SECS", id=LBIds[id])
id = id + 1

leaderboard("[UK] [5 Min. Mode] Deathless Speedrun", "", disable_when(UKLives() < prev(UKLives()), until=!UKMain()) && UKRunning() && UKGoodEnding() && UKHardMode(), always_false(), always_true(), UKRunTimer(), format="SECS", id=LBIds[id])
id = id + 1

leaderboard("[UK] High Score", "", UKActive() && UKEnding(), always_false(), always_true(), UKScore(), format="VALUE", id=LBIds[id])
id = id + 1

leaderboard("[UK] Most Backpacks", "", UKActive() && UKEnding(), always_false(), always_true(), UKLives(), format="VALUE", id=LBIds[id])
id = id + 1

// Umihara Kawase Shun ILs

for field in UKS_fields
{
	for door in range(0, length(UKS_exits[field])-1)
	{
		title = "[UKS] F"
		if (UKS_exits[field][door] == -1) title = title + field + "→E"
		else title = title + field + "→F" + UKS_exits[field][door]
		
		leaderboard(title + " Speedrun", "", UKSExitField(field, door), always_false(), always_true(), UKSFieldTimer(), format="FRAMES", id=LBIds[id])
		id = id + 1
	}
}

// Umihara Kawase ILs

for field in UK_fields
{
	for door in range(0, length(UK_exits[field])-1)
	{
		title = "[UK] F"
		if (UK_exits[field][door] == -1) title = title + field + "→E"
		else title = title + field + "→F" + UK_exits[field][door]
		
		leaderboard(title + " Speedrun", "", UKExitField(field, door), always_false(), always_true(), UKFieldTimer(), format="FRAMES", id=LBIds[id])
		id = id + 1
	}
}