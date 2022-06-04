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
// $5B8638: [Float] Galaxian Maze Score
// $5B8CB8: [32-bit] Level Data Pointer
//          0x7bd800 = Title Screen
//          0x7bd300 = Load Game Screen
//          0x7a3a00 = Loading Screen
//          0x7cfc00 = Canyon Chaos Galaxian Maze
//          0x7c6c80 = Pac-Dot Pond Galaxian Maze
//          0x7cc500 = B-Doing Woods Galaxian Maze
//          0x7c1c00 = Treewood Forest Galaxian Maze
//          0x7ca100 = Butane Pain Galaxian Maze
//          0x7bf800 = Ice River Run Galaxian Maze
//          0x7bee80 = Avalanche Alley Galaxian Maze
//          0x7c0700 = Blade Mountain Galaxian Maze
//          0x7bfc80 = Into the Volcano Galaxian Maze
//          0x7be580 = Volcanic Panic Galaxian Maze
//          0x7bdb80 = Magma Opus Galaxian Maze
//          0x7c0500 = Scuba Duba Galaxian Maze
//          0x7c1e00 = Shark Attack Galaxian Maze
//          0x7d2900 = Haunted Boardwalk Galaxian Maze
//          0x7d6900 = Ghost Bayou Galaxian Maze

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

mazeLevel = {
    
    0: false,
    1: false,
    2: true,
    3: true,
    4: false,
    5: true,
    6: true,
    7: true,
    8: false,
    9: true,
    10: true,
    11: true,
    12: false,
    13: true,
    14: true,
    15: true,
    16: false,
    17: true,
    18: true,
    19: false,
    20: false,
    21: true,
    22: false,
    23: true
    
}

mazeLevelID = {
    
    2: 0x7cfc00,
    3: 0x7c6c80,
    5: 0x7cc500,
    6: 0x7c1c00,
    7: 0x7ca100,
    9: 0x7bf800,
    10: 0x7bee80,
    11: 0x7c0700,
    13: 0x7bfc80,
    14: 0x7be580,
    15: 0x7bdb80,
    17: 0x7c0500,
    18: 0x7c1e00,
    21: 0x7d2900,
    23: 0x7d6900
    
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
        
        if mazeLevel[key] == true {
            
            title = levelName[key] + " - Galaxian"
            description = "Complete the " + levelName[key] + " Galaxian Maze without losing a life."
            trigger = dword(0x5B8CB8) == mazeLevelID[key] && trigger_when(word(0x5C9060) == 0) && unless(once(float(0x5B8638) != 0.0 &&
                       low4(0x5BB588) < prev(low4(0x5BB588)))) &&
                      (always_false() || (never((prev(dword(0x5B8CB8)) == 8010240 && dword(0x5B8CB8) == mazeLevelID[key]))))
            
            achievement(title, description, 10, trigger)
            
        }

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
            
            if key == 1 {
                
                achievement(
                    title = "Pac-Bear?", description = "In The Bear Basics, read the sign right before the Pac-Cub.", points = 1,
                    trigger = byte(0x49BD2C) == 1 && prev(bit0(0x85E208)) == 0 && bit0(0x85E208) == 1
                )
                
            }
            
            else if key == 10 {
                
                achievement(
                    title = "Ready, Set, Action!", description = "In Avalanche Alley, boost your Rev Roll using the statue's breath and land on the red Pac-Dot over the valley!", points = 25,
                    trigger = byte(0x49BD2C) == 10 && float(0x3E6B50) < -1740.0 && float(0x3E6B58) < 625.0 && float(0x3E6B50) > -2669.0 && 
                              float(0x3E6B58) > 193.0 && trigger_when(once(byte(0x5B8D7C) == 6)) && trigger_when(byte(0x5B8D7C) == 38) && 
                              unless(once(float(0x3E6B50) < -1948.0 && float(0x3E6B58) < 535.0 && byte(0x5B8D7C) != 6 && byte(0x5B8D7C)
                               != 27 && byte(0x5B8D7C) != 34 && byte(0x5B8D7C) != 38)) &&
                              (always_false() || (never((float(0x3E6B50) > -1948.0 && float(0x3E6B58) > 535.0 && prev(byte(0x5B8D7C)) != 40 &&
                                 byte(0x5B8D7C) == 40))))
                )
                
                achievement(
                    title = "Maximum Overdrive", description = "In Avalanche Alley, reach warp speed in the tunnel using the statue's breath!", points = 5,
                    trigger = byte(0x49BD2C) == 10 && float(0x7F3070) >= 25.0
                )
                 
            }
            
            else if key == 13 {
                
                achievement(
                    title = "More Bounce to the Ounce", description = "Complete Into the Volcano without grabbing onto a ledge.", points = 10,
                    trigger = dword(0x5B8CB8) == 8261632 && trigger_when(dword(0x361E90) == 1163281740) && unless(once(byte(0x5B8D7C) ==
                               48)) &&
                              ((never((prev(dword(0x5B8CB8)) == 8249472 && dword(0x5B8CB8) == 8010240))) ||
                               (never((prev(dword(0x5B8CB8)) == 8010240 && dword(0x5B8CB8) == 8261632 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key ==14 {
                
                achievement(
                    title = "All Natural", description = "Complete Volcanic Panic without using the Steel Ball power-up or taking damage!", points = 25,
                    trigger = dword(0x5B8CB8) == 8233344 && trigger_when(dword(0x361E90) == 1163281740) && unless(once((float(0x495B58)
                               < prev(float(0x495B58)) || low4(0x5B9E10) == 1) && prev(word(0x5BA764)) == 13996)) &&
                              ((never((prev(dword(0x5B8CB8)) == 8249472 && dword(0x5B8CB8) == 8010240))) ||
                               (never((prev(dword(0x5B8CB8)) == 8010240 && dword(0x5B8CB8) == 8233344 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 15 {
                
                achievement(
                    title = "Pacrobatic", description = "After reaching the second checkpoint in Magma Opus, reach the third without activating the rising platform.", points = 10,
                    trigger = byte(0x49BD2C) == 15 && prev(byte(0x5B741C)) == 5 && trigger_when(byte(0x5B741C) == 6) && 
                              unless(once(prev(byte(0x46D210)) == 0 && byte(0x46D210) == 1)) &&
                              (always_false() || (never((prev(dword(0x5B8CB8)) == 8010240 && dword(0x5B8CB8) == 8256896))))
                )
                
                achievement(
                    title = "Flaming Feast", description = "In Magma Opus, eat 5 ghosts in a row and receive a score bonus of 7650.", points = 5,
                    trigger = byte(0x49BD2C) == 15 && (dword(0x497120) - prev(dword(0x497120))) == 7650
                )
                
            }
            
            else if key == 23 {
                
                achievement(
                    title = "Trick the Tree", description = "Complete Ghost Bayou while collecting no more than 73 Pac-Dots...", points = 25,
                    trigger = dword(0x5B8CB8) == 8549504 && byte(0x5B9F50) <= 73 && trigger_when(prev(dword(0x361E90)) == 1397704775) && 
                              trigger_when(dword(0x361E90) == 1163281740)
                )
                
            }
        }
        
        else {
            achievement(
            title = "Rooftop Rev Roller", description = "Starting on the blue roof, collect all of the rooftop fruits without falling off in Pac-Village.", points = 25,
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

//Arcade

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
    title = "[Pac-Man] Lifesaver I", description = "Gain a multiple of 10,000 score and earn an extra life.", points = 5,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && dword(0x5BB878) > prev(dword(0x5BB878)) && 
              byte(0x5BB840) > prev(byte(0x5BB840))
)

achievement(
    title = "[Pac-Man] Ghost Gobbler", description = "Eat all 4 ghosts in succession to receive a score bonus of 1600!", points = 10,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && (dword(0x5BB878) - prev(dword(0x5BB878))) == 160
)

achievement(
    title = "[Pac-Man] Connoisseur of Rare Goods I", description = "Collect at least 1 of each of the 8 bonus items in a single game.", points = 25,
    trigger = measured(tally(8, 
                  once(byte(0x5D441E) > prev(byte(0x5D441E))), 
                  once(byte(0x5D4420) > prev(byte(0x5D4420))), 
                  once(byte(0x5D4422) > prev(byte(0x5D4422))), 
                  once(byte(0x5D4424) > prev(byte(0x5D4424))), 
                  once(byte(0x5D4426) > prev(byte(0x5D4426))), 
                  once(byte(0x5D4428) > prev(byte(0x5D4428))), 
                  once(byte(0x5D442A) > prev(byte(0x5D442A))), 
                  once(byte(0x5D442C) > prev(byte(0x5D442C))), 
                  always_false()), when=word(0x5BA764) == 12403 && low4(0x5BB818) == 1 &&
               dword(0x5BB918) == 429496729
              ) &&
              (always_false() || (never((prev(dword(0x5BB918)) == 0 && dword(0x5BB918) == 4294967295))))
)

achievement(
    title = "[Pac-Man] Power Player", description = "Complete 4 rounds in a row without losing a life.", points = 25,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && dword(0x5BB918) == 4294967295 && 
              trigger_when(repeated(4, byte(0x5D3C10) > prev(byte(0x5D3C10)))) && unless(once(dword(0x5BB878) != 0 &&
               byte(0x5BB840) < prev(byte(0x5BB840)))) &&
              ((never((prev(dword(0x5BB918)) == 0 && dword(0x5BB918) == 4294967295))) ||
               (never((once(dword(0x5BB878) != 0 && byte(0x5BB840) < prev(byte(0x5BB840))) && byte(0x5D3C10) >
                 prev(byte(0x5D3C10))))))
)

achievement(
    title = "[Pac-Attack] Godhand?", description = "Start a game using the secret \"Godhand?\" difficulty setting.", points = 1,
    trigger = dword(0x361E90) == 776228679 && prev(word(0x57E378)) == 0 && word(0x57E378) == 900
)

achievement(
    title = "[Pac-Attack] Pac-Panic", description = "Clear 10 levels in one game.", points = 5,
    trigger = measured(repeated(10, (word(0x57E378) - prev(word(0x57E378))) == 1), when=(dword(0x361E90) == 1297239886
               || dword(0x361E90) == 1146241352 || dword(0x361E90) == 1162893640 || dword(0x361E90) == 776228679)) && 
              never((prev(byte(0x57E3F4)) == 0 && byte(0x57E3F4) == 1))
)

achievement(
    title = "[Pac-Attack] Cosmo Gang", description = "Clear 25 levels in one game.", points = 10,
    trigger = measured(repeated(25, (word(0x57E378) - prev(word(0x57E378))) == 1), when=(dword(0x361E90) == 1297239886
               || dword(0x361E90) == 1146241352 || dword(0x361E90) == 1162893640 || dword(0x361E90) == 776228679)) && 
              never((prev(byte(0x57E3F4)) == 0 && byte(0x57E3F4) == 1))
)

achievement(
    title = "[Pac-Attack] Pac-Tris", description = "Clear 50 levels in one game!", points = 25,
    trigger = measured(repeated(50, (word(0x57E378) - prev(word(0x57E378))) == 1), when=(dword(0x361E90) == 1297239886
               || dword(0x361E90) == 1146241352 || dword(0x361E90) == 1162893640 || dword(0x361E90) == 776228679)) && 
              never((prev(byte(0x57E3F4)) == 0 && byte(0x57E3F4) == 1))
)

achievement(
    title = "[Pac-Attack] Mayumi's Match", description = "Submit at least 100,001 score 71 levels cleared to the record board to take Mayumi's #1 spot!", points = 50,
    trigger = dword(0x361E90) == 1329808722 && prior(dword(0x497760)) == 100000 && dword(0x497760) > 100000 && 
              prior(word(0x497764)) == 70 && word(0x497764) > 70
)

achievement(
    title = "[Pac-Attack] Aliens and Marbles Galore", description = "Eat at least 10 ghosts consecutively!", points = 25,
    trigger = prev(byte(0x57E448)) < 10 && byte(0x57E448) >= 10 &&
              ((dword(0x361E90) == 1297239886) ||
               (dword(0x361E90) == 1146241352) ||
               (dword(0x361E90) == 1162893640) ||
               (dword(0x361E90) == 776228679))
)

achievement(
    title = "[Pac-Attack] Pac-Trimino", description = "Clear at least 4 lines at once!", points = 25,
    trigger = prev(byte(0x57E44E)) < 4 && byte(0x57E44E) >= 4 &&
              ((dword(0x361E90) == 1297239886) ||
               (dword(0x361E90) == 1146241352) ||
               (dword(0x361E90) == 1162893640) ||
               (dword(0x361E90) == 776228679))
)

achievement(
    title = "[Pac-Attack] Floor the Fairy", description = "Guide a fairy to the very bottom of the board and earn a massive score bonus!", points = 25,
    trigger = byte(0x57E3C0) > prev(byte(0x57E3C0)) &&
              ((dword(0x361E90) == 1297239886) ||
               (dword(0x361E90) == 1146241352) ||
               (dword(0x361E90) == 1162893640) ||
               (dword(0x361E90) == 776228679))
)

achievement(
    title = "[Pac-Mania] Pac-Man's Park", description = "Complete 2 rounds without using a continue.", points = 5,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && low4(tbyte(0x5B9624) + 0x000621)
               > 0 && prev(byte(tbyte(0x5B9624) + 0x000623)) >= 1 && prev(byte(tbyte(0x5B9624) + 0x000623)) < 3 && 
              trigger_when(byte(tbyte(0x5B9624) + 0x000623) == 3) && unless(once((prev(low4(tbyte(0x5B9624) + 0x000621))
               == 0) && low4(tbyte(0x5B9624) + 0x000621) == 3)) &&
              (always_false() || (never((prev(byte(tbyte(0x5B9624) + 0x000623)) == 0) && byte(tbyte(0x5B9624) + 0x000623) == 1)))
)

achievement(
    title = "[Pac-Mania] Sandbox Land", description = "Complete 5 rounds without using a continue.", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && low4(tbyte(0x5B9624) + 0x000621)
               > 0 && prev(byte(tbyte(0x5B9624) + 0x000623)) >= 3 && prev(byte(tbyte(0x5B9624) + 0x000623)) < 6 && 
              trigger_when(byte(tbyte(0x5B9624) + 0x000623) == 6) && unless(once((prev(low4(tbyte(0x5B9624) + 0x000621))
               == 0) && low4(tbyte(0x5B9624) + 0x000621) == 3)) &&
              (always_false() || (never((prev(byte(tbyte(0x5B9624) + 0x000623)) == 0) && byte(tbyte(0x5B9624) + 0x000623) == 1)))
)

achievement(
    title = "[Pac-Mania] Jungly Steps", description = "Complete 8 rounds without using a continue.", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && low4(tbyte(0x5B9624) + 0x000621)
               > 0 && prev(byte(tbyte(0x5B9624) + 0x000623)) >= 6 && prev(byte(tbyte(0x5B9624) + 0x000623)) < 9 && 
              trigger_when(byte(tbyte(0x5B9624) + 0x000623) == 9) && unless(once((prev(low4(tbyte(0x5B9624) + 0x000621))
               == 0) && low4(tbyte(0x5B9624) + 0x000621) == 3)) &&
              (always_false() || (never((prev(byte(tbyte(0x5B9624) + 0x000623)) == 0) && byte(tbyte(0x5B9624) + 0x000623) == 1)))
)

achievement(
    title = "[Pac-Mania] Nice Going! The Show's Gonna Go On!", description = "Complete 11 rounds without using a continue!", points = 25,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && low4(tbyte(0x5B9624) + 0x000621)
               > 0 && prev(byte(tbyte(0x5B9624) + 0x000623)) >= 9 && prev(byte(tbyte(0x5B9624) + 0x000623)) < 12 && 
              trigger_when(byte(tbyte(0x5B9624) + 0x000623) == 12) && unless(once((prev(low4(tbyte(0x5B9624) +
               0x000621)) == 0) && low4(tbyte(0x5B9624) + 0x000621) == 3)) &&
              (always_false() || (never((prev(byte(tbyte(0x5B9624) + 0x000623)) == 0) && byte(tbyte(0x5B9624) + 0x000623) == 1)))
)

achievement(
    title = "[Pac-Mania] ...To Be Continued", description = "Complete round 23 and view the credits!", points = 25,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x000623)) == 23 && byte(tbyte(0x5B9624) + 0x000623) == 24
)

achievement(
    title = "[Pac-Mania] EXTEND!", description = "Gain a mutiple of 100,000 score and earn an extra life.", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && dword(0x464B14) >
               prev(dword(0x464B14)) && (low4(tbyte(0x5B9624) + 0x000621) - (prev(low4(tbyte(0x5B9624) + 0x000621)))) ==
               1
)

achievement(
    title = "[Pac-Mania] Ghostly Goroawase", description = "Eat all 6 ghosts in succession to receive a score bonus of 7650!", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && byte(0x5F7552) != 255 && 
              once((dword(0x464B14) - prev(dword(0x464B14))) == 200) && once((dword(0x464B14) - prev(dword(0x464B14)))
               == 400) && once((dword(0x464B14) - prev(dword(0x464B14))) == 800) && once((dword(0x464B14) -
               prev(dword(0x464B14))) == 1600) && once((dword(0x464B14) - prev(dword(0x464B14))) == 3200) && 
              (dword(0x464B14) - prev(dword(0x464B14))) == 7650 && byte(0x464AA0) == prev(byte(0x464AA0)) && 
              byte(0x464A9C) == prev(byte(0x464A9C)) && never((prev(byte(0x5F7552)) == 255 && byte(0x5F7552) != 255))
)

achievement(
    title = "[Pac-Mania] NA-MU-KO-O ", description = "While a score-up pellet is active, eat 3 ghosts in succession to receive a score bonus of 7650!", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && byte(0x5F7552) != 255 && 
              once((dword(0x464B14) - prev(dword(0x464B14))) == 400) && once((dword(0x464B14) - prev(dword(0x464B14)))
               == 1600) && (dword(0x464B14) - prev(dword(0x464B14))) == 7650 && byte(0x464AA0) == prev(byte(0x464AA0)) && 
              byte(0x464A9C) == prev(byte(0x464A9C)) &&
              ((never((prev(byte(0x5F7552)) == 255 && byte(0x5F7552) != 255))) ||
               (never((dword(0x464B14) - prev(dword(0x464B14))) == 200)) ||
               (never((dword(0x464B14) - prev(dword(0x464B14))) == 800)) ||
               (never((dword(0x464B14) - prev(dword(0x464B14))) == 3200)))
)

achievement(
    title = "[Pac-Mania] Treasure Hunter I", description = "Obtain the elusive candy special bonus item.", points = 5,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && low4(tbyte(0x5B9624) + 0x000621)
               > 0 && prev(byte(tbyte(0x5B9624) + 0x004100)) == 30 && trigger_when(byte(0x464A8C) >
               prev(byte(0x464A8C)))
)

achievement(
    title = "[Pac-Mania] Treasure Hunter II", description = "Obtain the elusive green apple special bonus item.", points = 5,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x004100)) == 25 && trigger_when(byte(0x464AF4) > prev(byte(0x464AF4)))
)

achievement(
    title = "[Pac-Mania] Treasure Hunter III", description = "Obtain the elusive coffee special bonus item.", points = 5,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x004100)) == 27 && trigger_when(byte(0x464A98) > prev(byte(0x464A98)))
)

achievement(
    title = "[Pac-Mania] Treasure Hunter IV", description = "Obtain the elusive chocolate ice cream special bonus item.", points = 5,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x004100)) == 29 && trigger_when(byte(0x464A90) > prev(byte(0x464A90)))
)

achievement(
    title = "[Pac-Mania] Treasure Hunter V", description = "Obtain the elusive vanilla ice cream special bonus item.", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x004100)) == 28 && trigger_when(byte(0x464A94) > prev(byte(0x464A94)))
)

achievement(
    title = "[Pac-Mania] Treasure Hunter VI", description = "Obtain the elusive silver bell special bonus item.", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x004100)) == 23 && trigger_when(byte(0x464AF8) > prev(byte(0x464AF8)))
)

achievement(
    title = "[Pac-Mania] Treasure Hunter VII", description = "Obtain the elusive Galaxian flagship special bonus item.", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x004100)) == 21 && trigger_when(byte(0x464A9C) > prev(byte(0x464A9C)))
)

achievement(
    title = "[Pac-Mania] Treasure Hunter VIII", description = "Obtain the elusive silver key special bonus item.", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x004100)) == 24 && trigger_when(byte(0x464AFC) > prev(byte(0x464AFC)))
)

achievement(
    title = "[Pac-Mania] Treasure Hunter IX", description = "Obtain the elusive hamburger special bonus item.", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x004100)) == 26 && trigger_when(byte(0x464A88) > prev(byte(0x464A88)))
)

achievement(
    title = "[Pac-Mania] Legendary Treasure Hunter", description = "Obtain the elusive silver Galaxian flagship special bonus item.", points = 25,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && prev(byte(tbyte(0x5B9624) +
               0x004100)) == 22 && trigger_when(byte(0x464B00) > prev(byte(0x464B00)))
)

achievement(
    title = "[Pac-Mania] Scavenger", description = "Collect at least 1 of each of the 8 regular bonus items in a single game.", points = 25,
    trigger = measured(tally(8, 
                  once(byte(0x464A70) > prev(byte(0x464A70))), 
                  once(byte(0x464A6C) > prev(byte(0x464A6C))), 
                  once(byte(0x464A74) > prev(byte(0x464A74))), 
                  once(byte(0x464A68) > prev(byte(0x464A68))), 
                  once(byte(0x464A78) > prev(byte(0x464A78))), 
                  once(byte(0x464A7C) > prev(byte(0x464A7C))), 
                  once(byte(0x464A80) > prev(byte(0x464A80))), 
                  once(byte(0x464A84) > prev(byte(0x464A84))), 
                  always_false()), when=dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) +
               0x000612) == 0
              ) &&
              ((never((prev(dword(0x361E90)) == 1094931009 && dword(0x361E90) == 1195527504))) ||
               (never((prev(bit0(tbyte(0x5B9624) + 0x000612)) == 1) && bit0(tbyte(0x5B9624) + 0x000612) == 0)))
)

achievement(
    title = "[Pac-Mania] Classically Trained", description = "Complete a round without bouncing or losing a life.", points = 5,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && low4(tbyte(0x5B9624) + 0x000621)
               > 0 && trigger_when(prev(word(tbyte(0x5B9624) + 0x000600)) == 6168) && trigger_when(word(tbyte(0x5B9624)
               + 0x000600) == 6425) && unless(once(((word(tbyte(0x5B9624) + 0x000600) == 5911) && (byte(tbyte(0x5B9624)
               + 0x000041) > 0)) || byte(tbyte(0x5B9624) + 0x0041A0) == 12)) &&
              ((never((byte(tbyte(0x5B9624) + 0x000623) - (prev(byte(tbyte(0x5B9624) + 0x000623)))) == 1)) ||
               (never((prev(low4(tbyte(0x5B9624) + 0x000621)) == 0) && low4(tbyte(0x5B9624) + 0x000621) == 3)))
)

achievement(
    title = "[Ms. Pac-Man] They Meet", description = "Complete Act I.", points = 5,
    trigger = word(0x5BA764) == 12683 && low4(0x5BB658) == 1 && prev(byte(0x5CA3E0)) == 5 && byte(0x5CA3E0) == 6
)

achievement(
    title = "[Ms. Pac-Man] The Chase", description = "Complete Act II.", points = 10,
    trigger = word(0x5BA764) == 12683 && low4(0x5BB658) == 1 && prev(byte(0x5CA3E0)) == 9 && byte(0x5CA3E0) == 10
)

achievement(
    title = "[Ms. Pac-Man] Junior", description = "Complete Act III.", points = 25,
    trigger = word(0x5BA764) == 12683 && low4(0x5BB658) == 1 && prev(byte(0x5CA3E0)) == 13 && byte(0x5CA3E0) == 14
)

achievement(
    title = "[Ms. Pac-Man] Lifesaver II", description = "Gain a multiple of 10,000 score and earn an extra life.", points = 5,
    trigger = word(0x5BA764) == 12683 && low4(0x5BB658) == 1 && dword(0x5CADC8) > prev(dword(0x5CADC8)) && 
              byte(0x5BB690) > prev(byte(0x5BB690))
)

achievement(
    title = "[Ms. Pac-Man] Full Course Meal", description = "Eat all 4 ghosts in succession in the order of: Blinky, Pinky, Inky, and Sue!", points = 25,
    trigger = word(0x5BA764) == 12683 && low4(0x5BB658) == 1 && dword(0x5BB774) == 4294967295 && dword(0x5CAE28) == 0 && 
              trigger_when((once(byte(0x5D2FDB) == 40) && once(byte(0x5D300B) == 40) && once(byte(0x5D303B) == 40) &&
               byte(0x5D306B) == 40)) && never((prev(dword(0x5CAE28)) == 4294967295 && dword(0x5CAE28) == 0))
)

achievement(
    title = "[Ms. Pac-Man] Pellet Proprietor", description = "Collect all 220 regular pellets in the first round without collecting a power pellet.", points = 25,
    trigger = word(0x5BA764) == 12683 && low4(0x5BB658) == 1 && dword(0x5BB774) == 4294967295 && byte(0x5CA3E0) == 1 && 
              trigger_when(repeated(220, word(0x5CA3F4) > prev(word(0x5CA3F4)))) && unless(once(prev(dword(0x5CAE28)) ==
               4294967295 && dword(0x5CAE28) == 0)) &&
              (always_false() || (never((prev(dword(0x5BB774)) == 0 && dword(0x5BB774) == 4294967295))))
)

achievement(
    title = "[Ms. Pac-Man] Connoisseur of Rare Goods II", description = "Collect at least 1 of each of the 7 bonus items in a single game.", points = 25,
    trigger = measured(tally(7, 
                  once(byte(0x5CAB62) > prev(byte(0x5CAB62))), 
                  once(byte(0x5CAB64) > prev(byte(0x5CAB64))), 
                  once(byte(0x5CAB66) > prev(byte(0x5CAB66))), 
                  once(byte(0x5CAB68) > prev(byte(0x5CAB68))), 
                  once(byte(0x5CAB6A) > prev(byte(0x5CAB6A))), 
                  once(byte(0x5CAB6C) > prev(byte(0x5CAB6C))), 
                  once(byte(0x5CAB6E) > prev(byte(0x5CAB6E))), 
                  always_false()), when=word(0x5BA764) == 12683 && low4(0x5BB658) == 1 &&
               dword(0x5BB774) == 429496729
              ) &&
              (always_false() || (never((prev(dword(0x5BB774)) == 0 && dword(0x5BB774) == 4294967295))))
)

achievement(
    title = "[Ms. Pac-Man] Pac-Ifist", description = "Complete 2 rounds without eating a ghost.", points = 10,
    trigger = word(0x5BA764) == 12683 && low4(0x5BB658) == 1 && dword(0x5BB774) == 4294967295 && 
              unless(once(byte(0x5D2FDB) == 40 || byte(0x5D300B) == 40 || byte(0x5D303B) == 40 || byte(0x5D306B) == 40)) && 
              trigger_when(repeated(2, byte(0x5CA3E0) > prev(byte(0x5CA3E0)))) &&
              ((never((prev(dword(0x5BB774)) == 0 && dword(0x5BB774) == 4294967295))) ||
               (never((once(byte(0x5D2FDB) == 40 || byte(0x5D300B) == 40 || byte(0x5D303B) == 40 || byte(0x5D306B) ==
                 40)) && byte(0x5CA3E0) > prev(byte(0x5CA3E0)))))
)
