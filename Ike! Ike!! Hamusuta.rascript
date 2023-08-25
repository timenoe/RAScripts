// Ike! Ike!! Hamusuta
// #ID = 25319
// timenoe

stageTitles = ["Forest Fuzzball", "Rocky Roll", "Snowballing Sweep", "Sandy Slide", "Tropical Tumble", "Volcanic Velocity", "Spooky Spin", "Prehistoric Pass", "Coastal Cruisin'", "Roller Rotation"]

/// Functions

function nextBit(addr)
{
	if (addr[0] == 7) return [0, addr[1] + 1]
	else return [addr[0] + 1, addr[1]]
}
function bitTrue(index, addr) => dword_be(0xffe00c) == 0x4b48364a && word(0x30a038) == 0x1568 && byte(0x30a050) == 5 && bit(index, addr) > prev(bit(index, addr))
function allStages() => prev(bit3(0x1c2151) + bit4(0x1c2151) + bit5(0x1c2151) + bit6(0x1c2151) + bit7(0x1c2151) + bit0(0x1c2152) + bit1(0x1c2152) + bit2(0x1c2152) + bit3(0x1c2152) + bit4(0x1c2152)) == 9 && measured(bit3(0x1c2151) + bit4(0x1c2151) + bit5(0x1c2151) + bit6(0x1c2151) + bit7(0x1c2151) + bit0(0x1c2152) + bit1(0x1c2152) + bit2(0x1c2152) + bit3(0x1c2152) + bit4(0x1c2152) == 10, when=dword_be(0xffe00c) == 0x4b48364a)
function allAchievements() => prev(bitcount(0x1c2155) + bitcount(0x1c2156) + bit0(0x1c2157) + bit1(0x1c2157) + bit2(0x1c2157) + bit3(0x1c2157) + bit4(0x1c2157) + bit5(0x1c2157) + bit6(0x1c2157)) < 23 && measured(bitcount(0x1c2155) + bitcount(0x1c2156) + bit0(0x1c2157) + bit1(0x1c2157) + bit2(0x1c2157) + bit3(0x1c2157) + bit4(0x1c2157) + bit5(0x1c2157) + bit6(0x1c2157) == 23, when=dword_be(0xffe00c) == 0x4b48364a)
function allOtherSeeds()
{
	base = 0x1c20fc
	seedCheck = always_true()
	for stage in range(1, 9)
	{
		seedCheck = seedCheck && byte(base) == 100
		base = base + 4
	}
	return seedCheck
}

/// Achievements

id = 342883
badge = 387050
stageBit = [3, 0x1c2151]
for s in range(1, 10)
{
	title = stageTitles[s-1]
	description = "Clear Stage " + s + " for the first time"
	trigger = dword_be(0xffe00c) == 0x4b48364a && word(0x30a038) == 0x1568 && byte(0x1c218c) == s && byte(0x30a050) == 5 && bit(stageBit[0], stageBit[1]) > prev(bit(stageBit[0], stageBit[1]))
	achievement(title, description, 5, trigger, id=id, badge=format("", badge))
	id = id + 1
	badge = badge + 1
	stageBit = nextBit(stageBit)
	
	title = "Stage " + s + " - 100%"
	description = "Clear Stage " + s + " with all 100 Sunflower Seeds"
	trigger = dword_be(0xffe00c) == 0x4b48364a && word(0x30a038) == 0x1568 && byte(0x1c218c) == s && byte(0x1c2190) == 100 && prev(byte(0x30a050)) == 2 && byte(0x30a050) == 5
	achievement(title, description, 10, trigger, id=id, badge=format("", badge))
	id = id + 1
	badge = badge + 1
	
	if (s <= 5)
	{
		title = "Stage " + s + " - 0%"
		description = "Clear Stage " + s + " with 0 Sunflower Seeds"
		trigger = dword_be(0xffe00c) == 0x4b48364a && word(0x30a038) == 0x1568 && byte(0x1c218c) == s && byte(0x1c2190) == 0 && prev(byte(0x30a050)) == 2 && byte(0x30a050) == 5
		achievement(title, description, 10, trigger, id=id, badge=format("", badge))
		id = id + 1
		badge = badge + 1
	}
	
	title = "Stage " + s + " - Master"
	description = "Clear Stage " + s + " without losing a life"
	trigger = dword_be(0xffe00c) == 0x4b48364a && word(0x30a038) == 0x1568 && byte(0x1c218c) == s && byte(0x1c21b4) == 5 && prev(byte(0x30a050)) == 2 && byte(0x30a050) == 5
	achievement(title, description, 10, trigger, id=id, badge=format("", badge))
	id = id + 1
	badge = badge + 1
}

//achievement("Familiar Territory", "Clear a stage and beat the record time", 1, bitTrue(5, 0x1c2155))
//achievement("Lazy Day", "Return to the stage select screen after reaching the stage checkpoint", 1, bitTrue(2, 0x1c2157))

achievement("Perch Escape", "Escape from the pink dinosaur and clear Stage 8", 5, bitTrue(4, 0x1c2157) && byte(0x1c218c) == 8, id=id, badge=format("", badge))
id = id + 1
badge = badge + 1
achievement("Giant Gyoppi Escape", "Escape from the pink fish and clear Stage 9", 5, bitTrue(3, 0x1c2157) && byte(0x1c218c) == 9, id=id, badge=format("", badge))
id = id + 1
badge = badge + 1
achievement("Stop and Smell the Roses", "Clear a stage without dashing (pressing B)", 5, bitTrue(5, 0x1c2157), id=id, badge=format("", badge))
id = id + 1
badge = badge + 1
achievement("Honorary Ham-Ham", "Clear all 10 stages", 25, word(0x30a038) == 0x1568 && byte(0x30a050) == 5 && allStages(), id=id, badge=format("", badge))
id = id + 1
badge = badge + 1
achievement("Hibernation Stash", "Collect all seeds", 25, bitTrue(2, 0x1c2155), id=id, badge=format("", badge))
id = id + 1
badge = badge + 1
achievement("Certified Ham-Ham", "Earn all 23 in-game achievements", 25, word(0x30a038) == 0x1568 && allAchievements(), id=id, badge=format("", badge))
id = id + 1
badge = badge + 1

achievement("Hot Spring Vacation", "Clear Stage 10 with all 100 Sunflower Seeds while having previously collected all 900 other seeds", 10, dword_be(0xffe00c) == 0x4b48364a && allOtherSeeds() && byte(0x1c218c) == 10 && byte(0x1c2190) == 100 && prev(word(0x30a038)) == 0x1568 && word(0x30a038) == 0xe3c, id=id, badge=format("", badge))

/// Leaderboards

id = 72799
for s in range(1, 10)
{
	title = "Stage " + s + " Speedrun"
	start = dword_be(0xffe00c) == 0x4b48364a && word(0x30a038) == 0x1568 && byte(0x1c218c) == s && byte(0x30a050) == 5 && dword(0x30a0c4) > prev(dword(0x30a0c4))
	leaderboard(title, "", start, always_false(), always_true(), measured(dword(0x30a0c4)), format="FRAMES", lower_is_better=true, id=id)
	id = id + 1
	
	title = "Stage " + s + " 100% Speedrun"
	start = dword_be(0xffe00c) == 0x4b48364a && word(0x30a038) == 0x1568 && byte(0x1c218c) == s && byte(0x30a050) == 5 && byte(0x1c2190) == 100 && dword(0x30a0c4) > prev(dword(0x30a0c4))
	leaderboard(title, "", start, always_false(), always_true(), measured(dword(0x30a0c4)), format="FRAMES", lower_is_better=true, id=id)
	id = id + 1
	
	if (s <= 5)
	{
		title = "Stage " + s + " 0% Speedrun"
		start = dword_be(0xffe00c) == 0x4b48364a && word(0x30a038) == 0x1568 && byte(0x1c218c) == s && byte(0x30a050) == 5 && byte(0x1c2190) == 0 && dword(0x30a0c4) > prev(dword(0x30a0c4))
		leaderboard(title, "", start, always_false(), always_true(), measured(dword(0x30a0c4)), format="FRAMES", lower_is_better=true, id=id)
		id = id + 1
	}
}