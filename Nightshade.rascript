// Nightshade | Kunoichi
// #ID = 19211
// timenoe

////Constants

mode = 
{
	0: [0,1,6],
	1: [7],
	2: [8],
	3: [9]
}

modeName = ["Stage ", "Time Attack ", "Survival ", "Mission "]

character = 
{
	0: [0, 1, 2],
	1: [3, 4],
	2: [5],
	3: [6]
}

characterName = ["Hibana", "Hisui", "Joe Musashi", "Hotsuma"]

difficulty = ["Beginner", "Easy", "Normal", "Hard"]

stages = [13, 8, 8, 8]

stageName = ["Tokyo", "Marunouchi", "Subway", "Shinjuku", "Container Yards", "Tokyo Highway", "Research Facility-A", "Research Facility-B", "Tokyo Harbor", "Harbor Road", "Outside of Palace", "Inside of Palace", "Top of Palace"]

stageAreas = [2, 5, 5, 5, 2, 2, 5, 5, 2, 5, 4, 5, 1]

coin = [7, 0x19fd2b6]

coins = [6, 7, 8, 9, 6, 6, 8, 6, 6, 8, 9, 9, 0]

stageCards = 
{
	0: [1, 9],
	1: [12, 15],
	2: [17, 22],
	3: [7, 16],
	4: [2, 18],
	5: [8, 23],
	6: [19, 21],
	7: [5, 10],
	8: [6, 24],
	9: [4, 25],
	10: [3, 26],
	11: [11, 20],
	12: [13, 14]
}

altStageName = 
{
	1: ["Rooftop Dash", "Sludge Slide", "Light Speed", "Rafter Rush", "Pedal to the Metal", "On the Wire", "Fall on the Wall", "Busy Bark"],
	2: ["Rooftop Rampage", "Colosseum Match", "Urban Destruction", "Traffic Jam", "Elevate the Competition", "Parking Fee", "Road Work Ahead", "Enjoy the View"],
	3: ["Shuriken Spam", "Classic Platforming", "Silent Slide", "Watch Your Step", "Blue Box Bash", "Chamber of Reflection", "Overcome the Illusion", "Just Like Survival"]
}

////Functions

function nextBit(addr)
{
	if (addr[0] == 7) return [0, addr[1] + 1]
	else return [addr[0] + 1, addr[1]]
}

function storyMode() => __ornext(byte(0x492fd0) == 1 || byte(0x492fd0) == 6)

function stageClear(s)
{
	if (s != 12) return byte(0x19fd766) == s && byte(0x19fd767) == stageAreas[s] - 1 && byte(0x19fd76d) == 1 && prev(dword_be(0x4a92d0)) == 0x49465f43 && dword_be(0x4a92d0) == 0x42475f45
	else return byte(0x19fd766) == s && byte(0x19fd76d) == 1 && prev(dword_be(0x4a92d0)) == 0x49465f43 && dword_be(0x4a92d0) == 0x42475f45
}

function stageRecordBase(m, d)
{
	if (m == 1) base = 0x019fd5dc
	else if (m == 2) base = 0x19fd63c
	else if (m == 3) base = 0x19fd69c
	else if (m == 0)
	{
		if (d == 0) base = 0x19fd36c
		else if (d == 1) base = 0x19fd408
		else if (d == 2) base = 0x19fd4a4
		else if (d == 3) base = 0x19fd540
	}
	
	return base
}

function stageBestCentiseconds(m, d, s)
{
	base = stageRecordBase(m, d)
	base = base + s * 0xc
	
	return byte(base) * 60 * 60 * 100 + byte(base + 1) * 60 * 100 + byte(base + 2) * 100 + byte(base + 3)
}

function stageBestTimeUpdate(m, d, s)
{
	base = stageRecordBase(m, d)
	base = base + s * 0xc
	
	return __ornext(byte(base) > prev(byte(base)) || byte(base + 1) > prev(byte(base + 1)) || byte(base + 2) > prev(byte(base + 2)) || byte(base + 3) > prev(byte(base + 3)))
}

function stageBestSRank(m, d, s)
{
	base = stageRecordBase(m, d)
	base = base + s * 0xc
	
	return byte(base + 10)/3
}

function allSRanks(m, d)
{
	sRanks = 0
	if (m == 0) s = 12 else s = 7
	for s in range(0, s) sRanks = sRanks + stageBestSRank(m, d, s)
	return sRanks
}

function everySRank()
{
	sRanks = 0
	for m in range(0, 3)
	{
		if (m == 0) s = 12 else s = 7
		for s in range(0, s)
		{
			if (m == 0)
			{
				for d in range(0, 3)
				{
					sRanks = sRanks + stageBestSRank(m, d, s)
				}
			}
			
			else sRanks = sRanks + stageBestSRank(m, -1, s)
		}
	}
	
	return sRanks
}

////Achievements

id = 333910
badge = 376755

for m in mode
{
	modeCheck = byte(0x492fd0) == mode[m][0]
	if (length(mode[m]) > 1) for i in range(1, length(mode[m]) - 1) modeCheck = __ornext(modeCheck || byte(0x492fd0) == mode[m][i])
	
	for s in range(0, stages[m] - 1)
	{
		if (m == 0)
		{
			if (s != 12)
			{
				achievement
				(
					id = id,
					badge = format("", badge),
					title = stageName[s],
					description = "Clear Stage " + (s + 1) + " in Story Mode",
					points = 5,
					trigger = storyMode() && byte(0x19fd766) == s && byte(0x19fd767) == stageAreas[s] - 1 && byte(0x19fd76d) == 1 && prev(byte(0x19fd2c6)) == s && byte(0x19fd2c6) == s + 1
				)
				id = id + 1
				badge = badge + 1
				
				achievement
				(
					id = id,
					badge = format("", badge),
					title = "Stage " + (s + 1) + " - Kills 100%",
					description = "Clear Stage " + (s + 1) + " while killing every enemy",
					points = 5,
					trigger = modeCheck && stageClear(s) && word(0x19fd7ba) == word(0x19fd7b8)
				)
				id = id + 1
				badge = badge + 1
			}
			
			achievement
			(
				id = id,
				badge = format("", badge),
				title = "Stage " + (s + 1) + " - Destruction 100%",
				description = "Clear Stage " + (s + 1) + " while destroying every destructible object",
				points = 5,
				trigger = modeCheck && stageClear(s) && word(0x19fd7be) == word(0x19fd7bc)
			)
			id = id + 1
			badge = badge + 1
			
			achievement
			(
				id = id,
				badge = format("", badge),
				title = "Stage " + (s + 1) + " - Nakatomi Supplies",
				description = "Clear Stage " + (s + 1) + " with holding all 3 Ninjutsu Scrolls",
				points = 5,
				trigger = modeCheck && stageClear(s) && dword(0x19fd7f0) == 15000
			)
			id = id + 1
			badge = badge + 1
			
			achievement
			(
				id = id,
				badge = format("", badge),
				title = "Stage " + (s + 1) + " - No Damage",
				description = "Clear Stage " + (s + 1) + " without taking damage or retrying on Normal or Hard",
				points = 10,
				trigger = modeCheck && byte(0x492fd4) >= 2 && stageClear(s) && dword(0x19fd7ac) == 0 && byte(0x19fd76e) == 0
			)
			id = id + 1
			badge = badge + 1
			
			description = "Clear Stage " + (s + 1) + " while earning 50,000 vs. boss score on Normal or Hard"
			if (s == 11) description = "Clear Stage 12 while earning at least 45,000 vs. boss score on Normal or Hard"
			
			trigger = modeCheck && byte(0x492fd4) >= 2 && stageClear(s) && dword(0x19fd7e8) + dword(0x19fd7ec) == 50000
			if (s == 11) trigger = modeCheck && byte(0x492fd4) >= 2 && stageClear(s) && dword(0x19fd7e8) + dword(0x19fd7ec) >= 45000
			
			achievement
			(
				id = id,
				badge = format("", badge),
				title = "Stage " + (s + 1) + " - vs. Boss",
				description = description,
				points = 10,
				trigger = trigger
			)
			id = id + 1
			badge = badge + 1
			
			achievement
			(
				id = id,
				badge = format("", badge),
				title = "Stage " + (s + 1) + " - S Rank",
				description = "Clear Stage " + (s + 1) + " with an S rank on Normal or Hard",
				points = 10,
				trigger = modeCheck && byte(0x492fd4) >= 2 && stageClear(s) && byte(0x19fd7fc) == 3
			)
			id = id + 1
			badge = badge + 1
			
			achievement
			(
				id = id,
				badge = format("", badge),
				title = "Stage " + (s + 1) + " - Hard",
				description = "Clear Stage " + (s + 1) + " on Hard",
				points = 5,
				trigger = modeCheck && byte(0x492fd4) == 3 && stageClear(s)
			)
			id = id + 1
			badge = badge + 1
			
			if (s != 12)
			{
				allStageCoins = 0
				for c in range(1, coins[s])
				{
					allStageCoins = allStageCoins + ~bit(coin[0], coin[1])
					coin = nextBit(coin)
				}
				achievement
				(
					id = id,
					badge = format("", badge),
					title = "Stage " + (s + 1) + " - Secret Coins",
					description = "Collect and save all " + coins[s] + " Secret Coins in Stage " + (s + 1),
					points = 10,
					trigger = modeCheck && byte(0x492fd4) >= 1 && byte(0x19fd766) == s && byte(0x19fd767) == stageAreas[s] - 1 && byte(0x19fd76d) == 1 && prev(allStageCoins) > 0 && measured(allStageCoins == coins[s])
				)
				id = id + 1
				badge = badge + 1
			}
			
			allStageCards = 0
			for c in range(0, length(stageCards[s]) - 1)
			{
				card = [4, 0x19fd2b0]
				for i in range(1, stageCards[s][c]) card = nextBit(card)
				allStageCards = allStageCards + ~bit(card[0], card[1])
			}
			
			trigger = modeCheck && byte(0x492fd4) >= 2 && byte(0x19fd766) == s && byte(0x19fd767) == stageAreas[s] - 1 && byte(0x19fd76d) == 1 && prev(allStageCards) == 1 && measured(allStageCards == length(stageCards[s]))
			if (s == 12) trigger = modeCheck && byte(0x492fd4) >= 2 && byte(0x19fd766) == s && byte(0x19fd76d) == 1 && prev(allStageCards) == 1 && measured(allStageCards == length(stageCards[s]))
			
			achievement
			(
				id = id,
				badge = format("", badge),
				title = "Stage " + (s + 1) + " - Secret Cards",
				description = "Collect and save both Secret Cards in Stage " + (s + 1),
				points = 10,
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
				badge = format("", badge),
				title = altStageName[m][s],
				description = "Clear " + modeName[m] + (s + 1),
				points = 5,
				trigger = modeCheck && byte(0x19fd766) == s && byte(0x19fd76d) == 1 && prev(dword_be(0x4a92d0)) == 0x49465f43 && dword_be(0x4a92d0) == 0x42475f45
			)
			id = id + 1
			badge = badge + 1
			
			achievement
			(
				id = id,
				badge = format("", badge),
				title = modeName[m] + (s + 1) + " - S Rank",
				description = "Clear " + modeName[m] + (s + 1) + " with an S Rank",
				points = 10,
				trigger = modeCheck && byte(0x19fd766) == s && byte(0x19fd76d) == 1 && prev(dword_be(0x004a92d0)) == 0x49465f43 && dword_be(0x004a92d0) == 0x42475f45 && byte(0x19fd7fc) == 3
			)
			id = id + 1
			badge = badge + 1
		}
	}
}

achievement
(
	id = id,
	badge = format("", badge),
	title = "You Are Already Dead",
	description = "Use the Tate technique on at least 10 enemies",
	points = 5,
	trigger = dword(0x4930d4) != 0 && byte(dword(dword(0x493154) + 0x15c) + 0x3c) >= 10 && trigger_when(byte(0x19fd811) > prev(byte(0x19fd811)))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Today’s Just Not Your Day",
	description = "Use the Tate technique on at least 25 enemies",
	points = 5,
	trigger = dword(0x4930d4) != 0 && byte(dword(dword(0x493154) + 0x15c) + 0x3c) >= 25 && trigger_when(byte(0x19fd811) > prev(byte(0x19fd811)))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Utsushiyo and Futaba's Wrath",
	description = "Use the Tate technique on at least 50 enemies",
	points = 10,
	trigger = dword(0x4930d4) != 0 && byte(dword(dword(0x493154) + 0x15c) + 0x3c) >= 50 && trigger_when(byte(0x19fd811) > prev(byte(0x19fd811)))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "The Shade of the Night",
	description = "Use the Tate technique on at least 100 enemies",
	points = 25,
	trigger = dword(0x4930d4) != 0 && byte(dword(dword(0x493154) + 0x15c) + 0x3c) >= 100 && trigger_when(byte(0x19fd811) > prev(byte(0x19fd811)))
)
id = id + 1
badge = badge + 1

modeCheck = byte(0x492fd0) == mode[0][0]
for i in range(1, length(mode[0]) - 1) modeCheck = __ornext(modeCheck || byte(0x492fd0) == mode[0][i])

achievement
(
	id = id,
	badge = format("", badge),
	title = "Shinobi of Water",
	description = "Clear the game on Easy to unlock Hisui",
	points = 10,
	trigger = storyMode() && byte(0x19fd766) == 12 && byte(0x19fd76d) == 1 && bit0(0x019fd2c2) < prev(bit0(0x019fd2c2))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = "376937",
	title = "It's Getting Hot in Here",
	description = "Clear the game on Normal to unlock Hard and Hibana's 2nd costume",
	points = 25,
	trigger = storyMode() && byte(0x19fd766) == 12 && byte(0x19fd76d) == 1 && bit0(0x019fd2ac) < prev(bit0(0x019fd2ac))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Master of the Oboro",
	description = "Clear the game on Normal with a completed Shinobi save on your memory card to unlock Hotsuma",
	points = 5,
	trigger = storyMode() && byte(0x19fd766) == 12 && byte(0x19fd76d) == 1 && bit3(0x019fd2ac) < prev(bit3(0x019fd2ac))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = "376935",
	title = "Follow Your Dreams",
	description = "Clear the game on Hard to unlock Hibana's 3rd costume",
	points = 50,
	trigger = storyMode() && byte(0x19fd766) == 12 && byte(0x19fd76d) == 1 && bit2(0x19fd2ac) < prev(bit2(0x19fd2ac))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Shinobi of Legend",
	description = "Clear a total of 88 stages to unlock Joe Musashi",
	points = 25,
	//trigger = byte(0x19fd76d) == 1 && bit1(0x19fd2c2) < prev(bit1(0x19fd2c2))
	trigger = byte(0x19fd76d) == 1 && prev(byte(0x19fd2ca)) == 87 && measured(byte(0x19fd2ca) == 88)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Space Channeler",
	description = "Collect all 88 Secret Coins to unlock Hisui's 2nd costume",
	points = 50,
	trigger = modeCheck && byte(0x19fd76d) == 1 && bit2(0x19fd2c2) < prev(bit2(0x19fd2c2))
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Riptide",
	description = "Clear the game as Hisui",
	points = 10,
	trigger = storyMode() && __ornext(byte(0x493184) == 3 || byte(0x493184) == 4) && stageClear(12)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Shuriken Shuffle",
	description = "Clear the game as Joe Musashi",
	points = 10,
	trigger = storyMode() && byte(0x493184) == 5 && stageClear(12)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Guard Counter",
	description = "Clear the game as Hotsuma",
	points = 10,
	trigger = storyMode() && byte(0x493184) == 6 && stageClear(12)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Genin Trial",
	description = "Earn an S rank in all 13 Beginner Story Mode stages",
	points = 10,
	trigger = __ornext(byte(0x492fd0) == 0 || byte(0x492fd0) == 1 || byte(0x492fd0) == 6) && byte(0x19fd76d) == 1 && prev(allSRanks(0, 0)) == 12 && measured(allSRanks(0, 0) == 13)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Chūnin Trial",
	description = "Earn an S rank in all 13 Easy Story Mode stages",
	points = 10,
	trigger = __ornext(byte(0x492fd0) == 0 || byte(0x492fd0) == 1 || byte(0x492fd0) == 6) && byte(0x19fd76d) == 1 && prev(allSRanks(0, 1)) == 12 && measured(allSRanks(0, 1) == 13)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Jōnin Trial",
	description = "Earn an S rank in all 13 Normal Story Mode stages",
	points = 25,
	trigger = __ornext(byte(0x492fd0) == 0 || byte(0x492fd0) == 1 || byte(0x492fd0) == 6) && byte(0x19fd76d) == 1 && prev(allSRanks(0, 2)) == 12 && measured(allSRanks(0, 2) == 13)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Kunoichi of Oboro",
	description = "Earn an S rank in all 13 Hard Story Mode stages",
	points = 50,
	trigger = __ornext(byte(0x492fd0) == 0 || byte(0x492fd0) == 1 || byte(0x492fd0) == 6) && byte(0x19fd76d) == 1 && prev(allSRanks(0, 3)) == 12 && measured(allSRanks(0, 3) == 13)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Oboro Optimization",
	description = "Earn an S rank in all 8 Time Attack stages",
	points = 25,
	trigger = byte(0x492fd0) == 7 && byte(0x19fd76d) == 1 && prev(allSRanks(1, -1)) == 7 && measured(allSRanks(1, -1) == 8)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Resilience",
	description = "Earn an S rank in all 8 Survival stages",
	points = 25,
	trigger = byte(0x492fd0) == 8 && byte(0x19fd76d) == 1 && prev(allSRanks(2, -1)) == 7 && measured(allSRanks(2, -1) == 8)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Adapt and Overcome",
	description = "Earn an S rank in all 8 Mission stages",
	points = 25,
	trigger = byte(0x492fd0) == 9 && byte(0x19fd76d) == 1 && prev(allSRanks(3, -1)) == 7 && measured(allSRanks(3, -1) == 8)
)
id = id + 1
badge = badge + 1

achievement
(
	id = id,
	badge = format("", badge),
	title = "Scarlet Flower",
	description = "Earn all 76 S ranks",
	points = 100,
	trigger = byte(0x19fd76d) == 1 && prev(everySRank()) == 75 && measured(everySRank() == 76)
)
id = id + 1
badge = badge + 1

////Leaderboards

id = 68879
for m in mode
{
	modeCheck = byte(0x492fd0) == mode[m][0]
	if (length(mode[m]) > 1) for i in range(1, length(mode[m]) - 1) modeCheck = __ornext(modeCheck || byte(0x492fd0) == mode[m][i])
	
	for s in range(0, stages[m] - 1)
	{
		for c in character
		{
			characterCheck = byte(0x493184) == character[c][0]
			if (length(character[c]) > 1) for i in range(1, length(character[c]) - 1) characterCheck = __ornext(characterCheck || byte(0x493184) == character[c][i])
			
			if (m == 0)
			{
				startingDifficulty = 1
				if (c == 0) startingDifficulty = 0
				
				for d in range(startingDifficulty, 3)
				{
					leaderboard
					(
						id = id,
						title = modeName[m] + (s + 1) + " Time - " + characterName[c] + " - " + difficulty[d],
						description = "",
						start = modeCheck && characterCheck && byte(0x492fd4) == d && byte(0x19fd766) == s && byte(0x19fd76d) == 1 && stageBestTimeUpdate(m, d, s),
						cancel = always_false(),
						submit = always_true(),
						value = measured(stageBestCentiseconds(m, d, s)),
						format = "MILLISECS", lower_is_better = true
					)
					id = id + 1
					
					leaderboard
					(
						id = id,
						title = modeName[m] + (s + 1) + " Total - " + characterName[c] + " - " + difficulty[d],
						description = "",
						start = modeCheck && characterCheck && byte(0x492fd4) == d && byte(0x19fd766) == s && byte(0x19fd76d) == 1 && dword(0x19fd7f8) > prev(dword(0x19fd7f8)),
						cancel = always_false(),
						submit = always_true(),
						value = measured(dword(0x19fd7f8)),
						format = "VALUE"
					)
					id = id + 1
				}
			}
			else
			{
				leaderboard
				(
					id = id,
					title = modeName[m] + (s + 1) + " Time - " + characterName[c],
					description = "",
					start = modeCheck && characterCheck && byte(0x19fd766) == s && byte(0x19fd76d) == 1 && stageBestTimeUpdate(m, -1, s),
					cancel = always_false(),
					submit = always_true(),
					value = measured(stageBestCentiseconds(m, -1, s)),
					format = "MILLISECS", lower_is_better = true
				)
				id = id + 1
				
				leaderboard
				(
					id = id,
					title = modeName[m] + (s + 1) + " Total - " + characterName[c],
					description = "",
					start = modeCheck && characterCheck && byte(0x19fd766) == s && byte(0x19fd76d) == 1 && dword(0x19fd7f8) > prev(dword(0x19fd7f8)),
					cancel = always_false(),
					submit = always_true(),
					value = measured(dword(0x19fd7f8)),
					format = "VALUE"
				)
				id = id + 1
			}
		}
	}
}

missionCompleteTotal = 0
missionCompleteTime = 0
missionCompleteRank = 0
for s in range(0, stages[0] - 1)
{
	base = 0x19fd2d0 + 0xc * s
	missionCompleteTotal = missionCompleteTotal + dword(base + 4)
	missionCompleteTime = missionCompleteTime + byte(base) * 60 * 60 * 100 + byte(base + 1) * 60 * 100 + byte(base + 2) * 100 + byte(base + 3)
	missionCompleteRank = missionCompleteRank + byte(base + 10)
}

modeCheck = byte(0x492fd0) == mode[0][0]
for i in range(1, length(mode[0]) - 1) modeCheck = __ornext(modeCheck || byte(0x492fd0) == mode[0][i])

for c in character
{
	characterCheck = byte(0x493184) == character[c][0]
	if (length(character[c]) > 1) for i in range(1, length(character[c]) - 1) characterCheck = __ornext(characterCheck || byte(0x493184) == character[c][i])
	
	startingDifficulty = 1
	if (c == 0) startingDifficulty = 0
	
	for d in range(startingDifficulty, 3)
	{
		leaderboard
		(
			id = id,
			title = "Full Game Total - " + characterName[c] + " - " + difficulty[d],
			description = "",
			start = modeCheck && characterCheck && byte(0x492fd4) == d && byte(0x19fd766) == 0xc && prev(dword_be(0x4a92d0)) == 0x45563134 && dword_be(0x4a92d0) == 0x49465f41, //"EV14" to "IF_A"
			cancel = always_false(),
			submit = always_true(),
			value = measured(missionCompleteTotal),
			format = "VALUE"
		)
		id = id + 1
		
		leaderboard
		(
			id = id,
			title = "Full Game Time - " + characterName[c] + " - " + difficulty[d],
			description = "",
			start = modeCheck && characterCheck && byte(0x492fd4) == d && byte(0x19fd766) == 0xc && prev(dword_be(0x4a92d0)) == 0x45563134 && dword_be(0x4a92d0) == 0x49465f41, //"EV14" to "IF_A"
			cancel = always_false(),
			submit = always_true(),
			value = measured(missionCompleteTime),
			format = "MILLISECS", lower_is_better = true
		)
		id = id + 1
		
		leaderboard
		(
			id = id,
			title = "Full Game Rank - " + characterName[c] + " - " + difficulty[d],
			description = "",
			start = modeCheck && characterCheck && byte(0x492fd4) == d && byte(0x19fd766) == 0xc && prev(dword_be(0x4a92d0)) == 0x45563134 && dword_be(0x4a92d0) == 0x49465f41, //"EV14" to "IF_A"
			cancel = always_false(),
			submit = always_true(),
			value = measured(missionCompleteRank),
			format = "VALUE"
		)
		id = id + 1
	}
}

////Unused

//nakatomiNinja = [0, 3, 5, 7, 8, 9, 12]
//hellspawnLord = [1, 2, 4, 6, 10, 11]
//easyCoins = [2, 3, 3, 3, 2, 2, 3, 2, 2, 2, 2, 3, 0]
//normalCoins = [2, 2, 3, 3, 2, 2, 3, 2, 2, 3, 3, 4, 0]
//hardCoins = [2, 2, 2, 3, 2, 2, 2, 2, 2, 3, 4, 2, 0]
//cardStages = [0, 4, 10, 9, 7, 8, 3, 5, 0, 7, 11, 1, 12, 12, 1, 3, 2, 4, 6, 11, 6]
//function time() => 1 + dword(0x19fd79c)/1000 + dword(0x19fd79c) //Changed to use the best time for accuracy