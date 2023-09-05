// Tony Hawk's Pro Skater 4 [Subset - Zero Stats]
// #ID = 25644
// timenoe

//// Constants

levelName =
{
    1: "College",
    2: "San Francisco",
    3: "Alcatraz",
    4: "Kona",
    5: "Shipyard",
    6: "London",
    7: "Zoo",
    8: "Carnival",
    9: "Chicago"
}

normalGoalIndexes =
{
    1: [1, 10, 7, 21, 5, 13, 15, 17, 12, 18, 2, 8, 20, 6, 14, 16],
    2: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
    3: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
    4: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], //The 8th goal in the list is "Save the birds on the power lines"
    5: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
    6: [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17],
    7: [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19],
    8: [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
    9: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14] // the 13th goal in the list is "900 off bridge to the ferry's top deck"
}

proGoalIndexes =
{
    1: [4, 11, 9, 19, 3],
    2: [17, 18, 19, 20, 21],
    3: [17, 18, 19, 20, 21],
    4: [17, 18, 19, 20, 21],
    5: [17, 18, 19, 20, 21],
    6: [18, 19, 20, 21, 22],
    7: [20, 21, 22, 23, 24]
}

thisGoal = 4
nextGoal = 8
goalDiscoveredOffset = 0x18
goalCompletedOffset = 0x1c

//// Functions

function nonZeroStats() => dword(0x86ca30) + dword(0x86ca34) + dword(0x86ca38) + dword(0x86ca3c) + dword(0x86ca40) + dword(0x86ca44) + dword(0x86ca48) + dword(0x86ca4c) + dword(0x86ca50) + dword(0x86ca54) != 0
function usingJango() => dword(dword(0x96f65c) + 0x70) == 0xdc3d90eb
function cheating() => bit2(0x96fb8b) + bit3(0x96fb8b) + bit7(0x96fb8b) + bit1(0x96fb8c) + bit7(0x96fb8c) != 0
function mainMenu() => dword(0x96fbb4) == 0
function protection() => disable_when(__ornext(nonZeroStats() || usingJango() || cheating()), until = mainMenu())

function careerMode() => dword(0x96d70c) == 0x4da4937b
function inLevel(level) => dword(0x96fbb4) == level
function skating() => dword(0x86cef0) + dword(0x86cef4) + dword(0x86cef8) != 0
function goalPointer() => dword(0x96f6dc)
function goalPointerInitialized() => goalPointer() != 0

//// Achievements

id = 351978
badge = 396854
for level in normalGoalIndexes
{
    
   allNormalGoals = 0
   birdGoal = 0
   bridgeGoal = 0
   for index in normalGoalIndexes[level]
   { 
        currentGoal = goalPointer()
        for step in range(1, index)
		{
            if (step == index) 
			{
				allNormalGoals = allNormalGoals + dword(dword(currentGoal + thisGoal) + goalCompletedOffset)
				if (level == 4 && index == 8) birdGoal = dword(dword(currentGoal + thisGoal) + goalCompletedOffset)
				else if (level == 9 && index == 13) bridgeGoal = dword(dword(currentGoal + thisGoal) + goalCompletedOffset)
			}
            else currentGoal = dword(currentGoal + nextGoal)
        }  
    }

    achievement
	(
        title = "[Zero Stats] " + levelName[level] + " Amatuer Skater",
        description = "Complete all " + length(normalGoalIndexes[level]) + " amateur goals in " + levelName[level] + " with zero stats",
        points = 25,
        trigger = protection() && prev(allNormalGoals) == length(normalGoalIndexes[level]) - 1 && measured(allNormalGoals == length(normalGoalIndexes[level]), when = careerMode() && inLevel(level) && goalPointerInitialized() && skating()),
		id = id,
		badge = format("", badge)
    )
	id = id + 1
	badge = badge + 1
	
	if (level == 4)
	{
		achievement
		(
			title = "[Zero Stats] Fly Little Birdy",
			description = "Complete the \"Save the birds on the power lines\" goal in Kona with zero stats",
			points = 10,
			trigger = protection() && careerMode() && inLevel(level) && goalPointerInitialized() && skating() && birdGoal > prev(birdGoal),
			id = id,
			badge = format("", badge)
		)
		id = id + 1
		badge = badge + 1
	}
	
	else if (level == 9)
	{
		achievement
		(
			title = "[Zero Stats] 5-Star Taxi Driver",
			description = "Complete the \"900 off bridge to the ferry's top deck\" goal in Chicago with zero stats",
			points = 10,
			trigger = protection() && careerMode() && inLevel(level) && goalPointerInitialized() && skating() && bridgeGoal > prev(bridgeGoal),
			id = id,
			badge = format("", badge)
		)
		id = id + 1
		badge = badge + 1
	}
}
    
for level in proGoalIndexes
{
    allProGoals = 0
    for index in proGoalIndexes[level]
	{ 
        currentGoal = goalPointer()
        for step in range(1, index)
		{
            if (step == index) allProGoals = allProGoals + dword(dword(currentGoal + thisGoal) + goalCompletedOffset)
            else currentGoal = dword(currentGoal + nextGoal)
        } 
    }

    total = length(proGoalIndexes[level])
	if (level == 1 || level == 7) total = total - 1
	else if (level == 5) total = total - 2
	
	description = "Complete all "
	if (level == 1 || level == 5 || level == 7) description = "Complete "
	
	achievement
	(
        title = "[Zero Stats] " + levelName[level] + " Pro Skater",
        description = description + total + " pro goals in " + levelName[level] + " with zero stats",
        points = 25,
        trigger = protection() && prev(allProGoals) == total - 1 && measured(allProGoals == total, when = careerMode() && inLevel(level) && goalPointerInitialized() && skating()),
		id = id,
		badge = format("", badge)
    )
	id = id + 1
	badge = badge + 1
}