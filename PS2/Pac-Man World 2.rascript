// Pac-Man World 2
// #ID = 19097

// $496700: [Bit0] The Bear Basics - Level Complete
// $496740: [Bit0] The Bear Basics - Token
// $496744: [Bit0] The Bear Basics - Token
// $496748: [Bit0] The Bear Basics - Token
// $49674C: [Bit0] The Bear Basics - Token
// $496750: [Bit0] The Bear Basics - Token
// $496754: [Bit0] The Bear Basics - Token
// $496758: [Bit0] The Bear Basics - Token
// $49675C: [Bit0] The Bear Basics - Token
// $496764: [Bit0] The Bear Basics - Time Trial Bonus Token
// $496770: [8-bit] The Bear Basics - Complete %
//          Note: Tokens are not counted towards this.
// $4969A8: [Bit0] Pac-Village - Level Complete
// $496A30: [Bit0] Canyon Chaos - Level Complete
// $496AB8: [Bit0] Pac-Dot Pond - Level Complete
// $496B40: [Bit0] Blinky's Killer Frog - Level Complete
// $496BC8: [Bit0] B-Doing Woods - Level Complete
// $496C50: [Bit0] Treewood Forest - Level Complete
// $496CD8: [Bit0] Butane Pain - Level Complete
// $496D60: [Bit0] Inky's Blade-O-Matic - Level Complete
// $496DE8: [Bit0] Ice River Run - Level Complete
// $496E70: [Bit0] Avalanche Alley - Level Complete
// $496EF8: [Bit0] Blade Mountain - Level Complete
// $496F80: [Bit0] Pinky's Revenge - Level Complete
// $497008: [Bit0] Into the Volcano - Level Complete
// $497090: [Bit0] Volcanic Panic - Level Complete
// $497118: [Bit0] Magma Opus - Level Complete
// $4971A0: [Bit0] Clyde in the Caldera - Level Complete
// $497228: [Bit0] Scuba Duba - Level Complete
// $4972B0: [Bit0] Shark Attack - Level Complete
// $497338: [Bit0] Yellow Pac-Marine - Level Complete
// $4973C0: [Bit0] Whale on a Sub - Level Complete
// $497448: [Bit0] Haunted Boardwalk - Level Complete
// $4974D0: [Bit0] Night Crawling - Level Complete
// $497558: [Bit0] Ghost Bayou - Level Complete
// $49BD2C: [8-bit] Level ID
//          0x00 = Pac-Village
//          0x01 = The Bear Basics
//          0x02 = Canyon Chaos
//          0x03 = Pac-Dot Pond
//          0x04 = Blinky's Killer Frog
//          0x05 = B-Doing Woods
//          0x06 = Treewood Forest
//          0x07 = Butane Pain
//          0x08 = Inky's Blade-o-Matic
//          0x09 = Ice River Run
//          0x0a = Avalanche Alley
//          0x0b = Blade Mountain
//          0x0c = Pinky's Revenge
//          0x0d = Into the Volcano
//          0x0e = Volcanic Panic
//          0x0f = Magma Opus
//          0x10 = Clyde in the Caldera
//          0x11 = Scuba Duba
//          0x12 = Shark Attack
//          0x13 = Yellow Pac-Marine
//          0x14 = Whale on a Sub
//          0x15 = Haunted Boardwalk
//          0x16 = Night Crawling
//          0x17 = Ghost Bayou
//          0x18 = Spooky
//          0x19 = Pac-Village Warp
//          0x1a = Ghost Bayou Warp
//          Notes:
//          -Flips to 0 briefly when the player completes or exits a level.
//          -This value is also applicable when Pac-Man is standing over the level dot in the overworld.
// $5B8CB8: [32-bit] Level Data Pointer
//          0x7bd800 = Title Screen
//          0x7bd300 = Load Game Screen
//          0x7a3a00 = Loading Screen

levelName = {
    
    0: "Pac-Village",
    1: "The Bear Basics",
    2: "Canyon Chaos",
    3: "Pac-Dot Pond",
    4: "Blinky's Killer Frog",
    5: "B-Doing Woods",
    6: "Treewood Forest",
    7: "Butane Pain",
    8: "Inky's Blade-o-Matic",
    9: "Ice River Run",
    10: "Avalanche Alley",
    11: "Blade Mountain",
    12: "Pinky's Revenge",
    13: "Into the Volcano",
    14: "Volcanic Panic",
    15: "Magma Opus",
    16: "Clyde in the Caldera",
    17: "Scuba Duba",
    18: "Shark Attack",
    19: "Yellow Pac-Marine",
    20: "Whale on a Sub",
    21: "Haunted Boardwalk",
    22: "Night Crawling",
    23: "Ghost Bayou",
    24: "Spooky"
    
}

levelBase = {
    
    0: 0x4969A8,
    1: 0x496700,
    2: 0x496A30,
    3: 0x496AB8,
    4: 0x496B40,
    5: 0x496BC8,
    6: 0x496C50,
    7: 0x496CD8,
    8: 0x496D60,
    9: 0x496DE8,
    10: 0x496E70,
    11: 0x496EF8,
    12: 0x496F80,
    13: 0x497008,
    14: 0x497090,
    15: 0x497118,
    16: 0x4971A0,
    17: 0x497228,
    18: 0x4972B0,
    19: 0x497338,
    20: 0x4973C0,
    21: 0x497448,
    22: 0x4974D0,
    23: 0x497558
    
}

bossLevel = {
    
    0: false,
    1: false,
    2: false,
    3: false,
    4: true,
    5: false,
    6: false,
    7: false,
    8: true,
    9: false,
    10: false,
    11: false,
    12: true,
    13: false,
    14: false,
    15: false,
    16: true,
    17: false,
    18: false,
    19: false,
    20: true,
    21: false,
    22: false,
    23: false
    
}

function levelID() => byte(0x49BD2C)
function levelComplete(key) => bit0(levelBase[key])
function levelCompletion(key) => byte(levelBase[key] + 112)
function levelToken(key, i) => bit0(levelBase[key] + (64 + (i - 1) * 4))
function levelTimeTrialToken(key) => bit0(levelBase[key] + 100)

for key in levelBase {

    if key == 0 points = 1 else points = 5
    
    title = levelName[key]
    description = "Complete " + levelName[key] + " and reveal the path to " + levelName[key+1] + "."
    trigger = levelID() == key && prev(levelComplete(key)) == 0 && levelComplete(key) == 1 && dword(0x5B8CB8) != 8010240 && dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224
    achievement(title, description, points, trigger)
    
    if bossLevel[key] == false {
        
        title = levelName[key] + " - 100%"
        description = "Collect all fruits and Pac-Dots in " + levelName[key] + " and complete the level."
        trigger = levelID() == key && prev(levelCompletion(key)) < 100 && measured(levelCompletion(key) == 100, when=(dword(0x5B8CB8) != 8010240 && dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224), format = "percent")
        achievement(title, description, 10, trigger)

        title = levelName[key] + " - Tokens"
        description = "Collect all 8 tokens in " + levelName[key] + "."
        trigger = levelID() == key && (prev(levelToken(key, 1)) + prev(levelToken(key, 2)) + prev(levelToken(key, 3)) + prev(levelToken(key, 4)) + 
                                       prev(levelToken(key, 5)) + prev(levelToken(key, 6)) + prev(levelToken(key, 7)) + prev(levelToken(key, 8)) == 7) &&
                                   measured(levelToken(key, 1) +       levelToken(key, 2) +       levelToken(key, 3) +        levelToken(key, 4) + 
                                            levelToken(key, 5) +       levelToken(key, 6) +       levelToken(key, 7) +        levelToken(key, 8) == 8,
                                            when=(dword(0x5B8CB8) != 8010240 && dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
        achievement(title, description, 10, trigger)

        if key != 0 {
            
            title = levelName[key] + " - Time Trial"
            description = "Set a new best time trial in " + levelName[key] + "."
            trigger = levelID() == key && prev(levelTimeTrialToken(key)) == 0 && levelTimeTrialToken(key) ==1 && dword(0x5B8CB8) != 8010240 && dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224
            achievement(title,description,10,trigger)
            
        }
        
        else {
            achievement(
            title = "Reliable Rev Roller", description = "Starting on the blue roof, collect all of the rooftop fruits without falling off in Pac-Village.", points = 25,
            trigger = byte(0x49BD2C) == 0 && once((prev(bit0(tbyte(0x5B7400) + 0x00002A)) == 0) && bit0(tbyte(0x5B7400) +
               0x00002A) == 1) && trigger_when(repeated(5, byte(0x5F8D80) > prev(byte(0x5F8D80)))) && 
              trigger_when(repeated(2, byte(0x5F8D70) > prev(byte(0x5F8D70)))) && trigger_when(once(byte(0x5F8D74) >
               prev(byte(0x5F8D74)))) && trigger_when(once(byte(0x5F8D7C) > prev(byte(0x5F8D7C)))) &&
              ((never((prev(float(0x3E6B54)) <= -10.0 && float(0x3E6B54) > -10.0))) ||
               (never((prev(float(0x3E6B54)) >= -10.0 && float(0x3E6B54) < -10.0))) ||
               (never((prev(float(0x3E6B50)) <= 180.0 && float(0x3E6B50) > 180.0))) ||
               (never((prev(float(0x3E6B50)) >= -300.0 && float(0x3E6B50) < -300.0))) ||
               (never((prev(float(0x3E6B58)) <= 290.0 && float(0x3E6B58) > 290.0))) ||
               (never((prev(float(0x3E6B58)) >= -120.0 && float(0x3E6B58) < -120.0))))
            )
        }
    }    
}

achievement(
    title = "The Restoration of Pac-Village", description = "View all of the concept art in the Pac-Village Museum.", points = 1,
    trigger = byte(0x49BD2C) == 0 && prev(byte(0x5B8A50)) == 29 && byte(0x5B8A50) == 0
)

achievement(
    title = "Hero of the Golden Fruit Tree", description = "Achieve 100% completion in every level!", points = 50,
    trigger = (prev(byte(0x496770)) / 100 + prev(byte(0x496A18)) / 100 + prev(byte(0x496AA0)) / 100 +
               prev(byte(0x496B28)) / 100 + prev(byte(0x496BB0)) / 100 + prev(byte(0x496C38)) / 100 +
               prev(byte(0x496CC0)) / 100 + prev(byte(0x496D48)) / 100 + prev(byte(0x496DD0)) / 100 +
               prev(byte(0x496E58)) / 100 + prev(byte(0x496EE0)) / 100 + prev(byte(0x496F68)) / 100 +
               prev(byte(0x496FF0)) / 100 + prev(byte(0x497078)) / 100 + prev(byte(0x497100)) / 100 +
               prev(byte(0x497188)) / 100 + prev(byte(0x497210)) / 100 + prev(byte(0x497298)) / 100 +
               prev(byte(0x497320)) / 100 + prev(byte(0x4973A8)) / 100 + prev(byte(0x497430)) / 100 +
               prev(byte(0x4974B8)) / 100 + prev(byte(0x497540)) / 100 + prev(byte(0x4975C8)) / 100 + 0) == 23 && 
              measured((byte(0x496770) / 100 + byte(0x496A18) / 100 + byte(0x496AA0) / 100 + byte(0x496B28) / 100 +
               byte(0x496BB0) / 100 + byte(0x496C38) / 100 + byte(0x496CC0) / 100 + byte(0x496D48) / 100 +
               byte(0x496DD0) / 100 + byte(0x496E58) / 100 + byte(0x496EE0) / 100 + byte(0x496F68) / 100 +
               byte(0x496FF0) / 100 + byte(0x497078) / 100 + byte(0x497100) / 100 + byte(0x497188) / 100 +
               byte(0x497210) / 100 + byte(0x497298) / 100 + byte(0x497320) / 100 + byte(0x4973A8) / 100 +
               byte(0x497430) / 100 + byte(0x4974B8) / 100 + byte(0x497540) / 100 + byte(0x4975C8) / 100 + 0) == 24,
               when=(dword(0x5B8CB8) != 8010240 && dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "Arcade Fanatic I", description = "Collect 10 tokens and unlock Pac-Man in Sue's Arcade.", points = 5,
    trigger = prev(byte(0x495B80)) == 9 && measured(byte(0x495B80) == 10, when=(dword(0x5B8CB8) != 8010240 &&
               dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "Arcade Fanatic II", description = "Collect 30 tokens and unlock Pac-Attack in Sue's Arcade.", points = 10,
    trigger = prev(byte(0x495B80)) == 29 && measured(byte(0x495B80) == 30, when=(dword(0x5B8CB8) != 8010240 &&
               dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "Arcade Fanatic III", description = "Collect 60 tokens and unlock the Jukebox in Sue's Arcade.", points = 10,
    trigger = prev(byte(0x495B80)) == 59 && measured(byte(0x495B80) == 60, when=(dword(0x5B8CB8) != 8010240 &&
               dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "Arcade Fanatic IV", description = "Collect 100 tokens and unlock Pac-Mania in Sue's Arcade!", points = 25,
    trigger = prev(byte(0x495B80)) == 99 && measured(byte(0x495B80) == 100, when=(dword(0x5B8CB8) != 8010240 &&
               dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "Arcade Fanatic V", description = "Collect 150 tokens and unlock the Museum in Pac-Village!", points = 25,
    trigger = prev(byte(0x495B80)) == 149 && measured(byte(0x495B80) == 150, when=(dword(0x5B8CB8) != 8010240 &&
               dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "Patron of Sue's Arcade", description = "Collect all 180 tokens and unlock Ms. Pac-Man in Sue's Arcade!", points = 50,
    trigger = prev(byte(0x495B80)) == 179 && measured(byte(0x495B80) == 180, when=(dword(0x5B8CB8) != 8010240 &&
               dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "[Pac-Man] Where it all Began", description = "Complete the first round.", points = 1,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && prev(byte(0x5D3C10)) == 1 && byte(0x5D3C10) == 2
)

achievement(
    title = "[Pac-Man] Intermission I", description = "Complete Intermission I.", points = 5,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && prev(byte(0x5D3C10)) == 5 && byte(0x5D3C10) == 6
)

achievement(
    title = "[Pac-Man] Intermission II", description = "Complete Intermission II.", points = 10,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && prev(byte(0x5D3C10)) == 9 && byte(0x5D3C10) == 10
)

achievement(
    title = "[Pac-Man] Intermission III", description = "Complete Intermission III!", points = 25,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && prev(byte(0x5D3C10)) == 13 && byte(0x5D3C10) == 14
)

achievement(
    title = "[Pac-Man] Lifesaver", description = "Gain a mutiple of 10,000 score and earn an extra life.", points = 5,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && prev(dword(0x5BB878)) <= 1000 && dword(0x5BB878) > 1000 && 
              byte(0x5BB840) > prev(byte(0x5BB840))
)

achievement(
    title = "[Pac-Man] Ghost Gobbler", description = "Eat all 4 ghosts in succession to receive a score bonus of 1600!", points = 10,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && (dword(0x5BB878) - prev(dword(0x5BB878))) == 160
)

achievement(
    title = "[Pac-Man] Power Player", description = "Complete 3 rounds in a row without losing a life.", points = 25,
    trigger = unless(once(dword(0x5BB878) != 0 && byte(0x5BB840) < prev(byte(0x5BB840)))) && word(0x5BA764) == 12403 && 
              low4(0x5BB818) == 1 && trigger_when(repeated(3, byte(0x5D3C10) > prev(byte(0x5D3C10)))) &&
              ((never(byte(0x5D3C10) > prev(byte(0x5D3C10)))) ||
               (never((prev(byte(0x5BB840)) == 0 && byte(0x5BB840) == 255))) ||
               (never((prev(word(0x5BA764)) == 12403 && word(0x5BA764) == 11885))))
)

achievement(
    title = "[Pac-Man] Connoisseur of Rare Goods", description = "Collect at least 1 of each of the 8 bonus items in a single game.", points = 25,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && trigger_when(tally(8, 
                  once(byte(0x5D441E) > prev(byte(0x5D441E))), 
                  once(byte(0x5D4420) > prev(byte(0x5D4420))), 
                  once(byte(0x5D4422) > prev(byte(0x5D4422))), 
                  once(byte(0x5D4424) > prev(byte(0x5D4424))), 
                  once(byte(0x5D4426) > prev(byte(0x5D4426))), 
                  once(byte(0x5D4428) > prev(byte(0x5D4428))), 
                  once(byte(0x5D442A) > prev(byte(0x5D442A))), 
                  once(byte(0x5D442C) > prev(byte(0x5D442C))) 
                  
              )) &&
              ((never((prev(byte(0x5BB840)) == 0 && byte(0x5BB840) == 255))) ||
               (never((prev(word(0x5BA764)) == 12403 && word(0x5BA764) == 11885))))
)
