// Shinobi [Subset - Akujiki's Wrath]
// #ID = 25036
// timenoe

////Constants

stage = ["1-A", "1-B", "2-A", "2-B", "3-A", "3-B", "4-A", "4-B", "5-A", "5-B", "6-A", "6-B", "7-A", "7-B", "8-A", "8-B", "EX"]
stageX = [1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9]
stageY = [1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 1, 3, 0, 3, 8] //8-A is the exception which doesn't end in a seperate boss area
stageCoinTotal = [3, 2, 1, 1, 2, 1, 2, 3, 2, 0, 1, 0, 1, 0, 4, 1] //+1 for Hard and +2 for Super
difficulties = [0, 2, 3]
difficulty =
{
	0: "Normal",
	2: "Hard",
	3: "Super"
}
character = ["Hotsuma", "Moritsune", "Joe Musashi"]
stageCoins = 
{
	0: [byte(0x83228f), byte(0x832290), byte(0x832291), byte(0x832292), byte(0x832293)],
	1: [byte(0x832297), byte(0x832298), byte(0x832299), byte(0x83229a)],
	2: [byte(0x83229f), byte(0x8322a0), byte(0x8322a1)],
	3: [byte(0x8322a7), byte(0x8322a8), byte(0x8322a9)],
	4: [byte(0x8322af), byte(0x8322b0), byte(0x8322b1), byte(0x8322b3)],
	5: [byte(0x8322b7), byte(0x8322b8), byte(0x8322ba)],
	6: [byte(0x8322bf), byte(0x8322c0), byte(0x8322c1), byte(0x8322c2)],
	7: [byte(0x8322c7), byte(0x8322c8), byte(0x8322c9), byte(0x8322ca), byte(0x8322cb)],
	8: [byte(0x8322cf), byte(0x8322d0), byte(0x8322d1), byte(0x8322d2)],
	0xa: [byte(0x8322df), byte(0x8322e0), byte(0x8322e1)],
	0xc: [byte(0x8322ef), byte(0x8322f0), byte(0x8322f1)],
	0xe: [byte(0x8322ff), byte(0x832300), byte(0x832301), byte(0x832302), byte(0x832303), byte(0x832304)],
	0xf: [byte(0x832307), byte(0x832308), byte(0x832309)]
}
bossOnlyStages = [9, 11, 13]

clearDataBase = 0x51aa50
bestDataBase = 0x832320

stageAchTitles = ["Night Life", "Moonlit Rooftops", "Torii Tango", "Akujiki's Path", "The Backrooms", "Sticky Situation", "Infernal Collapse", "Sea of Fire", "Silent Surfer", "Slither Slice", "Limbo Simulator", "Mechanical Destruction", "Blossom of the Night", "Touching Reunion", "The Eye of the Storm", "The Shadow Fades", "Beta Tester"]
tateAchTitles = ["Die", "Forgive Me", "Rest in Peace", "I Am Sorry", "Soul to Rest", "Avenged by My Blade", "I Shall Have My Revenge"]

////Functions

function useNinjustsu() => dword(0x4830a4) != 0 && byte(dword(dword(0x4830a4) + 0x24) + 0x634) < prev(byte(dword(dword(0x4830a4) + 0x24) + 0x634)) && __ornext(byte(dword(dword(0x4830a4) + 0x24) + 0x9bc) == 0x5a || byte(dword(dword(0x4830a4) + 0x24) + 0x9bc) == 0x5e)
function tateChain(n) => dword(0x4830a4) != 0 && prev(byte(dword(0x4830a4) + 0x19dc)) == n && byte(dword(0x4830a4) + 0x19da) == n

function stageRank(s) => byte(clearDataBase + 0x58*s + 2)
function stageSRank(s) => byte(clearDataBase + 0x58*s + 2) == 3
function stageAllMakimono(s) => byte(clearDataBase + 0x58*s + 3) == 3
function stageScore(s) => dword(clearDataBase + 0x58*s + 4)
function stageTime(s) => byte(clearDataBase + 0x58*s + 8) * 360000 + byte(clearDataBase + 0x58*s + 9) * 6000 + byte(clearDataBase + 0x58*s + 10) * 100 + byte(clearDataBase + 0x58*s + 11)
function stageAllKills(s) => byte(clearDataBase + 0x58*s + 0xc) == byte(clearDataBase + 0x58*s + 0x10)
function stageCoins(s, d)
{
	coinTotal = stageCoinTotal[s]
	if (d == 2) coinTotal = coinTotal + 1
	else if (d == 3) coinTotal = coinTotal + 2

	stageCoinSum = 0
	if (coinTotal != 0) for coin in range(0, coinTotal - 1) stageCoinSum = stageCoinSum + (byte(clearDataBase + 0x58*s + 0x40 + coin)/byte(clearDataBase + 0x58*s + 0x40 + coin))
	
	return stageCoinSum
}
function stageBossPoint(s) => byte(clearDataBase + 0x58*s + 0x48) == 1
function stage2ABossPoint(s) => __ornext(byte(clearDataBase + 0x58*s + 0x48) == 1 || byte(clearDataBase + 0x58*s + 0x48) == 2)
function stageNoDamage(s) => byte(clearDataBase + 0x58*s + 0x4c) == 0

function stageClear() => prev(byte(0x8326a8)) == 0 && byte(0x8326a8) == 1
function stageBestSRank(s) => byte(bestDataBase + 0xc*s + 6)/3

////Achievements

id = 334587
badge = 377669

for s in range(0, 0x10)
{
	description = "Clear Stage " + stage[s] + " on Super, without taking damage, and with an S rank"
	if (s == 0x10) description = "Clear Stage " + stage[s] + " without taking damage and with an S rank"
	
	points = 50
	if (s == 0x10) points = 100
	
	trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear() && byte(0x832AA8) == 3 && stageNoDamage(s) && stageSRank(s)
	if (s == 0x10) trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear() && stageNoDamage(s) && stageSRank(s)
	
	achievement
	(
		id = id,
		badge = format("",  badge),
		title = "Stage " + stage[s] + " - Oboro Mark of Mastery",
		description = description,
		points = points,
		trigger = trigger
	)
	id = id + 1
	badge = badge + 1
}

////Leaderboards

id = 69965

for s in range(0, 0x10)
{
	for c in range(0, 2)
	{
		titleEnd = "Super/No Damage/S Rank - " + character[c]
		if (s == 0x10) titleEnd = "No Damage/S Rank - " + character[c]
		
		start = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && byte(0x832AA8) == 3 && byte(0x83215C) == c && stageClear() && byte(0x832AA8) == 3 && stageNoDamage(s) && stageSRank(s)
		if (s == 0xf) start = start && byte(0x83216c) == 1
		else if (s == 0x10) start = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && byte(0x83215C) == c && stageClear() && byte(0x832AA8) == 3 && stageNoDamage(s) && stageSRank(s)
		
		leaderboard
		(
			id = id,
			title = "Stage " + stage[s] + " Time - " + titleEnd,
			description = "",
			start = start,
			cancel = always_false(),
			submit = always_true(),
			value = measured(stageTime(s)),
			format = "MILLISECS", lower_is_better = true
		)
		id = id + 1

		leaderboard
		(
			id = id,
			title = "Stage " + stage[s] + " Total - " + titleEnd,
			description = "",
			start = start,
			cancel = always_false(),
			submit = always_true(),
			value = measured(stageScore(s)),
			format = "VALUE"
		)
		id = id + 1
	}
}