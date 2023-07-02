// Shinobi
// #ID = 19118
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

id = 331832
badge = 374658

for s in range(0, 0x10)
{
	if (s != 0xf)
	{
		description = "Clear Stage " + stage[s]
		if (s != 0x10) description = description + " in story mode"
		
		points = 5
		if (s == 0x10) points = 10
		
		trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && prev(byte(0x832289)) == s && byte(0x832289) == s + 1
		if (s == 0x10) trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear()
		
		achievement
		(
			id = id,
			badge = format("", badge),
			title = stageAchTitles[s],
			description = description,
			points = points,
			trigger = trigger
		)
		id = id + 1
		badge = badge + 1
	}
	
	else
	{
		achievement
		(
			id = id,
			badge = format("",  badge),
			title = "The Shadow Fades",
			description = "Clear the game on Normal and unlock Hard",
			points = 25,
			trigger = byte(0x832aa4) == 8 && byte(0x832aa6) == 3 && bit(0, 0x832281) > prev(bit(0, 0x832281))
		)
		id = id + 1
		badge = badge + 1
	}
	
	points = 10
	if (s == 0x10) points = 25
	
	achievement
	(
		id = id,
		badge = format("",  badge),
		title = "Stage " + stage[s] + " - Kill 100%",
		description = "Clear Stage " + stage[s] + " while killing every enemy",
		points = points,
		trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear() && stageAllKills(s)
	)
	id = id + 1
	badge = badge + 1
	
	description = "Clear Stage " + stage[s] + " while killing the boss in one hit"
	if (s == 2) description = "Clear Stage " + stage[s] + " while killing the bosses in two hits or less"
	
	trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear() && stageBossPoint(s)
	if (s == 2) trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear() && stage2ABossPoint(s)
	
	achievement
	(
		id = id,
		badge = format("",  badge),
		title = "Stage " + stage[s] + " - Boss Point",
		description = description,
		points = 10,
		trigger = trigger
	)
	id = id + 1
	badge = badge + 1
	
	points = 25
	if (s == 0x10) points = 50
	
	achievement
	(
		id = id,
		badge = format("",  badge),
		title = "Stage " + stage[s] + " - No Damage",
		description = "Clear Stage " + stage[s] + " without taking damage",
		points = points,
		trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear() && stageNoDamage(s)
	)
	id = id + 1
	badge = badge + 1
	
	achievement
	(
		id = id,
		badge = format("",  badge),
		title = "Stage " + stage[s] + " - S Rank",
		description = "Clear Stage " + stage[s] + " with an S rank",
		points = points,
		trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear() && stageSRank(s)
	)
	id = id + 1
	badge = badge + 1
	
	if (s != 0x10)
	{	
		achievement
		(
			id = id,
			badge = format("",  badge),
			title = "Stage " + stage[s] + " - Hard",
			description = "Clear Stage " + stage[s] + " on Hard",
			points = 10,
			trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear() && byte(0x832AA8) == 2
		)
		id = id + 1
		badge = badge + 1
		
		achievement
		(
			id = id,
			badge = format("",  badge),
			title = "Stage " + stage[s] + " - Super",
			description = "Clear Stage " + stage[s] + " on Super",
			points = 10,
			trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageClear() && byte(0x832AA8) == 3
		)
		id = id + 1
		badge = badge + 1
		
		if (any_of(stageCoins, x => x == s)) //if there are coins in the stage
		{
			trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] - 1 && prev(sum_of(stageCoins[s], x => x/x)) == length(stageCoins[s]) - 1 && measured(sum_of(stageCoins[s], x => x/x) == length(stageCoins[s]))
			if (s == 0) trigger = trigger && prev(bit7(0x832281)) == 1 
			else if (s == 0xe) trigger = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && prev(sum_of(stageCoins[s], x => x/x)) == length(stageCoins[s]) - 1 && measured(sum_of(stageCoins[s], x => x/x) == length(stageCoins[s]))
			
			achievement
			(
				id = id,
				badge = format("",  badge),
				title = "Stage " + stage[s] + " - Coins",
				description = "Collect all " + length(stageCoins[s]) + " Oboro Clan coins in Stage " + stage[s],
				points = 10,
				trigger = trigger
			)
			id = id + 1
			badge = badge + 1
		}
	}
}

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Redemption and Revenge",
	description = "Clear the game on Hard and unlock Super",
	points = 25,
	trigger = byte(0x832aa4) == 8 && byte(0x832aa6) == 3 && bit(7, 0x832280) > prev(bit(7, 0x832280))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Restless Soul",
	description = "Clear the game on Super",
	points = 50,
	trigger = bit7(0x832aae) == 0 && byte(0x832aa4) == 8 && byte(0x832aa6) == 3 && byte(0x832AA8) == 3 && stageClear()
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Let Your Hatred Flow",
	description = "Clear the game as Moritsune",
	points = 25,
	trigger = bit7(0x832aae) == 0 && byte(0x832aa4) == 8 && byte(0x832aa6) == 3 && byte(0x83215C) == 1 && stageClear()
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("",  badge),
	title = "You Faught Well",
	description = "Clear the game as Joe Musashi",
	points = 25,
	trigger = bit7(0x832aae) == 0 && byte(0x832aa4) == 8 && byte(0x832aa6) == 3 && byte(0x83215C) == 2 && stageClear()
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Last Resort",
	description = "Consume a Makimono scroll to use a Ninjutsu technique",
	points = 1,
	trigger = useNinjustsu()
)
id = id + 1
badge = badge + 1

allMakimonoCheck = always_false()
for s in range(0, 0x10)
{
	if (none_of(bossOnlyStages, bossOnlyStage => s == bossOnlyStage))
	{
		allMakimonoCheck = allMakimonoCheck || (byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && stageAllMakimono(s))
	}
}

achievement
(
	id = 331980,
	badge = "374874",
	title = "No Handicap Needed",
	description = "Clear a stage while holding 3 Makimono scrolls",
	points = 5,
	trigger = stageClear() && allMakimonoCheck
)

i = 0
for c in range(4, 10)
{
	points = 5
	if (c == 4) points = 4
	else if (c == 10) points = 10
	
	achievement
	(
		id = id,
		badge = format("",  badge),
		title = tateAchTitles[i],
		description = "Use the Tate technique on " + c + " enemies simultaneously",
		points = points,
		trigger = tateChain(c)
	)
	id = id + 1
	badge = badge + 1
	i = i + 1
}

achievement
(
	id = 331981,
	badge = "374875",
	title = "Simulation Station",
	description = "Collect and save 5 Oboro Clan coins and unlock Stage Select",
	points = 5,
	trigger = prev(bit7(0x832281)) == 1 && bit(4, 0x832281) > prev(bit(4, 0x832281))
)

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Recollection",
	description = "Collect and save 10 Oboro Clan coins and unlock the Movie theater",
	points = 5,
	trigger = prev(bit7(0x832281)) == 1 && bit(5, 0x832281) > prev(bit(5, 0x832281))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Masterpiece Museum",
	description = "Collect and save 20 Oboro Clan coins and unlock the art Gallery",
	points = 10,
	trigger = prev(bit7(0x832281)) == 1 && bit(6, 0x832281) > prev(bit(6, 0x832281))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Tragic Destiny",
	description = "Collect and save 30 Oboro Clan coins and unlock Moritsune",
	points = 10,
	trigger = prev(bit7(0x832281)) == 1 && bit(2, 0x832281) > prev(bit(2, 0x832281))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Return of the Ninja Master",
	description = "Collect and save 40 Oboro Clan coins and unlock Joe Musashi",
	points = 25,
	trigger = prev(bit7(0x832281)) == 1 && bit(3, 0x832281) > prev(bit(3, 0x832281))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Full Dive VR",
	description = "Collect and save all 50 Oboro Clan coins and unlock Stage EX",
	points = 50,
	trigger = prev(bit7(0x832281)) == 1 && bit(1, 0x832281) > prev(bit(1, 0x832281))
)
id = id + 1
badge = badge + 1

stageBestSRankSum = 0
for s in range(0, 0x10) 
{
	if (s == 0x10) stageBestSRankSum = stageBestSRankSum + stageBestSRank(s + 1) //EX data is one slot higher than expected
	else stageBestSRankSum = stageBestSRankSum + stageBestSRank(s)
}

achievement
(
	id = id,
	badge = format("",  badge),
	title = "Kage Jōnin",
	description = "Earn an S rank in all 17 stages",
	points = 100,
	trigger = prev(bit7(0x832281)) == 1 && prev(stageBestSRankSum) == 16 && measured(stageBestSRankSum == 17)
)

////Leaderboards

id = 67950

for s in range(0, 0x10)
{
	for c in range(0, 2)
	{
		if (s != 0x10) //stage != EX
		{
			for d in difficulties
			{
				start = byte(0x832aa4) == stageX[s] && byte(0x832aa6) == stageY[s] && byte(0x832AA8) == d && byte(0x83215C) == c && stageClear()
				if (s == 0xf) start = start && byte(0x83216c) == 1
				
				leaderboard
				(
					id = id,
					title = "Stage " + stage[s] + " Time - " + difficulty[d] + " - " + character[c],
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
					title = "Stage " + stage[s] + " Total - " + difficulty[d] + " - " + character[c],
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
		
		else //stage = EX
		{
			start = byte(0x832aa4) == 9 && byte(0x83215C) == c && stageClear()
			
			leaderboard
			(
				id = id,
				title = "Stage " + stage[s] + " Time - " + character[c],
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
				title = "Stage " + stage[s] + " Total - " + character[c],
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
}

fullGameScore = 0
fullGameTime = 0
fullGameRank = 0

for s in range(0, 0xf)
{
	fullGameScore = fullGameScore + stageScore(s)
	fullGameTime = fullGameTime + stageTime(s)
	fullGameRank = fullGameRank + stageRank(s)
}

id = 68255

for c in range(0,2)
{
	for d in difficulties
	{
		start = byte(0x832aa4) == 8 && byte(0x832aa6) == 3 && byte(0x832AA8) == d && byte(0x83215C) == c && stageClear() && byte(0x83216c) == 0 && bit7(0x832aae) == 0
		
		leaderboard
		(
			id = id,
			title = "Full Game Total - " + difficulty[d] + " - " + character[c],
			description = "",
			start = start,
			cancel = always_false(),
			submit = always_true(),
			value = measured(fullGameScore),
			format = "VALUE"
		)
		id = id + 1
		
		fullGameCoins = 0
		for s in range(0, 0xf) fullGameCoins = fullGameCoins + stageCoins(s, d)
		
		leaderboard
		(
			id = id,
			title = "Full Game Coins - " + difficulty[d] + " - " + character[c],
			description = "",
			start = start,
			cancel = always_false(),
			submit = always_true(),
			value = measured(fullGameCoins),
			format = "VALUE"
		)
		id = id + 1
		
		leaderboard
		(
			id = id,
			title = "Full Game Time - " + difficulty[d] + " - " + character[c],
			description = "",
			start = start,
			cancel = always_false(),
			submit = always_true(),
			value = measured(fullGameTime),
			format = "MILLISECS", lower_is_better = true
		)
		id = id + 1
		
		leaderboard
		(
			id = id,
			title = "Full Game Rank - " + difficulty[d] + " - " + character[c],
			description = "",
			start = start,
			cancel = always_false(),
			submit = always_true(),
			value = measured(fullGameRank),
			format = "VALUE"
		)
		id = id + 1
	}
}

////Notes

//Rank Total Grade:
	//0-15 = C
	//16-31 = B
	//32-47 = A
	//48 = S
	
////Unused

//function stageClear() => __ornext(dword_be(0x4BADD8) != prev(dword_be(0x4BADD8)) || dword_be(0x4BADDC) != prev(dword_be(0x4BADDC)) || tbyte_be(0x4BADE0) != prev(tbyte_be(0x4BADE0))) && dword_be(0x4BADD8) == 0x53544147 && dword_be(0x4BADDC) == 0x455F434C && tbyte_be(0x4BADE0) == 0x454152 //This checks that the music ID changes to STAGE_CLEAR. Changed to the next function for simplicity