// Super Mario Sunshine
// #ID = 6049
// Author: timenoe
// Date Published: 2024-??-??

//// Common

iterations = ["first", "second", "third"]

function nextBit(addr)
{
	if (addr[0] == 7) return [0, addr[1] + 1]
	else return [addr[0] + 1, addr[1]]
}

bitflagBaseAddr = 0x578940
ptrMask = 0x7fffffff

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
function regionDword(addr) => dword_be(bitflagPtr() + addr - bitflagBaseAddr)

regionNames = ["USA/Korea", "Europe", "Japan (Rev 1)"]
function regionCheck(regionName)
{
	if (regionName == "USA/Korea") return ascii_string_equals(3, "E")
	else if (regionName == "Europe") return ascii_string_equals(3, "P")
	else if (regionName == "Japan (Rev 1)") return ascii_string_equals(3, "J")
}
function cameraPtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40d0b0) & ptrMask
	else if (regionName == "Europe") return dword_be(0x404810) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3ffa40) & ptrMask
}
function enemyPtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40d118) & ptrMask
	else if (regionName == "Europe") return dword_be(0x404878) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3fe050) & ptrMask
}
function mapPtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40de98) & ptrMask
	else if (regionName == "Europe") return dword_be(0x405560) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3fed38) & ptrMask
}
function goopPtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40ded0) & ptrMask
	else if (regionName == "Europe") return dword_be(0x405598) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3fed70) & ptrMask
}
function staticObjectsPtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40df08) & ptrMask
	else if (regionName == "Europe") return dword_be(0x4055d0) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3feda8) & ptrMask
}
function dynamicObjectsPtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40df10) & ptrMask
	else if (regionName == "Europe") return dword_be(0x4055d8) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3fedb0) & ptrMask
}
function kingBooSlotMachinePtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40df28) & ptrMask
	else if (regionName == "Europe") return dword_be(0x4055f0) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3fedb0) & ptrMask
}
function paintingPtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40df54) & ptrMask
	else if (regionName == "Europe") return dword_be(0x40561c) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3feddc) & ptrMask
}
function bossPtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40df90) & ptrMask
	else if (regionName == "Europe") return dword_be(0x405658) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3fee30) & ptrMask
}
function marioPtr(regionName)
{
	if (regionName == "USA/Korea") return dword_be(0x40e0e8) & ptrMask
	else if (regionName == "Europe") return dword_be(0x4057b0) & ptrMask
	else if (regionName == "Japan (Rev 1)") return dword_be(0x3fef88) & ptrMask
}

//// Constants

// IDs ----------------------------------------------------------------------------------------------------

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
	"dolpic0": 0,
	"dolpic1": 1,
	"dolpic10": 2,
	"dolpic5": 5,
	"dolpic6": 6,
	"dolpic7": 7,
	"dolpic8": 8,
	"dolpic9": 9,
	"Episode 1": 0,
	"Episode 2": 1,
	"Episode 3": 2,
	"Episode 4": 3,
	"Episode 5": 4,
	"Episode 6": 5,
	"Episode 7": 6,
	"Episode 8": 7,
	"pinnaBeach1": 1,
	"pinnaBoss0": 0,
	"pinnaBoss1": 1,
	"delfino0": 0,
	"dolpic_ex1": 0,
	"bia_ex1": 0,
	"casino0": 0,
	"casino1": 1,
	"coro_ex0": 0,
	"coro_ex1": 0,
	"coro_ex2": 0
}
gameStateIDs = 
{
	"Loading": 0,
	"Enter": 3,
	"Cutscene": 0x78
}
cutsceneIDs = 
{
	"staffroll": 0xf,
	"omakeB": 0x11
}
objectTypeIDs = 
{
	"NPC": 4,
	"Dynamic": 0x20,
	"Static": 0x40
}
objectIDs = 
{
	"Shine": 0x13,
	"Spring": 0x17,
	"Bianco Windmill Platform": 0xa8,
	"Coconut": 0x390,
	"Pineapple": 0x392
}
marioAnimationIDs = 
{
	"Climb Pole": 3,
	"Hold Pole": 6,
	"Jump": 0x17,
	"Slide": 0x30,
	"Side Jump": 0x3d,
	"Spin Jump": 0x69,
	"Grab Fence (From Ground)": 0x6e,
	"Grab Fence (From Air)": 0x6f,
	"Hold Fence": 0x70,
	"Climb Fence Left": 0x71,
	"Climb Fence Right": 0x72,
	"Climb Fence Up": 0x73,
	"Climb Fence Down": 0x74,
	"Slide Somersault": 0x85
}

gooperBlooperAnimationIDs = 
{
	"Ripped Tentacle": 3
}
bossAnimationIDs = 
{
	"Gooper Blooper 2": gooperBlooperAnimationIDs
}
blooperColorIDs = 
{
	"Purple": 0,
	"Yellow": 1,
	"Green": 2
}
nozzleIDs = 
{
	"Rocket": 1,
	"Hover": 4,
	"Turbo": 5
}
shineStateIDs = 
{
	"Spawn": 0xc,
	"Collect": 0x10,
	"Idle": 0x11
}
delfinoPlazaShineInstanceIDs = 
{
	"The Gold Bird": 0x93f0,
	"Super Slide": 0xc1b,
	"Turbo Track": 0xc1b
}
biancoHillsShineInstanceIDs = 
{
	"The Hillside Cave Secret": 0xc1b,
	"The Secret of the Dirty Lake": 0xc1b
}
riccoHarborShineInstanceIDs = 
{
	"Blooper Surfing Safari": 0x7fb4,
	"The Caged Shine Sprite": 0xc1b,
	"The Secret of Ricco Tower": 0xc1b,
	"Yoshi's Fruit Adventure": 0xc1b,
	"Blooper Surfing Sequel": 0x7fb5
}
pinnaParkShineInstanceIDs = 
{
	"The Runaway Ferris Wheel": 0xf3b3
}
nokiBayShineInstanceIDs = 
{
	"Uncork the Waterfall": 0xec9e,
	"The Boss of Tricky Ruins": 0x7fb4
}
piantaVillageShineInstanceIDs = 
{
	"The Goopy Inferno": 0x7fb4
}
shineInstanceIDs = 
{
	"Delfino Plaza": delfinoPlazaShineInstanceIDs,
	"Bianco Hills": biancoHillsShineInstanceIDs,
	"Ricco Harbor": riccoHarborShineInstanceIDs,
	"Pinna Park": pinnaParkShineInstanceIDs,
	"Noki Bay": nokiBayShineInstanceIDs,
	"Pianta Village": piantaVillageShineInstanceIDs
}
surfaceIDs = 
{
	"Sand": 5,
	"Metal Platform": 0xc,
	"Grass": 0x10,
	"Rubber Band": 0x15
}

// Offsets ----------------------------------------------------------------------------------------------------

inheritedObjectOffsets = 
{
	"Instance": 8,
	"Type": 0x4c,
	"ID": 0x4e
}
oneUpObjectOffsets = 
{
	"Hidden": 0x67,
	"Spawned": 0x138,
	"Collected": 0x13a
}
shineObjectOffsets = 
{
	"State": 0xfd
}
objectOffsets = 
{
	"Inherited": inheritedObjectOffsets,
	"1-Up": oneUpObjectOffsets,
	"Shine": shineObjectOffsets
}
bossTableOffsets = 
{
	"Gooper Blooper 2": 0x5dc0,
	"Mecha-Bowser": 0x134,
	"Monty Mole": 0x34c0
}
delfinoPlazaGreenBirdTableOffsets =
{
	"dolpic9/dolpic10": [0x5758, 0x575c, 0x5760, 0x5764, 0x5768, 0x576c, 0x5770, 0x5774, 0x5778, 0x577c, 0x5780, 0x5784, 0x5788, 0x578c, 0x5790, 0x5794, 0x5798]
}
enemyTableOffsets = 
{
	"Delfino Plaza - Green Birds": delfinoPlazaGreenBirdTableOffsets
}

// Naturally Occurring 1Up Offsets ----------------------------------------------------------------------------------------------------

plazaOneUps = 
{
	"dolpic0": [0x280, 0x284, 0x288, 0x3a0],
	"dolpic1": [0x280, 0x284, 0x288, 0x3a4],
	"dolpic5": [0x234, 0x238, 0x23c, 0x368],
	"dolpic6": [0x280, 0x284, 0x288, 0x3b4],
	"dolpic7": [0x280, 0x284, 0x288, 0x3b8],
	"dolpic8": [0x298, 0x29c, 0x2a0, 0x3d0]
}
lilyPadOneUp = 
{
	"N/A": [0xcc]
}
biancoOneUps = 
{
	"Episode 8": [0x1fc, 0x20c, 0x2a8]
}
caveSecretOneUps = 
{
	"N/A": [0xcc, 0x128]
}
lakeSecretOneUps = 
{
	"N/A": [0xcc, 0xd0]
}
riccoOneUps = 
{
	"Episode 8": [0x294, 0x2a4, 0x32c]
}
towerSecretOneUps = 
{
	"N/A": [0xcc, 0xd0]
}
gelatoOneUps = 
{
	"Episode 1": [0x2cc],
	"Episode 2": [0x2fc],
	"Episode 3": [0x2b4],
	"Episode 4": [0x2c8],
	"Episode 5": [0x2a8],
	"Episode 6": [0x2d4],
	"Episode 7": [0x330],
	"Episode 8": [0x29c]
}
castleSecretOneUps = 
{
	"N/A": [0xcc, 0x128]
}
sandBirdOneUp = 
{
	"N/A": [0xc0]
}
pinnaBeachOneUps = 
{
	"Episode 1": [0xd4],
	"Episode 2": [0xd4],
	"Episode 3": [0xd8],
	"Episode 4": [0xd4],
	"Episode 5": [0xd8],
	"Episode 6": [0xd8],
	"Episode 7": [0xd8],
	"Episode 8": [0xd8]
}
pinnaParkOneUps = 
{
	"Episode 1": [0x1bc],
	"Episode 3": [0x1e4],
	"Episode 5": [0x1b4],
	"Episode 6": [0x1b8],
	"Episode 7": [0x1b4],
	"Episode 8": [0x204],
}
cannonSecretOneUps = 
{
	"N/A": [0xd4, 0x134]
}
yoshiSecretOneUps = 
{
	"N/A": [0xcc, 0x128, 0x12c]
}
sirenaBeachOneUp = 
{
	"Episode 1": [0x1c0],
	"Episode 2": [0x11c],
	"Episode 3": [0x11c],
	"Episode 4": [0x11c],
	"Episode 5": [0x11c],
	"Episode 6": [0x12c],
	"Episode 7": [0x120],
	"Episode 8": [0x120]
}
casinoOneUp = 
{
	"casino0": [0x104],
	"casino1": [0x124]
}
hotelSecretOneUp = 
{
	"N/A": [0xe8, 0x14c, 0x150]
}
casinoSecretOneUps = 
{
	"N/A": [0xcc, 0xd0]
}
nokiOneUps = 
{
	"Episode 4": [0x298, 0x29c, 0x2a0, 0x2a4],
	"Episode 5": [0x298, 0x29c, 0x2a0, 0x2a4],
	"Episode 7": [0x29c, 0x2a0, 0x2a4, 0x2a8],
	"Episode 8": [0x298, 0x29c, 0x2a0, 0x2a4]
}
nokiUniqueOneUp = 
{
	"Episode 6": [0x374], // Individual achievement (only appears in Episode 6 behind a trap)
}
shellSecretOneUps = 
{
	"N/A": [0x124, 0x128, 0x12c]
}
piantaOneUps = 
{
	"Episode 5": [0x18c, 0x190, 0x194, 0x198]
}
piantaUniqueOneUp = 
{
	"Episode 3": [0x184], // Individual achievement (only appears in Episode 3 on top of a cage)
}
villageSecretOneUps = 
{
	"N/A": [0xe8, 0xec, 0xf0]
}
coronaOneUps = 
{
	"N/A": [0x13c, 0x1b8, 0x138]
}
oneUpOffsets = 
{
	"Delfino Plaza": plazaOneUps,
	"Delfino Plaza - Lily Pad Ride": lilyPadOneUp,
	"Bianco Hills": biancoOneUps,
	"Bianco Hills - The Hillside Cave Secret": caveSecretOneUps,
	"Bianco Hills - The Secret of the Dirty Lake": lakeSecretOneUps,
	"Ricco Harbor": riccoOneUps,
	"Ricco Harbor - The Secret of Ricco Tower": towerSecretOneUps,
	"Gelato Beach": gelatoOneUps,
	"Gelato Beach - Dune Bud Sand Castle Secret": castleSecretOneUps,
	"Gelato Beach - The Sand Bird is Born": sandBirdOneUp,
	"Pinna Park - Beach": pinnaBeachOneUps,
	"Pinna Park - Park": pinnaParkOneUps,
	"Pinna Park - The Beach Cannon's Secret": cannonSecretOneUps,
	"Pinna Park - The Yoshi-Go-Round's Secret": yoshiSecretOneUps,
	"Sirena Beach - Beach": sirenaBeachOneUp,
	"Sirena Beach - Casino": casinoOneUp,
	"Sirena Beach - The Hotel Lobby's Secret": hotelSecretOneUp,
	"Sirena Beach - The Secret of Casino Delfino": casinoSecretOneUps,
	"Noki Bay": nokiOneUps,
	"Noki Bay - The Shell's Secret": shellSecretOneUps,
	"Pianta Village": piantaOneUps,
	"Pianta Village - Secret of the Village Underside": villageSecretOneUps,
	"Corona Mountain": coronaOneUps
}
uniqueOneUpOffsets = 
{
	"Noki Bay": nokiUniqueOneUp,
	"Pianta Village": piantaUniqueOneUp
}

// Enemy 1Up Offsets ----------------------------------------------------------------------------------------------------

biancoStuOneUp = 
{
	"Episode 1": [0x1b8]
}
cannonSecretStuOneUp = 
{
	"N/A": [0x130]
}
hotelSecretStuOneUp = 
{
	"N/A": [0x144]
}
kingBooStuOneUp = 
{
	"N/A": [0x154]
}
villageSecretStuOneUp = 
{
	"N/A": [0xf0]
}
delfinoAirstripStuOneUp = 
{
	"N/A": [0x334]
}
stuOneUpOffsets = 
{
	"Bianco Hills": biancoStuOneUp,
	"Pinna Park - The Beach Cannon's Secret": cannonSecretStuOneUp,
	"Sirena Beach - The Hotel Lobby's Secret": hotelSecretStuOneUp,
	"Sirena Beach - King Boo Down Below": kingBooStuOneUp,
	"Pianta Village - Secret of the Village Underside": villageSecretStuOneUp,
	"Delfino Plaza - Delfino Airstrip": delfinoAirstripStuOneUp 
}

biancoSecondStuOneUp = 
{
	"Episode 1": [0x1e4]
}
cannonSecretSecondStuOneUp = 
{
	"N/A": [0x134]
}
hotelSecretSecondStuOneUp = 
{
	"N/A": [0x148]
}
kingBooSecondStuOneUp = 
{
	"N/A": [0x158]
}
villageSecretSecondStuOneUp = 
{
	"N/A": [0x14c]
}
delfinoAirstripSecondStuOneUp = 
{
	"N/A": [0x338]
}
secondStuOneUpOffsets = 
{
	"Bianco Hills": biancoSecondStuOneUp,
	"Pinna Park - The Beach Cannon's Secret": cannonSecretSecondStuOneUp,
	"Sirena Beach - The Hotel Lobby's Secret": hotelSecretSecondStuOneUp,
	"Sirena Beach - King Boo Down Below": kingBooSecondStuOneUp,
	"Pianta Village - Secret of the Village Underside": villageSecretSecondStuOneUp,
	"Delfino Plaza - Delfino Airstrip": delfinoAirstripSecondStuOneUp
}

hotelSecretThirdStuOneUp = 
{
	"N/A": [0x14c]
}
kingBooThirdStuOneUp = 
{
	"N/A": [0x15c]
}
thirdStuOneUpOffsets = 
{
	"Sirena Beach - The Hotel Lobby's Secret": hotelSecretThirdStuOneUp,
	"Sirena Beach - King Boo Down Below": kingBooThirdStuOneUp
}

pinnaBeachSmolderStuOneUp = 
{
	"Episode 1": [0x130]
}
smolderStuOneUpOffsets = 
{
	"Pinna Park - Beach": pinnaBeachSmolderStuOneUp
}

biancoPlurpOneUps = 
{
	"Episode 3": [0x154, 0x158],
	"Episode 4": [0x184, 0x188]
}
piantaPlurpOneUps = 
{
	"Episode 3": [0x1c4, 0x1c8]
}
plurpOneUpOffsets = 
{
	"Bianco Hills": biancoPlurpOneUps,
	"Pianta Village": piantaPlurpOneUps
}

guidedBulletBillOneUp = 
{
	"N/A": [0x104]
}
guidedBulletBillOneUpOffsets = 
{
	"Corona Mountain - Father and Son Shine!": guidedBulletBillOneUp
}

// Misc. Object Offsets ----------------------------------------------------------------------------------------------------

plazaPineappleBasket = 
{
	"dolpic5/6/7/8": 0x168,
	"dolpic10": 0x164
}
plazaCoconutBasket = 
{
	"dolpic6/7/8/10": 0x160,
	"dolpic5": 0x15c
}
fruitBasketOffsets = 
{
	"Delfino Plaza - Pineapple": plazaPineappleBasket,
	"Delfino Plaza - Coconut": plazaCoconutBasket
}

// Titles ----------------------------------------------------------------------------------------------------

mainCourseNames = ["Bianco Hills", "Ricco Harbor", "Gelato Beach", "Pinna Park", "Sirena Beach", "Noki Bay", "Pianta Village"]
mainCourseEpisodeShinesTitle = 
{
	"Bianco Hills": "Country Livin'",
	"Ricco Harbor": "Work-Life Balance",
	"Gelato Beach": "Beach Bum",
	"Pinna Park": "Childhood Dream",
	"Sirena Beach": "All-Exclusive Stay",
	"Noki Bay": "Out of This World",
	"Pianta Village": "Honorary Pianta"
}
mainCourseSecretShinesTitle = 
{
	"Bianco Hills": "Cave Story",
	"Ricco Harbor": "Pure-Bred Blooper",
	"Gelato Beach": "Magic Castle",
	"Pinna Park": "Ring Around the Rosie",
	"Sirena Beach": "Welcome to the Hotel Delfino",
	"Noki Bay": "Sea Shells by the Sea Shore",
	"Pianta Village": "King of the Underground"
}
mainCourseCoinShineTitle = 
{
	"Bianco Hills": "Bianco Bullion",
	"Ricco Harbor": "Rare Catch",
	"Gelato Beach": "Metal Detector Mario",
	"Pinna Park": "Lost and Found",
	"Sirena Beach": "Tip the Staff",
	"Noki Bay": "Ancient Artifacts",
	"Pianta Village": "Toadstool Tour"
}
mainCourseblueCoinsTitle = 
{
	"Bianco Hills": "High and Low",
	"Ricco Harbor": "Klamber Chaos",
	"Gelato Beach": "Wakey, Wakey, Cataquack",
	"Pinna Park": "Break the Targets",
	"Sirena Beach": "Waterlogged Furniture",
	"Noki Bay": "Rule 1: Check Waterfalls",
	"Pianta Village": "Blue Moon"
}

timedRedCoinCourseNames = ["Bianco Hills - The Hillside Cave Secret", "Bianco Hills - The Secret of the Dirty Lake",
						   "Ricco Harbor - The Secret of Ricco Tower",
						   "Gelato Beach - Dune Bud Sand Castle Secret",
						   "Pinna Park - The Beach Cannon's Secret", "Pinna Park - The Yoshi-Go-Round's Secret",
						   "Sirena Beach - Hotel", "Sirena Beach - The Hotel Lobby's Secret", "Sirena Beach - The Secret of Casino Delfino",
						   "Noki Bay - The Shell's Secret",
						   "Pianta Village - Secret of the Village Underside",
						   "Delfino Plaza - Delfino Airstrip"]

timedRedCoinCourseTitles = 
{
	"Bianco Hills - The Hillside Cave Secret": "Red Coins of the Hillside Cave",
	"Bianco Hills - The Secret of the Dirty Lake": "Red Coins of the Dirty Lake",
	"Ricco Harbor - The Secret of Ricco Tower": "Red Coins in Ricco Tower",
	"Gelato Beach - Dune Bud Sand Castle Secret": "Red Coins in the Sand Castle",
	"Pinna Park - The Beach Cannon's Secret": "Red Coins in the Cannon",
	"Pinna Park - The Yoshi-Go-Round's Secret": "Red Coins in the Yoshi-Go-Round",
	"Sirena Beach - Hotel": "Red Coins in the Hotel",
	"Sirena Beach - The Hotel Lobby's Secret": "Red Coins in Boo's Big Mouth",
	"Sirena Beach - The Secret of Casino Delfino": "Red Coin Winnings in the Casino",
	"Noki Bay - The Shell's Secret": "Red Coins on the Half Shell",
	"Pianta Village - Secret of the Village Underside": "Red Coin Chucksters",
	"Delfino Plaza - Delfino Airstrip": "Red Coin Waterworks"
}

raceCourseNames = ["Gelato Beach", "Noki Bay", "Pianta Village"]
raceCourseEpisodes = 
{
	"Gelato Beach": "Episode 5",
	"Noki Bay": "Episode 5",
	"Pianta Village": "Episode 2"
}
raceCourseTitles = 
{
	"Gelato Beach": "Il Piantissimo's Sand Sprint",
	"Noki Bay": "Il Piantissimo's Surf touchWater",
	"Pianta Village": "Il Piantissimo's Crazy Climb" 
}

//// Functions

// Pointers
function animationPtr(regionName) => dword_be(marioPtr(regionName) + 0x3a8) & ptrMask
function bitflagPtr() => dword_be(regionPtr() + 0x34) & ptrMask
function fluddPtr(regionName) => dword_be(marioPtr(regionName) + 0x3e4) & ptrMask
function gamePtr() => dword_be(regionPtr() + 4) & ptrMask
function grabPtr(regionName) => dword_be(marioPtr(regionName) + 0x384) & ptrMask
function holdPtr(regionName) => dword_be(marioPtr(regionName) + 0x6c) & ptrMask
function hudPtr() => dword_be(gamePtr() + 0x74) & ptrMask
function kingBooPtr(regionName) => dword_be(kingBooSlotMachinePtr(regionName) + 0x1a0) & ptrMask
function nearbyNpcPtr() => dword_be(gamePtr() + 0xa0) & ptrMask
function nearbyShinesPtr() => dword_be(gamePtr() + 0x540) & ptrMask
function platformPtr(regionName) => dword_be(marioPtr(regionName) + 0x2c0) & ptrMask
function regionPtr() => dword_be(0x5518) & ptrMask
function scriptPtr() => dword_be(gamePtr() + 0x80) & ptrMask
function yoshiPtr(regionName) => dword_be(marioPtr(regionName) + 0x3f0) & ptrMask

// Addresses
function course() => byte(regionPtr() + 0xe)
function courseState() => byte(regionPtr() + 0xf)
function cutscene() => byte(regionPtr() + 0x1b)
function gameState() => byte(gamePtr() + 0x64)
function piantasRescued() => regionDword(0x578a84)
function redCoins() => regionDword(0x578a7c)
function shines() => regionDword(0x578a58)
function timer() => dword_be(hudPtr() + 0x500)

// General
function inCourse(courseName) => course() == courseIDs[courseName]
function wasInCourse(courseName) => prev(course()) == courseIDs[courseName]
function inCourseState(courseStateName) => courseState() == courseStateIDs[courseStateName]
function inAnyCourseState(courseStateNames)
{
	courseStateCheck = always_false()
	for courseStateName in courseStateNames courseStateCheck = courseStateCheck || inCourseState(courseStateName)
	return __ornext(courseStateCheck)
}
function wasInCourseState(courseStateName) => prev(courseState()) == courseStateIDs[courseStateName]
function inGameState(gameStateName) => gameState() == gameStateIDs[gameStateName]
function wasInGameState(gameStateName) => prev(gameState()) == gameStateIDs[gameStateName]
function watchingCutscene(cutsceneName) => cutscene() == cutsceneIDs[cutsceneName]
function inGame() => course() != courseIDs["Title Screen/Credits"] && !inGameState("Loading")
function inEnding() => inCourse("Title Screen/Credits") && inGameState("Cutscene")
function enterCourseEpisode(courseName, courseStateName) => once(inCourse(courseName) && inCourseState(courseStateName) && inGameState("Enter"))
function enterAnyCourseEpisode(courseName, courseStateNames)
{
	courseStateCheck = always_false()
	for courseStateName in courseStateNames courseStateCheck = courseStateCheck || inCourseState(courseStateName)
	return once(inCourse(courseName) && __ornext(courseStateCheck) && inGameState("Enter"))
}
function enterSubArea(courseName, courseStateName) => wasInGameState("Loading") && inCourse(courseName) && inCourseState(courseStateName)

function activateTimer() => byte(hudPtr() + 0x4a) > prev(byte(hudPtr() + 0x4a))
function allPiantasRescued() => piantasRescued() == 10
function allRedCoins() => prev(redCoins()) == 7 && redCoins() == 8
function boatNotMoving() => __ornext(wasInCourseState("dolpic0") || wasInCourseState("dolpic1") || wasInCourseState("dolpic5"))
function boxingClever(level) => countRegionBits([6, 0x578993], 2) == level
function talkToNpc(instanceID) => word_be(nearbyNpcPtr() + objectOffsets["Inherited"]["Instance"]) == instanceID && byte(nearbyNpcPtr() + 0xf1) == 0xa
function reachRaceFlag() => regionBit([5, 0x578a6c]) > prev(regionBit([5, 0x578a6c]))
function spawnAnyShine() => regionBit([0, 0x578a6c]) > prev(regionBit([0, 0x578a6c]))
function timerActive() => byte(hudPtr() + 0x4a) == 1
function timerWasActive() => prev(byte(hudPtr() + 0x4a)) == 1
function yoshiLocked() => regionBit([7, 0x5789f9]) == 0

// Mario
function animation(regionName, animationName) => word_be(animationPtr(regionName) + 0x84) == marioAnimationIDs[animationName]
function wasAnimation(regionName, animationName) => prev(word_be(animationPtr(regionName) + 0x84)) == marioAnimationIDs[animationName]
function anyAnimation(regionName, animationNames)
{
	trigger = always_false()
	for animationName in animationNames trigger = trigger || animation(regionName, animationName)
	return __ornext(trigger)
}
function coasterPosition(regionName) => float_be(animationPtr(regionName) + 0x1a3c)
function coveredInGoop(regionName) => float_be(marioPtr(regionName) + 0x134) != 0.0
function enterArea(regionName, coordinate, threshold) => prev(coordinate(regionName)) < threshold && coordinate(regionName) >= threshold
function takeDirtyWaterDamage(regionName) => touchWater(regionName) && takeDamage(regionName)
function grounded(regionName) => yCoordinate(regionName) == float_be(marioPtr(regionName) + 0xec)
function grabAnything(regionName) => dword_be(marioPtr(regionName) + 0x384) != 0
function holdingObject(regionName, objectID) => word_be(holdPtr(regionName) + objectOffsets["Inherited"]["ID"]) == objectID
function holdingFruit(regionName) => byte(marioPtr(regionName) + 0x383) == 2
function notHoldingObject(regionName) => dword_be(marioPtr(regionName) + 0x6c) == 0
function refillFludd(regionName) => dword_be(fluddPtr(regionName) + 0x1c80) > prev(dword_be(fluddPtr(regionName) + 0x1c80))
function releaseObject(regionName, objectID) => word_be(prev(holdPtr(regionName)) + objectOffsets["Inherited"]["ID"]) == objectID && dword_be(marioPtr(regionName) + 0x6c) == 0
function rideYoshi(regionName) => byte(yoshiPtr(regionName)) == 8
function ridingBlooper(regionName, colorName) => byte(marioPtr(regionName) + 0x389) == blooperColorIDs[colorName]
function speed(regionName) => float_be(marioPtr(regionName) + 0xb0)
function standingAngle(regionName) => float_be(marioPtr(regionName) + 0x370)
function standingOn(regionName, surfaceName) => grounded(regionName) && byte(marioPtr(regionName) + 0x4eb) == surfaceIDs[surfaceName]
function standingOnGoop(regionName) => bit6(marioPtr(regionName) + 0x11b) == 1
function standingOnPlatform(regionName, platformID) => word_be(platformPtr(regionName) + objectOffsets["Inherited"]["ID"]) == platformID
function state(regionName) => dword_be(marioPtr(regionName) + 0x7c)
function swimming(regionName) => state(regionName) >= 0x22d1 && state(regionName) <= 0x24d9
function takeDamage(regionName) => byte(marioPtr(regionName) + 0x121) < prev(byte(marioPtr(regionName) + 0x121))
function terminalGroundPound(regionName) => byte(marioPtr(regionName) + 0x85) == 3
function touchWater(regionName) => bit1(marioPtr(regionName) + 0x119) == 1
function useNozzle(regionName, nozzleID) => byte(fluddPtr(regionName) + 0x1c84) == nozzleID && byte(fluddPtr(regionName) + 0x1c86) == 1
function useFludd(regionName) => byte(marioPtr(regionName) + 0x383) == 0
function wasGrounded(regionName) => prev(yCoordinate(regionName)) == prev(float_be(marioPtr(regionName) + 0xec))
function wasTerminalGroundPound(regionName) => prev(byte(marioPtr(regionName) + 0x85)) == 3
function yCoordinate(regionName) => float_be(marioPtr(regionName) + 0x14)
function yVelocity(regionName) => float_be(marioPtr(regionName) + 0xa8)
function zCoordinate(regionName) => float_be(marioPtr(regionName) + 0x18)
function onRubberBand(regionName) => dword_be(marioPtr(regionName) + 0x68) != 0
function nonSlideJump(regionName) => !wasAnimation(regionName, "Slide") && !animation(regionName, "Slide") && prev(yVelocity(regionName)) == 0.0 && yVelocity(regionName) > 0.0

// Enemies

function defeatEnemy(regionName, enemyTableOffset) => enemyHealth(regionName, enemyTableOffset) == 0
function enemyHealth(regionName, enemyTableOffset) => byte((dword_be(enemyPtr(regionName) + enemyTableOffset) & ptrMask) + 0x13c)

// Boss
function bossAnimation(regionName, bossName, animationName) => byte((dword_be((dword_be(bossPtr(regionName) + bossTableOffsets[bossName]) & ptrMask) + 0x74) & ptrMask) + 0x63) == bossAnimationIDs[bossName][animationName]
function bossHealth(regionName, bossName) => byte((dword_be(bossPtr(regionName) + bossTableOffsets[bossName]) & ptrMask) + 0x13c)
function bossHits(regionName, bossName) => byte((dword_be(bossPtr(regionName) + bossTableOffsets[bossName]) & ptrMask) + 0x153)
function defeatBoss(regionName, bossName) => bossHealth(regionName, bossName) == 0
function paintKingBoo(regionName)
{
	goopColors = []
	array_push(goopColors, once(byte(kingBooPtr(regionName) + 0x348) == 230 && byte(kingBooPtr(regionName) + 0x349) == 100 && byte(kingBooPtr(regionName) + 0x34a) == 180))
	array_push(goopColors, once(byte(kingBooPtr(regionName) + 0x348) == 230 && byte(kingBooPtr(regionName) + 0x349) == 180 && byte(kingBooPtr(regionName) + 0x34a) == 0))
	array_push(goopColors, once(byte(kingBooPtr(regionName) + 0x348) == 150 && byte(kingBooPtr(regionName) + 0x349) == 50 && byte(kingBooPtr(regionName) + 0x34a) == 230))
	return goopColors
}

// Objects
function spawnShine(shineInstanceID)
{
	return word_be((dword_be(nearbyShinesPtr()) & ptrMask) + objectOffsets["Inherited"]["Instance"]) == shineInstanceID &&
		   byte((dword_be(nearbyShinesPtr()) & ptrMask) + objectOffsets["Shine"]["State"]) == shineStateIDs["Spawn"]
}
function grabShine(regionName, shineInstanceID)
{
	return word_be(grabPtr(regionName) + objectOffsets["Inherited"]["Instance"]) == shineInstanceID &&
		   byte(grabPtr(regionName) + objectOffsets["Shine"]["State"]) == shineStateIDs["Collect"]
}
function revealedOneUp(regionName, tableOffset) =>  byte((dword_be(dynamicObjectsPtr(regionName) + tableOffset) & ptrMask) + objectOffsets["1-Up"]["Hidden"]) == 0
function spawnedOneUp(regionName, tableOffset) =>  byte((dword_be(dynamicObjectsPtr(regionName) + tableOffset) & ptrMask) + objectOffsets["1-Up"]["Spawned"]) == 1
function collectOneUp(regionName, tableOffset) =>  byte((dword_be(dynamicObjectsPtr(regionName) + tableOffset) & ptrMask) + objectOffsets["1-Up"]["Collected"]) > prev(byte((dword_be(dynamicObjectsPtr(regionName) + tableOffset) & ptrMask) + objectOffsets["1-Up"]["Collected"]))
function collectHiddenOneUp(regionName, tableOffset) => revealedOneUp(regionName, tableOffset) && trigger_when(collectOneUp(regionName, tableOffset))
function sprayNokiPainting(regionName) => dword_be((dword_be(paintingPtr(regionName) + 0x120) & ptrMask) + 0x328) != 0

// Sort

// Scripts

function winBoxingClever()
{
	return __ornext(inCourseState("dolpic10") || inCourseState("dolpic6") || inCourseState("dolpic7")) && prev(word_be(scriptPtr() + 0xf2e)) == 0x470 && word_be(scriptPtr() + 0xf2e) == 0x32f || 
					inCourseState("dolpic8") && prev(word_be(scriptPtr() + 0x124a)) == 0x470 && word_be(scriptPtr() + 0x124a) == 0x32f || 
					inCourseState("dolpic5") && prev(word_be(scriptPtr() + 0x1566)) == 0x470 && word_be(scriptPtr() + 0x1566) == 0x32f
}
function endBeachCleaning() => word_be(scriptPtr() + 0x372) == 0x2cd

function finishBlooperRace() => prev(word_be(scriptPtr() + 0x372)) == 0x38a && word_be(scriptPtr() + 0x372) == 0x46e
function winMonteRace(courseName)
{
	if (courseName == "Gelato Beach" || courseName == "Noki Bay") return word_be(scriptPtr() + 0x68e) == 0x27d && reachRaceFlag()
	else if (course == courseIDs["Pianta Village"]) return word_be(scriptPtr() + 0x372) == 0x279 && reachRaceFlag()
}

// Trigger

function noki2Challenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(sprayNokiPainting(regionName) || holdingObject(regionName, objectIDs["Spring"])) && trigger_when(grabShine(regionName, shineInstanceIDs["Noki Bay"]["The Boss of Tricky Ruins"]))
	return trigger && never(inGameState("Loading")) && enterCourseEpisode("Noki Bay", "Episode 2")
}

function noki6Challenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(onRubberBand(regionName))
	return trigger && never(wasInGameState("Loading")) && enterCourseEpisode("Noki Bay", "Episode 6") && trigger_when(inCourse("Noki Bay - The Shell's Secret"))
}

function biancoWindmillChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(standingOnPlatform(regionName, objectIDs["Bianco Windmill Platform"]) || useNozzle(regionName, nozzleIDs["Hover"]))
	return trigger && never(inGameState("Loading")) && enterAnyCourseEpisode("Bianco Hills", ["Episode 1", "Episode 2"]) && trigger_when(inCourse("Bianco Hills - Down with Petey Piranha!"))
}

function revealNokiPlatform(regionName)
{
	trigger = always_false()
	for platformOffset in [0x174, 0x2a0, 0x3cc, 0x4f8, 0x624, 0x750, 0x87c] trigger = trigger || dword_be((dword_be(dword_be(mapPtr(regionName) + 0x2f4) & ptrMask) & ptrMask) + platformOffset) == 2
	return __ornext(trigger)
}

function uncorkWaterfallChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(revealNokiPlatform(regionName) || coveredInGoop(regionName)) && trigger_when(grabShine(regionName, shineInstanceIDs["Noki Bay"]["Uncork the Waterfall"]))
	return trigger && never(inGameState("Loading")) && enterCourseEpisode("Noki Bay", "Episode 1")
}

function riccoTowerChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(useFludd(regionName))
	return trigger && never(!inCourse("Ricco Harbor") && !inCourse("Ricco Harbor - The Secret of Ricco Tower")) && enterCourseEpisode("Ricco Harbor", "Episode 4") && trigger_when(inCourse("Ricco Harbor - The Secret of Ricco Tower"))
}

function dirtyLakeChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(swimming(regionName) || useFludd(regionName))
	return trigger && never(!inCourse("Bianco Hills") && !inCourse("Bianco Hills - The Secret of the Dirty Lake")) && enterCourseEpisode("Bianco Hills", "Episode 6") && trigger_when(inCourse("Bianco Hills - The Secret of the Dirty Lake"))
}

function montemanNokiChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(swimming(regionName) || useFludd(regionName))
	return trigger && never(inGameState("Loading")) && once(inCourse("Noki Bay") && inCourseState("Episode 5") && activateTimer()) && trigger_when(winMonteRace("Noki Bay"))
}
function montemanGelatoChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(standingOn(regionName, "Grass") || useFludd(regionName))
	return trigger && never(inGameState("Loading")) && once(inCourse("Gelato Beach") && inCourseState("Episode 5") && activateTimer()) && trigger_when(winMonteRace("Gelato Beach"))
}

function slideChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(!animation(regionName, "Slide") || standingAngle(regionName) != 0.0) && repeated(60, speed(regionName) >= 100.0)
	return trigger
}

function dirtyPiantaChallenge()
{
	npcEncounters = []
	for courseStateName in ["Episode 3", "Episode 4", "Episode 5", "Episode 6", "Episode 7", "Episode 8"] array_push(npcEncounters, once(inCourseState(courseStateName) && talkToNpc(0x8f7b)))
	
	return unless(!inCourse("Bianco Hills")) && measured(tally(6, npcEncounters))
}

function beachCannonChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(defeatBoss(regionName, "Monty Mole"))
	return trigger && never(!inCourse("Pinna Park - Beach") && !inCourse("Pinna Park - The Beach Cannon's Secret")) && once(enterSubArea("Pinna Park - Beach", "pinnaBeach1")) && trigger_when(inCourse("Pinna Park - The Beach Cannon's Secret"))
}

function superSlideChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(zCoordinate(regionName) >= -16500.0 && wasGrounded(regionName)) && trigger_when(grabShine(regionName, shineInstanceIDs["Delfino Plaza"]["Super Slide"]))
	return trigger && never(inGameState("Loading")) && once(enterSubArea("Delfino Plaza - Super Slide", "dolpic_ex1"))
}

function turboTrackChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(useNozzle(regionName, nozzleIDs["Rocket"]) || useNozzle(regionName, nozzleIDs["Turbo"])) && trigger_when(grabShine(regionName, shineInstanceIDs["Delfino Plaza"]["Turbo Track"]))
	return trigger && never(inGameState("Loading")) && once(enterSubArea("Delfino Plaza - Turbo Track", "bia_ex1"))
}

function dirtyLakeSecretChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(nonSlideJump(regionName) || useFludd(regionName)) && trigger_when(grabShine(regionName, shineInstanceIDs["Bianco Hills"]["The Secret of the Dirty Lake"]))
	return trigger && never(inGameState("Loading")) && once(enterSubArea("Bianco Hills - The Secret of the Dirty Lake", "coro_ex0"))
}
function hillsideCaveSecretChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(nonSlideJump(regionName) || useFludd(regionName)) && trigger_when(grabShine(regionName, shineInstanceIDs["Bianco Hills"]["The Hillside Cave Secret"]))
	return trigger && never(inGameState("Loading")) && once(enterSubArea("Bianco Hills - The Hillside Cave Secret", "coro_ex1"))
}
function riccoTowerSecretChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(nonSlideJump(regionName) || useFludd(regionName)) && trigger_when(grabShine(regionName, shineInstanceIDs["Ricco Harbor"]["The Secret of Ricco Tower"]))
	return trigger && never(inGameState("Loading")) && once(enterSubArea("Ricco Harbor - The Secret of Ricco Tower", "coro_ex2"))
}

function coconutChallenge()
{
	trigger = always_false()
	for regionName in regionNames
	{
		coconutHalted = float_be(prior(holdPtr(regionName)) + 0x98) == 0
		coconutDespawn = byte(prior(holdPtr(regionName)) + 0xfd) == 0xa
		
		basketCounter = byte((dword_be(staticObjectsPtr(regionName) + fruitBasketOffsets["Delfino Plaza - Coconut"]["dolpic5"]) & ptrMask) + 0x167)
		trigger = trigger || unless(!regionCheck(regionName) || !inCourseState("dolpic5")) && never(grabAnything(regionName) || notHoldingObject(regionName) && coconutHalted) && once(once(wasTerminalGroundPound(regionName)) && releaseObject(regionName, objectIDs["Coconut"])) && trigger_when(coconutDespawn && basketCounter > prev(basketCounter))
		
		basketCounter = byte((dword_be(staticObjectsPtr(regionName) + fruitBasketOffsets["Delfino Plaza - Coconut"]["dolpic6/7/8/10"]) & ptrMask) + 0x167)
		trigger = trigger || unless(!regionCheck(regionName) || (!inCourseState("dolpic6") && !inCourseState("dolpic7") && !inCourseState("dolpic8") && !inCourseState("dolpic10"))) && never(grabAnything(regionName) || notHoldingObject(regionName) && coconutHalted) && once(once(wasTerminalGroundPound(regionName)) && releaseObject(regionName, objectIDs["Coconut"])) && trigger_when(coconutDespawn && basketCounter > prev(basketCounter))
	}
	return trigger && never(!inCourse("Delfino Plaza"))
}

function pineappleChallenge()
{
	trigger = always_false()
	for regionName in regionNames
	{
		pineappleHalted = float_be(prior(holdPtr(regionName)) + 0x98) == 0
		pineappleDespawn = byte(prior(holdPtr(regionName)) + 0xfd) == 0xa
		
		basketCounter = byte((dword_be(staticObjectsPtr(regionName) + fruitBasketOffsets["Delfino Plaza - Pineapple"]["dolpic5/6/7/8"]) & ptrMask) + 0x163)
		trigger = trigger || unless(!regionCheck(regionName) || (!inCourseState("dolpic5") && !inCourseState("dolpic6") && !inCourseState("dolpic7") && !inCourseState("dolpic8"))) && never(grabAnything(regionName) || pineappleHalted) && once(zCoordinate(regionName) >= -5175.0 && releaseObject(regionName, objectIDs["Pineapple"])) && trigger_when(pineappleDespawn && basketCounter > prev(basketCounter))
		
		basketCounter = byte((dword_be(staticObjectsPtr(regionName) + fruitBasketOffsets["Delfino Plaza - Pineapple"]["dolpic10"]) & ptrMask) + 0x163)
		trigger = trigger || unless(!regionCheck(regionName) || !inCourseState("dolpic10")) && never(grabAnything(regionName) || pineappleHalted) && once(zCoordinate(regionName) >= -5175.0 && releaseObject(regionName, objectIDs["Pineapple"])) && trigger_when(pineappleDespawn && basketCounter > prev(basketCounter))
	}
	return trigger && never(!inCourse("Delfino Plaza"))
}

function cagedShineChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(yCoordinate(regionName) >= 3000.0 && standingOn(regionName, "Metal Platform") || useNozzle(regionName, nozzleIDs["Rocket"])) && trigger_when(grabShine(regionName, shineInstanceIDs["Ricco Harbor"]["The Caged Shine Sprite"]))
	return trigger && never(inGameState("Loading")) && enterCourseEpisode("Ricco Harbor", "Episode 3")
}
function climbAirstripFlagpole()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || regionCheck(regionName) && anyAnimation(regionName, ["Hold Pole", "Climb Pole"]) && enterArea(regionName, yCoordinate, 3900.0)
	return trigger && __ornext(inCourse("Delfino Airstrip") || inCourse("Delfino Plaza - Delfino Airstrip")) && !inGameState("Loading")
}

// Collect all one ups --- check for matching offset entries in the dictionary for different course states and optimize checks accordingly
function collectAllOneUps(offsets, courseName)
{
	trigger = always_false()
	for regionName in regionNames
	{
		courseStatesAccountedFor = []
		for courseStateName in offsets[courseName]
		{
			if (none_of(courseStatesAccountedFor, courseStateAccountedFor => courseStateAccountedFor == courseStateName))
			{
				array_push(courseStatesAccountedFor, courseStateName)
				courseStates = [courseStateName]
				for nextCourseStateName in offsets[courseName]
				{
					if (nextCourseStateName != courseStateName)
					{	
						courseStatesMatch = true
						oneUpIndex = 0
						for oneUpOffset in offsets[courseName][nextCourseStateName]
						{
							if (oneUpOffset != offsets[courseName][courseStateName][oneUpIndex]) courseStatesMatch = false
							oneUpIndex = oneUpIndex + 1
						}

						if (courseStatesMatch == true)
						{
							array_push(courseStatesAccountedFor, nextCourseStateName)
							array_push(courseStates, nextCourseStateName)
						}
					}	
				}

				if (courseStateName == "N/A") courseStateCheck = always_true()
				else courseStateCheck = inAnyCourseState(courseStates)
				
				oneUpsCollected = []
				for oneUpOffset in offsets[courseName][courseStateName] array_push(oneUpsCollected, byte((dword_be(dynamicObjectsPtr(regionName) + oneUpOffset) & ptrMask) + oneUpObjectOffsets["Collected"]))
				if (length(oneUpsCollected) == 1) trigger = trigger || regionCheck(regionName) && inCourse(courseName) && courseStateCheck && !inGameState("Loading") && prev(oneUpsCollected[0]) == 0 && oneUpsCollected[0] == 1
				else trigger = trigger || prev(sum_of(oneUpsCollected, s => s)) == length(oneUpsCollected) - 1 && measured(sum_of(oneUpsCollected, s => s) == length(oneUpsCollected), when=regionCheck(regionName) && inCourse(courseName) && courseStateCheck)
			}
		}
	}
	return trigger && !inGameState("Loading")
}

// Collect any of the one ups --- check for matching offset entries in the dictionary for different course states and optimize checks accordingly
function collectAnyHiddenOneUps(offsets)
{
	trigger = always_false()
	for courseName in offsets
	{
		for regionName in regionNames
		{
			courseStatesAccountedFor = []
			for courseStateName in offsets[courseName]
			{
				if (none_of(courseStatesAccountedFor, courseStateAccountedFor => courseStateAccountedFor == courseStateName))
				{
					array_push(courseStatesAccountedFor, courseStateName)
					courseStates = [courseStateName]
					for nextCourseStateName in offsets[courseName]
					{
						if (nextCourseStateName != courseStateName)
						{	
							courseStatesMatch = true
							oneUpIndex = 0
							for oneUpOffset in offsets[courseName][nextCourseStateName]
							{
								if (oneUpOffset != offsets[courseName][courseStateName][oneUpIndex]) courseStatesMatch = false
								oneUpIndex = oneUpIndex + 1
							}

							if (courseStatesMatch == true)
							{
								array_push(courseStatesAccountedFor, nextCourseStateName)
								array_push(courseStates, nextCourseStateName)
							}
						}	
					}

					if (courseStateName == "N/A") courseStateCheck = always_true()
					else courseStateCheck = inAnyCourseState(courseStates)
					
					oneUp = dword_be(dynamicObjectsPtr(regionName) + offsets[courseName][courseStateName][0]) & ptrMask
					trigger = trigger || regionCheck(regionName) && inCourse(courseName) && courseStateCheck && prev(byte(oneUp + oneUpObjectOffsets["Hidden"])) == 0 && trigger_when(byte(oneUp + oneUpObjectOffsets["Collected"]) == 1)
				}
			}
		}
	}
	return trigger && !inGameState("Loading")
}

function collectDuckRingRiderOneUp()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || regionCheck(regionName) && collectHiddenOneUp(regionName, oneUpOffsets["Ricco Harbor"]["Episode 8"][0])
	return trigger && inCourse("Ricco Harbor") && inCourseState("Episode 8") && !inGameState("Loading")
}
function defeatAllEnemies(enemyTableOffsetArray)
{
	trigger = always_false()
	for regionName in regionNames
	{
		enemiesDefeated = []
		for enemyOffset in enemyTableOffsetArray array_push(enemiesDefeated, once(defeatEnemy(regionName, enemyOffset)))
		trigger = trigger || measured(tally(length(enemiesDefeated), enemiesDefeated),when=regionCheck(regionName))
	}
	return trigger
}
function earlyCourseChallenge(requirement, stageName) => wasInCourse("Delfino Plaza") && !wasInGameState("Loading") && requirement && trigger_when(inCourse(stageName))
function ferrisWheelChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(anyAnimation(regionName, ["Grab Fence (From Ground)", "Grab Fence (From Air)"])) && trigger_when(grabShine(regionName, shineInstanceIDs["Pinna Park"]["The Runaway Ferris Wheel"]))
	return trigger && never(inGameState("Loading")) && once(enterSubArea("Pinna Park - Park", "Episode 3"))
}
function goldBirdChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(useNozzle(regionName, nozzleIDs["Rocket"]) || useNozzle(regionName, nozzleIDs["Hover"]) || rideYoshi(regionName)) && trigger_when(grabShine(regionName, shineInstanceIDs["Delfino Plaza"]["The Gold Bird"]))
	return trigger && never(inGameState("Loading")) && once(inCourse("Delfino Plaza") && !inCourseState("dolpic9") && spawnShine(shineInstanceIDs["Delfino Plaza"]["The Gold Bird"]))
}
function gooperBlooperChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(bossAnimation(regionName, "Gooper Blooper 2", "Ripped Tentacle")) && trigger_when(defeatBoss(regionName, "Gooper Blooper 2"))
	return trigger && never(inGameState("Loading")) && enterCourseEpisode("Ricco Harbor", "Episode 5")
}
function goopyInfernoChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(yCoordinate(regionName) < -1000.0 && grounded(regionName)) && trigger_when(grabShine(regionName, shineInstanceIDs["Pianta Village"]["The Goopy Inferno"]))
	return trigger && never(inGameState("Loading")) && enterCourseEpisode("Pianta Village", "Episode 3")
}
function hotelLobbySecretChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(useFludd(regionName))
	return trigger && never(!inCourse("Sirena Beach - Hotel") && !inCourse("Sirena Beach - The Hotel Lobby's Secret")) && once(enterSubArea("Sirena Beach - Hotel", "delfino0")) && trigger_when(inCourse("Sirena Beach - The Hotel Lobby's Secret"))
}
function kingBooChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && measured(tally(3, paintKingBoo(regionName)))
	return trigger && never(!inCourse("Sirena Beach - King Boo Down Below"))
}
function mechaBowserChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(coasterPosition(regionName) < prev(coasterPosition(regionName))) && trigger_when(bossHits(regionName, "Mecha-Bowser") == 4)
	return trigger && never(inGameState("Loading")) && once(enterSubArea("Pinna Park - Roller Coaster", "pinnaBoss1"))
}
function mushroomPiantaChallenge() => inCourse("Delfino Plaza") && inCourseState("dolpic0") && prev(regionBit([4, 0x578997])) == 0 && trigger_when(regionBit([4, 0x578997]) == 1)
function purpleBlooperChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || regionCheck(regionName) && ridingBlooper(regionName, "Purple")
	return trigger && inCourse("Ricco Harbor - Blooper Surfing Safari") && trigger_when(spawnAnyShine())
}
function scrubBeachChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) && never(refillFludd(regionName))
	return trigger && never(inGameState("Loading") || timerActive() && timer() < 6000) && enterCourseEpisode("Sirena Beach - Beach", "Episode 6") && trigger_when(endBeachCleaning())
}
function yoshisFruitAdventureChallenge()
{
	trigger = always_false()
	for regionName in regionNames trigger = trigger || unless(!regionCheck(regionName)) &&  never((standingOn(regionName, "Metal Platform") || standingOn(regionName, "Grass")) && rideYoshi(regionName)) && trigger_when(grabShine(regionName, shineInstanceIDs["Ricco Harbor"]["Yoshi's Fruit Adventure"]))
	return trigger && never(inGameState("Loading")) && enterCourseEpisode("Ricco Harbor", "Episode 8")
}

//// Achievements

// Progression

allEpisode7s = 0
shineAddr = [0, 0x578988]
for mainCourse in mainCourseNames
{
	for episode in range(1, 10)
	{
		if (episode == 7) allEpisode7s = allEpisode7s + regionBit(shineAddr)
		shineAddr = nextBit(shineAddr)
	}
}
achievement("Delfino Airstrip Dilemma", "Collect the first Shine Sprite in Delfino Airstrip", 1, inGame() && regionBitflip([6, 0x578992]), type="progression")
achievement("New Challenger Approaching", "Defeat the Polluted Piranha covering the Grand Pianta Statue in Delfino Plaza", 2, inGame() && regionBitflip([4, 0x5789f8]), type="progression")
achievement("Boathouse Blues", "Collect 3 Shine Sprites", 3, inGame() && prev(shines()) < 3 && shines() >= 3, type="progression")
achievement("Shiny Landmark", "Collect 5 Shine Sprites", 5, inGame() && prev(shines()) < 5 && shines() >= 5, type="progression")
achievement("Kidnapped...Again?!", "Collect 10 Shine Sprites", 5, inGame() && prev(shines()) < 10 && shines() >= 10, type="progression")
achievement("Look into the Light", "Collect 20 Shine Sprites", 10, inGame() && prev(shines()) < 20 && shines() >= 20, type="progression")
achievement("Retro Reunion", "Befriend Yoshi in Delfino Plaza", 5, inGame() && regionBitflip([7, 0x5789f9]), type="progression")
achievement("Time to Speed Things Up", "Obtain the Turbo Nozzle in Delfino Plaza", 10, inGame() && regionBitflip([7, 0x5789f4]), type="progression")
achievement("First Jump Man, Now Rocket Man", "Obtain the Rocket Nozzle in Delfino Plaza", 10, inGame() && regionBitflip([6, 0x5789f4]), type="progression")
achievement("Shadow Tsunami", "Complete Episode 7 in all 7 main courses", 10, inGame() && prev(allEpisode7s) == 6 && measured(allEpisode7s == 7), type="progression")
achievement("Bonding Time", "Collect the final Shine Sprite in Corona Mountain", 25, inEnding() && regionBitflip([7, 0x578996]), type="win_condition")

// Collection

mainCourseEpisodeShinesAddr = [0, 0x578988]
mainCourseSecretShinesAddr = [0, 0x578989]
mainCourseCoinShineAddr = [4, 0x578994]
mainCourseBlueCoinsAddr = [2, 0x57899d]
mainCourseBlueCoins = 0
for mainCourseName in mainCourseNames
{
	achievement(mainCourseEpisodeShinesTitle[mainCourseName], "Complete all 8 episodes in " + mainCourseName, 10, inGame() && prev(countRegionBits(mainCourseEpisodeShinesAddr, 8)) == 7 && measured(countRegionBits(mainCourseEpisodeShinesAddr, 8) == 8))
	for i in range(1, 10) mainCourseEpisodeShinesAddr = nextBit(mainCourseEpisodeShinesAddr)

	achievement(mainCourseSecretShinesTitle[mainCourseName], "Collect both secret Shine Sprites in " + mainCourseName, 5, inGame() && prev(countRegionBits(mainCourseSecretShinesAddr, 2)) == 1 && measured(countRegionBits(mainCourseSecretShinesAddr, 2) == 2))
	for i in range(1, 10) mainCourseSecretShinesAddr = nextBit(mainCourseSecretShinesAddr)

	achievement(mainCourseCoinShineTitle[mainCourseName], "Gather 100 Yellow Coins and collect the Shine Sprite in " + mainCourseName, 5, inGame() && regionBitflip(mainCourseCoinShineAddr))
	mainCourseCoinShineAddr = nextBit(mainCourseCoinShineAddr)
	
	blueCoins = countRegionBits(mainCourseBlueCoinsAddr, 30)
	mainCourseBlueCoins = mainCourseBlueCoins + blueCoins
	achievement(mainCourseblueCoinsTitle[mainCourseName], "Collect all 30 Blue Coins in " + mainCourseName, 25, inGame() && prev(blueCoins) == 29 && measured(blueCoins == 30))
	for i in range(1, 50) mainCourseBlueCoinsAddr = nextBit(mainCourseBlueCoinsAddr)
}

plazaShineAddrs = [[5, 0x578993], [6, 0x578993], [7, 0x578993], [0, 0x578994], [1, 0x578994], [2, 0x578994], [3, 0x578994], [4, 0x578996], [5, 0x578996], [6, 0x578996]]
plazaShines = 0
for plazaShineAddr in plazaShineAddrs plazaShines = plazaShines + regionBit(plazaShineAddr)
achievement("Janitor of the Year", "Collect all 10 Shine Sprites within Delfino Plaza", 25, inGame() && prev(plazaShines) == 9 && measured(plazaShines == 10))
achievement("Slip and Slide", "Collect the Shine Sprite in Super Slide", 3, inGame() && regionBitflip([2, 0x578993]))
achievement("Nothing But Pain", "Collect the Shine Sprite in Pachinko Game", 5, inGame() && regionBitflip([1, 0x578993]))
achievement("Thank You Lilly", "Collect the Shine Sprite in Lily Pad Ride", 5, inGame() && regionBitflip([3, 0x578993]))
achievement("F-Zero Sunshine", "Collect the Shine Sprite in Turbo Track", 3, inGame() && regionBitflip([7, 0x578992]))
achievement("Scavenger Hunt", "Collect the Shine Sprite in Red Coin Field", 3, inGame() && regionBitflip([4, 0x578993]))

tradeShineBaseAddrs = [[6, 0x578990], [4, 0x578995]]
tradeShineCount = [16, 8]
tradedBlueCoins = 0
for bitBlock in range(0, length(tradeShineBaseAddrs) - 1)
{
	tradeShineAddr = tradeShineBaseAddrs[bitBlock]
	for trade in range(1, tradeShineCount[bitBlock])
	{
		tradedBlueCoins = tradedBlueCoins + regionBit(tradeShineAddr) * 10
		tradeShineAddr = nextBit(tradeShineAddr)
	}
}
delfinoPlazaBlueCoins = countRegionBits([1, 0x578997], 19)
coronaMountainBlueCoins = countRegionBits([4, 0x5789cb], 10)
allBlueCoins = mainCourseBlueCoins + delfinoPlazaBlueCoins + coronaMountainBlueCoins + regionBit([0, 0x578997])
achievement("Inequivalent Exchange", "Trade all 240 Blue Coins for 24 Shine Sprites in the boathouse of Delfino Plaza", 25, inGame() && prev(tradedBlueCoins) < 240 && measured(tradedBlueCoins == 240))
achievement("Easy Way or the Hard Way", "Gather 100 Yellow Coins and collect the Shine Sprite in Delfino Plaza, Red Coin Field, or Delfino Airstrip", 5, inGame() && regionBitflip([3, 0x578995]))
achievement("Surf and Turf", "Collect all 19 Blue Coins in Delfino Plaza", 25, inGame() && prev(delfinoPlazaBlueCoins) == 18 && measured(delfinoPlazaBlueCoins == 19))
achievement("Get Rich or Die Trying", "Collect all 10 Blue Coins in Corona Mountain", 10, inGame() && prev(coronaMountainBlueCoins) == 9 && measured(coronaMountainBlueCoins == 10))
achievement("Red Coin Waterworks", "Collect the Shine Sprite in Delfino Airstrip after visiting Corona Mountain", 3, inGame() && regionBitflip([0, 0x578993]))
achievement("Melty Block", "Collect the Blue Coin in Delfino Airstrip after visiting Corona Mountain", 2, inGame() && regionBitflip([0, 0x578997]))
achievement("Shine On!", "Collect all 120 Shine Sprites", 50, (inGame() || inEnding()) && prev(shines()) < 120 && measured(shines() == 120))
achievement("Tanuki Time", "Collect all 240 Blue Coins", 50, inGame() && prev(allBlueCoins) == 239 && measured(allBlueCoins == 240))

// Secrets

achievement("Optometrist Approved", "Borrow a pair of sunglasses from a Pianta", 2, inGame() && regionBitflip([5, 0x578a6d]))
achievement("Ready to Party", "Borrow a tropical shirt from a Pianta", 3,inGame() && regionBit([7, 0x578996]) == 1 && regionBitflip([5, 0x578a6d]))
achievement("Have a Relaxing Vacation", "View the alternate ending", 5, inEnding() && watchingCutscene("omakeB"))

// Miscellaneous

achievement("Just Like Old Times", "Climb to the very top of the flagpole in Delfino Airstrip", 1, climbAirstripFlagpole())
achievement("Gather 'Round the Campfire", "Collect all 4 1-Ups in Delfino Plaza in one visit", 5, collectAllOneUps(oneUpOffsets, "Delfino Plaza"), type="missable")
achievement("Lily Pad Pilot", "Collect the 1-Up in Lily Pad Ride", 3, collectAllOneUps(oneUpOffsets, "Delfino Plaza - Lily Pad Ride"))
achievement("Sharpshooter", "Defeat all 17 green birds in Delfino Plaza in one visit", 5, never(!inCourse("Delfino Plaza") || (!inCourseState("dolpic9") && !inCourseState("dolpic10")) || inGameState("Loading")) && defeatAllEnemies(enemyTableOffsets["Delfino Plaza - Green Birds"]["dolpic9/dolpic10"]))

achievement("The Butterflies and Bees", "Collect all 3 1-Ups in Episode 8 of Bianco Hills in one visit", 5, collectAllOneUps(oneUpOffsets, "Bianco Hills"))
achievement("Nine Inch Nails", "Collect both 1-Ups in The Hillside Cave Secret in one visit", 5, collectAllOneUps(oneUpOffsets, "Bianco Hills - The Hillside Cave Secret"))
achievement("Shoot For the Stars", "Collect both 1-Ups in The Secret of the Dirty Lake in one visit", 5, collectAllOneUps(oneUpOffsets, "Bianco Hills - The Secret of the Dirty Lake"))
achievement("Lifeguard Duty", "Talk to the 3 duck-ring riders in Episode 8 of Ricco Harbor and collect the 1-Up as a reward", 3, collectDuckRingRiderOneUp())
achievement("Your Shipment Has Arrived", "Collect all 3 1-Ups in Ricco Harbor in one visit", 5, collectAllOneUps(oneUpOffsets, "Ricco Harbor"))
achievement("Wall-Kick Sandwich", "Collect both 1-Ups in The Secret of Ricco Tower in one visit", 5, collectAllOneUps(oneUpOffsets, "Ricco Harbor - The Secret of Ricco Tower"))
achievement("The Bar's Bounty", "Collect the 1-Up in Gelato Beach", 2, collectAllOneUps(oneUpOffsets, "Gelato Beach"))
achievement("Sandy Summit", "Collect both 1-Ups in the Dune Bud Sand Castle Secret in one visit", 5, collectAllOneUps(oneUpOffsets, "Gelato Beach - Dune Bud Sand Castle Secret"))
achievement("Hidden in the Clouds", "Collect the 1-Up in The Sand Bird is Born", 3, collectAllOneUps(oneUpOffsets, "Gelato Beach - The Sand Bird is Born"))
achievement("Post-Nap Snack", "Collect the 1-Up in the Pinna Park beach", 2, collectAllOneUps(oneUpOffsets, "Pinna Park - Beach"))
achievement("Brick by Brick", "Collect the 1-Up in Pinna Park", 2, collectAllOneUps(oneUpOffsets, "Pinna Park - Park"))
achievement("Look Out Below", "Collect both 1-Ups in The Beach Cannon's Secret in one visit", 5, collectAllOneUps(oneUpOffsets, "Pinna Park - The Beach Cannon's Secret"))
achievement("Under the Arch", "Collect all 3 1-Ups in The Yoshi-Go-Round's Secret in one visit", 5, collectAllOneUps(oneUpOffsets, "Pinna Park - The Yoshi-Go-Round's Secret"))
achievement("Mystery Box", "Collect the 1-Up in Sirena Beach", 2, collectAllOneUps(oneUpOffsets, "Sirena Beach - Beach"))
achievement("Electrical Fault", "Collect the 1-Up in the Sirena Beach casino", 2, collectAllOneUps(oneUpOffsets, "Sirena Beach - Casino"))
achievement("Watermelon Slam", "Collect all 3 1-Ups in The Hotel Lobby's Secret in one visit", 5, collectAllOneUps(oneUpOffsets, "Sirena Beach - The Hotel Lobby's Secret"))
achievement("Axis Rotation", "Collect both 1-Ups in The Secret of Casino Delfino in one visit", 5, collectAllOneUps(oneUpOffsets, "Sirena Beach - The Secret of Casino Delfino"))
achievement("Tour of the Bay Area", "Collect all 4 1-Ups in Episodes 4, 5, 7, or 8 of Noki Bay in one visit", 5, collectAllOneUps(oneUpOffsets, "Noki Bay"))
achievement("Totally Not a Trap", "Collect the 1-Up that only appears in Episode 6 of Noki Bay", 3, collectAllOneUps(uniqueOneUpOffsets, "Noki Bay"))
achievement("Fire Control", "Collect all 3 1-Ups in The Shell's Secret in one visit", 5, collectAllOneUps(oneUpOffsets, "Noki Bay - The Shell's Secret"))
achievement("Barking Up the Right Tree", "Collect all 4 1-Ups in Episode 5 of Pianta Village in one visit", 5, collectAllOneUps(oneUpOffsets, "Pianta Village"))
achievement("Cage Climber", "Collect the 1-Up that only appears in Episode 3 of Pianta Village", 2, collectAllOneUps(uniqueOneUpOffsets, "Pianta Village"))
achievement("Higher! Higher!", "Collect all 3 1-Ups in The Secret of the Village Underside in one visit", 10, collectAllOneUps(oneUpOffsets, "Pianta Village - Secret of the Village Underside"))
achievement("Moment of Reprieve", "Collect all 3 1-Ups in Corona Mountain in one visit", 10, collectAllOneUps(oneUpOffsets, "Corona Mountain"))

achievement("Silly Stus, 1-Ups Are for Mario", "Stomp on 3 Strollin' Stus at once after flipping them and collect the 1-Up reward", 3, collectAnyHiddenOneUps(stuOneUpOffsets))
achievement("Diamond Under Pressure", "Ground Pound 3 Strollin' Stus at once after flipping them and collect the 1-Up reward", 5, collectAnyHiddenOneUps(secondStuOneUpOffsets))
achievement("Jackpot!", "Ground Pound many Strollin' Stus at once after flipping them in a Sirena Beach sub-area and collect the 1-Up reward ", 10, collectAnyHiddenOneUps(thirdStuOneUpOffsets))

achievement("Hot Headed", "Stomp on 3 Smolderin' Stus at once after flipping them and collect the 1-Up reward", 5, collectAnyHiddenOneUps(smolderStuOneUpOffsets))
achievement("Peak Enemy Design", "Spray a Plurp and collect the 1-Up reward", 5, collectAnyHiddenOneUps(plurpOneUpOffsets))
achievement("Old School Style", "Stomp on a Guided Bullet Bill and collect the 1-Up reward", 3, collectAnyHiddenOneUps(guidedBulletBillOneUpOffsets))

// Challenges

achievement("Pianta Paradox", "Obtain a Blue Coin from the Pianta with mushrooms on his back on your first visit to Delfino Plaza", 10, mushroomPiantaChallenge(), type="missable")
achievement("Back to Basics", "Enter Pianta Village from Delfino Plaza before befriending Yoshi", 5, earlyCourseChallenge(yoshiLocked(), "Pianta Village"), type="missable")
achievement("You Have to Improvise", "Enter Pachinko Game from Delfino Plaza before the boat's in service", 10, earlyCourseChallenge(boatNotMoving(), "Delfino Plaza - Pachinko Game"), type="missable")
achievement("Leap Across the Leaves", "Enter Red Coin Field from Delfino Plaza before befriending Yoshi", 5, earlyCourseChallenge(yoshiLocked(), "Delfino Plaza - Red Coin Field"), type="missable")
achievement("Started from the Bottom", "Complete Episode 3 of Ricco Harbor without using the metal scaffolding or the Rocket Nozzle", 5, cagedShineChallenge())
achievement("Improvise, Adapt, Overcome", "Complete Episode 3 of Pianta Village without going under the village", 5, goopyInfernoChallenge())
achievement("Who Needs a Hover Nozzle?", "Collect the Gold Bird shine in an unflooded Delfino Plaza while only using the Turbo Nozzle", 5, goldBirdChallenge())
achievement("Humane Treatment", "Defeat Glooper Blooper in Episode 5 of Ricco Harbor without ripping off any tentacles", 5, gooperBlooperChallenge())
achievement("Tame the Beast", "Earn the Shine in Blooper Surfing Safari while riding the purple Blooper", 5, purpleBlooperChallenge())
achievement("Star Attraction", "Defeat Mecha-Bowser in Episode 1 of Pinna Park within one lap of the roller coaster", 5, mechaBowserChallenge())
achievement("The Power of Juice", "Complete Episode 8 of Ricco Harbor without stepping on grass or metal platforms while riding Yoshi", 10, yoshisFruitAdventureChallenge())
achievement("Power Nap", "Complete Episode 5 of Pinna Park without climbing on a fence", 5, ferrisWheelChallenge())
achievement("Only Up", "Enter The Hotel Lobby's Secret in Episode 2 of Sirena Beach without using F.L.U.D.D.", 5, hotelLobbySecretChallenge())
achievement("Pressure Washing Pro", "Scrub the beach clean with at least a minute to spare in Episode 6 of Sirena Beach without refilling F.L.U.D.D.", 10, scrubBeachChallenge())
achievement("Modern Art", "Paint King Boo with all 3 different colors of Goop in Episode 5 of Sirena Beach", 5, kingBooChallenge())
achievement("Half Court Contest", "Throw a pineapple in the yellow Pianta's basket from behind the third line in Delfino Plaza", 10, pineappleChallenge())

//achievement("", "Throw a coconut in the orange Pianta's basket during a terminal velocity ground pound", 10, coconutChallenge())

achievement("Traveling Shower Service", "Clean and talk to the dirty Pianta that rewards a Blue Coin in all 6 episodes that he appears in Bianco Hills", 5, dirtyPiantaChallenge())
achievement("Nice Place You Got Here", "Enter The Beach Cannon's Secret in Episode 2 of Pinna Park without defeating Monty Mole", 10, beachCannonChallenge())

achievement("Leap of Faith", "Collect the Shine in Super Slide without touching the ground past the starting point", 10, superSlideChallenge())
achievement("Who Needs a Turbo Nozzle?", "Collect the Shine in Turbo Track while only using the Hover Nozzle", 5, turboTrackChallenge())
achievement("Water is Wet", "Reach maximum sliding speed on a completely flat surface", 1, slideChallenge())

achievement("Simple and Clean", "Complete Episode 1 of Noki Bay without revealing any hidden platforms or touching Goop", 10, uncorkWaterfallChallenge())

achievement("Aquagenic Urticaria", "Win the race against Il Piantissimo in Episode 5 of Noki Bay without swimming or using F.L.U.D.D.", 10, montemanNokiChallenge())
achievement("Hay Fever", "Win the race against Il Piantissimo in Episode 5 of Gelato Beach without touching grass or using F.L.U.D.D.", 10, montemanGelatoChallenge())

achievement("Cube Shuffle", "Collect the Shine Sprite in The Hillside Cave Secret without jumping or using F.L.U.D.D.", 5, hillsideCaveSecretChallenge())
achievement("Belly Bounce", "Collect the Shine Sprite in The Secret of the Dirty Lake without jumping or using F.L.U.D.D.", 10, dirtyLakeSecretChallenge())
achievement("Roll Out", "Collect the Shine Sprite in The Secret of Ricco Tower without jumping or using F.L.U.D.D.", 10, riccoTowerSecretChallenge())

achievement("Dive Bomb", "Enter The Secret of the Dirty Lake in Episode 6 of Bianco Hills without swimming or using F.L.U.D.D.", 10, dirtyLakeChallenge())
achievement("Anyway the Wind Blows", "Enter The Secret of Ricco Tower in Episode 5 of Ricco Harbor without using F.L.U.D.D.", 5, riccoTowerChallenge())

achievement("Whuzzah!? Whozat?!", "Initiate the fight with Petey Piranha in Episode 1 of Bianco Hills", 5, wasInCourse("Bianco Hills") && wasInCourseState("Episode 1") && inCourse("Bianco Hills - Down with Petey Piranha!"))
achievement("Spin Cycle", "Initiate the fight with Petey Piranha in Episode 1 or 2 of Bianco Hills without using the windmill platforms or the Hover Nozzle", 10, biancoWindmillChallenge())

achievement("Surprise Attack", "Complete Episode 2 of Noki Bay without revealing the hidden path or grabbing the spring", 10, noki2Challenge())
achievement("What the Shell", "Enter The Shell's Secret in Episode 6 of Noki Bay without using the ropes", 5, noki6Challenge())

//// Leaderboards

// Countdown

for level in range(0, 2) leaderboard("Boxing Clever " + level + 1 + " Speedrun", "Break all the crates in the " + iterations[level] + " formation as fast as possible in Delfino Plaza", inCourse("Delfino Plaza") && boxingClever(level) && timerWasActive() && winBoxingClever(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false)
for timedRedCoinCourseName in timedRedCoinCourseNames leaderboard(timedRedCoinCourseTitles[timedRedCoinCourseName] + " Speedrun", "Collect all 8 red coins as fast as possible in " + timedRedCoinCourseTitles[timedRedCoinCourseName], inCourse(timedRedCoinCourseName) && timerWasActive() && allRedCoins(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false)
leaderboard("Scrubbing Sirena Beach Speedrun", "Scrub Sirena Beach clean as fast as possible in Episode 6 of Sirena Beach", inCourse("Sirena Beach - Beach") && inCourseState("Episode 6") && timerWasActive() && endBeachCleaning(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false)
leaderboard("Piantas in Need Speedrun", "Rescue all 10 Piantas as fast as possible in Episode 6 of Pianta Village", inCourse("Pianta Village") && inCourseState("Episode 6") && timerWasActive() && allPiantasRescued(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=false)

// Race

leaderboard("Blooper Surfing Safari Speedrun", "Cross the finish line as fast as possible in Blooper Surfing Safari", inCourse("Ricco Harbor - Blooper Surfing Safari") && timerWasActive() && finishBlooperRace(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=true)
for raceCourseName in raceCourseNames leaderboard(raceCourseTitles[raceCourseName] + " Speedrun", "Reach the flag as fast as possible during the race against Il Piantissimo in " + raceCourseEpisodes[raceCourseName] + " of " + raceCourseName, inCourse(raceCourseName) && inCourseState(raceCourseEpisodes[raceCourseName]) && timerWasActive() && reachRaceFlag(), always_false(), always_true(), timer(), format="MILLISECS", lower_is_better=true)