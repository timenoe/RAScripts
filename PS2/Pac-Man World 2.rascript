// Pac-Man World 2
// #ID = 19097
// RA Checksum: 8ffd544a22cc814fd340cae387d18eb1

// RAScript by: timenoe
// Last Edit: June 10, 2022

//Dictionaries

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
    23: 0x497558,
    24: 0x4975E0
    
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
    23: false,
    24: true
    
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
    23: true,
    24: false
    
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

//Functions

function levelID() => byte(0x49BD2C)
function levelComplete(key) => bit0(levelBase[key])
function levelCompletion(key) => byte(levelBase[key] + 112)
function levelToken(key, i) => bit0(levelBase[key] + (64 + (i - 1) * 4))
function levelTimeTrialToken(key) => bit0(levelBase[key] + 100)

//Achievements

for key in levelBase {

    if key == 0 points = 1 else points = 5
    
    if key == 24 {
        
        title = levelName[key]
        description = "Defeat Spooky and restore peace to Pac-Village!"
        trigger = levelID() == key && prev(levelComplete(key)) == 0 && levelComplete(key) == 1 && dword(0x5B8CB8) != 8010240 && dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224
        achievement(title, description, 25, trigger)
        
    }
    
    else {
        
        title = levelName[key]
        description = "Complete " + levelName[key] + " and reveal the path to " + levelName[key+1] + "."
        trigger = levelID() == key && prev(levelComplete(key)) == 0 && levelComplete(key) == 1 && dword(0x5B8CB8) != 8010240 && dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224
        achievement(title, description, points, trigger)
        
    }
    
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
                    trigger = word(0x5BA764) == 13914 && prev(bit0(0x85E208)) == 0 && bit0(0x85E208) == 1
                )
                
                achievement(
                    title = "Cannonball!", description = "In The Bear Basics, collect the strawberry above the lake without jumping up out of the water.", points = 5,
                    trigger = word(0x5BA764) == 13914 && float(0x3E6B58) < -200.0 && trigger_when(tbyte(tbyte(0x5B7400) + 0x000084) ==
                               1) && unless(once(byte(0x5B8D7C) == 21 || float(0x5B9114) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13896 && word(0x5BA764) == 13914))))
                )
                
            }
            
            else if key == 2 {
                
                achievement(
                    title = "Orderly RGB", description = "In Canyon Chaos, defeat the three RGBs and collect their fruit in the proper order.", points = 5,
                    trigger = word(0x5BA764) == 13769 && float(0x3E6B58) < -250.0 && once(bit0(tbyte(0x5B7400) + 0x000044) == 0) && 
                              once(bit0(tbyte(0x5B7400) + 0x000058) == 0) && once(bit0(tbyte(0x5B7400) + 0x00005A) == 0) && 
                              trigger_when((once(bit0(tbyte(0x5B7400) + 0x000044) == 1)) && (once(bit0(tbyte(0x5B7400) + 0x000058) ==
                               1)) && bit0(tbyte(0x5B7400) + 0x00005A) == 1) && unless(once(((bit0(tbyte(0x5B7400) + 0x000058) == 1) ||
                               (bit0(tbyte(0x5B7400) + 0x00005A) == 1)) && bit0(tbyte(0x5B7400) + 0x000044) == 0)) && 
                              unless(once((bit0(tbyte(0x5B7400) + 0x00005A) == 1) && bit0(tbyte(0x5B7400) + 0x000058) == 0)) && 
                              unless(once(float(0x5B9114) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13751 && word(0x5BA764) == 13769))))
                )
                
            }
            
            else if key == 3 {
                
                achievement(
                    title = "The Water is Lava!", description = "Complete Pac-Dot Pond without swimming.", points = 10,
                    trigger = word(0x5BA764) == 13770 && trigger_when(dword(0x361E90) == 1163281740) && unless(once(byte(0x5B8D7C) == 16
                               || byte(0x5B8D7C) == 20)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13752 && word(0x5BA764) == 13770 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 5 {
                
                achievement(
                    title = "Trampolinist's Treasure", description = "In B-Doing Woods, collect all 15 fruits in the trampoline section without landing.", points = 10,
                    trigger = word(0x5BA764) == 13989 && float(0x3E6B58) < -1000.0 && float(0x3E6B58) > -1750.0 && 
                              once(((bit0(tbyte(0x5B7400) + 0x00006D)) + (bit0(tbyte(0x5B7400) + 0x00006E)) + (bit0(tbyte(0x5B7400) +
                               0x00006F)) + (bit0(tbyte(0x5B7400) + 0x000070)) + (bit0(tbyte(0x5B7400) + 0x000071)) +
                               (bit0(tbyte(0x5B7400) + 0x000072)) + (bit0(tbyte(0x5B7400) + 0x000073)) + (bit0(tbyte(0x5B7400) +
                               0x000077)) + (bit0(tbyte(0x5B7400) + 0x00007B)) + (bit0(tbyte(0x5B7400) + 0x00007F)) +
                               (bit0(tbyte(0x5B7400) + 0x000080)) + (bit0(tbyte(0x5B7400) + 0x000081)) + (bit0(tbyte(0x5B7400) +
                               0x000082)) + (bit0(tbyte(0x5B7400) + 0x000083)) + bit0(tbyte(0x5B7400) + 0x000084)) == 0) && 
                              trigger_when(((bit0(tbyte(0x5B7400) + 0x00006D)) + (bit0(tbyte(0x5B7400) + 0x00006E)) +
                               (bit0(tbyte(0x5B7400) + 0x00006F)) + (bit0(tbyte(0x5B7400) + 0x000070)) + (bit0(tbyte(0x5B7400) +
                               0x000071)) + (bit0(tbyte(0x5B7400) + 0x000072)) + (bit0(tbyte(0x5B7400) + 0x000073)) +
                               (bit0(tbyte(0x5B7400) + 0x000077)) + (bit0(tbyte(0x5B7400) + 0x00007B)) + (bit0(tbyte(0x5B7400) +
                               0x00007F)) + (bit0(tbyte(0x5B7400) + 0x000080)) + (bit0(tbyte(0x5B7400) + 0x000081)) +
                               (bit0(tbyte(0x5B7400) + 0x000082)) + (bit0(tbyte(0x5B7400) + 0x000083)) + bit0(tbyte(0x5B7400) +
                               0x000084)) == 15) && unless(once((float(0x3E6B58) < -1200.0 && float(0x3E6B58) > -1700.0 &&
                               byte(0x5B8D7C) == 43) || float(0x5B9114) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13971 && word(0x5BA764) == 13989))))
                )
                
            }
            
            else if key == 6 {
                
                achievement(
                    title = "Trial of the Treewood", description = "Complete Treewood Forest without collecting any checkpoints or fruits, or taking damage.", points = 25,
                    trigger = word(0x5BA764) == 12846 && trigger_when(dword(0x361E90) == 1163281740) && unless(byte(0x5F8D70) == 255) && 
                              unless(once(((byte(0x5F8D70) + byte(0x5F8D74) + byte(0x5F8D78) + byte(0x5F8D7C) + byte(0x5F8D80) +
                               byte(0x5F8D84)) > 0) || byte(0x5B741C) > 0 || float(0x495B58) < prev(float(0x495B58)) || float(0x5B9114)
                               != 0.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 12828 && word(0x5BA764) == 12846 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 7 {
                
                achievement(
                    title = "Aflame Pain", description = "Complete Butain Pain without using the Steel Ball power-up...", points = 25,
                    trigger = word(0x5BA764) == 13464 && trigger_when(dword(0x361E90) == 1163281740) && unless(once(low4(0x5B9E10) ==
                               1)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13446 && word(0x5BA764) == 13464 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 9 {
                
                achievement(
                    title = "Skip and a Hop", description = "Complete Ice River Run without slipping on the ice.", points = 10,
                    trigger = word(0x5BA764) == 12881 && trigger_when(dword(0x361E90) == 1163281740) && unless(once(byte(0x5B8D7C) ==
                               53)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 12863 && word(0x5BA764) == 12881 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 10 {
                
                achievement(
                    title = "Ready, Set, Action!", description = "In Avalanche Alley, boost your Rev Roll using the ramp and the statue's breath, and land on the red Pac-Dot over the valley!", points = 25,
                    trigger = word(0x5BA764) == 13203 && float(0x3E6B50) < -1740.0 && float(0x3E6B58) < 625.0 && float(0x3E6B50) >
                               -2669.0 && float(0x3E6B58) > 193.0 && trigger_when(once(byte(0x5B8D7C) == 6)) && 
                              trigger_when(byte(0x5B8D7C) == 38) && unless(once(float(0x5B9114) != 0.0)) && unless(once(float(0x3E6B50)
                               < -1948.0 && float(0x3E6B58) < 535.0 && byte(0x5B8D7C) != 6 && byte(0x5B8D7C) != 27 && byte(0x5B8D7C) !=
                               34 && byte(0x5B8D7C) != 38)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13185 && word(0x5BA764) == 13203))))
                )
                
                achievement(
                    title = "Maximum Overdrive", description = "In Avalanche Alley, reach warp speed in the tunnel using a statue's breath!", points = 5,
                    trigger = word(0x5BA764) == 13203 && float(0x3E6B58) < -700.0 && float(0x3E6B54) > 100.0 && float(0x7F3070) >= 24.0
                )
                 
            }
            
            else if key == 11 {
                
                achievement(
                    title = "Blurred Blades", description = "In Blade Mountain, maintain your speed the whole way down!", points = 10,
                    trigger = word(0x5BA764) == 13051 && once(float(0x7F2470) >= 3.0) && trigger_when(dword(0x361E90) == 1163281740) && 
                              unless(once(prev(float(0x7F2470)) >= 3.0 && float(0x7F2470) < 3.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13033 && word(0x5BA764) == 13051 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 13 {
                
               achievement(
                    title = "More Bounce to the Ounce", description = "Complete Into the Volcano without grabbing onto a ledge.", points = 10,
                    trigger = word(0x5BA764) == 13090 && trigger_when(dword(0x361E90) == 1163281740) && unless(once(byte(0x5B8D7C) ==
                               48)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13072 && word(0x5BA764) == 13090 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 14 {
                
                achievement(
                    title = "All Natural", description = "Complete Volcanic Panic without using the Steel Ball power-up or taking damage.", points = 25,
                    trigger = word(0x5BA764) == 13996 && trigger_when(dword(0x361E90) == 1163281740) && unless(once(low4(0x5B9E10) == 1
                               || float(0x495B58) < prev(float(0x495B58)))) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13978 && word(0x5BA764) == 13996 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 15 {
                
                achievement(
                    title = "Pacrobatic", description = "In Magma Opus, get past the first pillar section and grab the checkpoint without activating the rising platform.", points = 10,
                    trigger = word(0x5BA764) == 13446 && float(0x3E6B50) < -2600.0 && float(0x3E6B50) > -3250.0 && (prev(byte(0x5B741C))
                               == 0 || prev(byte(0x5B741C)) == 4 || prev(byte(0x5B741C)) == 5) && trigger_when(byte(0x5B741C) == 6) && 
                              unless(once(bit0(0x46D210) == 1 || float(0x5B9114) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13428 && word(0x5BA764) == 13446))))
                )
                
                achievement(
                    title = "Flaming Feast", description = "In Magma Opus, eat 5 ghosts in a row and receive a score bonus of 7650.", points = 5,
                    trigger = word(0x5BA764) == 13446 && (dword(0x497120) - prev(dword(0x497120))) == 7650
                )
                
                achievement(
                    title = "Leap of Faith", description = "In Magma Opus, Butt Bounce all the way down the abyss to the goal instead of using the slide.", points = 10,
                    trigger = word(0x5BA764) == 13446 && float(0x3E6B50) < -5500.0 && once(float(0x3E6B54) < 10.0) && 
                              trigger_when(dword(0x361E90) == 1163281740) && unless(once(float(0x3E6B50) < -5800.0 && byte(0x5B8D7C) ==
                               6)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13428 && word(0x5BA764) == 13446))))
                )
                
            }
            
            else if key == 17 {
                
                achievement(
                    title = "Expert Diver", description = "Complete Scuba Duba while collecting all Pac-Dots and fruits in one attempt.", points = 10,
                    trigger = word(0x5BA764) == 15066 && trigger_when(word(0x5B9F50) == 133) && trigger_when(byte(0x5F8D70) == 7) && 
                              trigger_when(byte(0x5F8D74) == 8) && trigger_when(byte(0x5F8D78) == 4) && trigger_when(byte(0x5F8D7C) ==
                               4) && trigger_when(byte(0x5F8D80) == 6) && trigger_when(byte(0x5F8D84) == 1) && 
                              trigger_when(dword(0x361E90) == 1163281740) && unless(once(float(0x5B9114) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 15048 && word(0x5BA764) == 15066 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 18 {
                
                achievement(
                    title = "Threading the Needle", description = "Complete Shark Attack without bumping into any obstacles and drastically losing speed.", points = 25,
                    trigger = word(0x5BA764) == 15496 && trigger_when(dword(0x361E90) == 1163281740) && 
                              unless(once(prev(float(0x829DF0)) >= 1.2 && float(0x829DF0) < 1.2)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 15478 && word(0x5BA764) == 15496 && byte(0x5B741C) == 0))))
                )
                
            }
            
            else if key == 19 {
                
                achievement(
                    title = "Full Steam Ahead", description = "Complete Yellow Pac-Marine with a score of 0.", points = 25,
                    trigger = word(0x5BA764) == 12340 && trigger_when(dword(0x361E90) == 1163281740) && unless(once(dword(0x497340) > 0
                               || float(0x5B9114) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 12322 && word(0x5BA764) == 12340))))
                )
                
            }
            
            else if key == 21 {
            
                achievement(
                    title = "Training Exercise", description = "Complete Haunted Boardwalk without collecting any checkpoints, Pac-Dots, or fruits.", points = 10,
                    trigger = word(0x5BA764) == 12534 && trigger_when(dword(0x361E90) == 1163281740) && unless(byte(0x5F8D70) == 255) && 
                              unless(once(((byte(0x5B741C) + word(0x5B9F50) + byte(0x5F8D70) + byte(0x5F8D74) + byte(0x5F8D78) +
                               byte(0x5F8D7C) + byte(0x5F8D80) + byte(0x5F8D84)) > 0) || float(0x5B9114) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 12516 && word(0x5BA764) == 12534))))
                )
            
            }
            
            else if key == 22 {
                
                achievement(
                    title = "Arachnophobia", description = "In Night Crawling, collect all 132 Pac-Dots in the spider maze without jumping or Rev Rolling.", points = 10,
                    trigger = word(0x5BA764) == 14450 && trigger_when(repeated(132, byte(0x5B9F50) > prev(byte(0x5B9F50)))) && 
                              unless(once(float(0x5B9114) != 0.0)) && unless((float(0x3E6B50) > 6450.0 || float(0x3E6B50) < 6100.0) &&
                               word(0x5BA764) == 14450) && unless(once(byte(0x5B8D7C) == 3 || byte(0x5B8D7C) == 10 || byte(0x5B8D7C) ==
                               5 || byte(0x5B8D7C) == 39 || byte(0x5B8D7C) == 6 || byte(0x5B8D7C) == 40)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 14432 && word(0x5BA764) == 14450))))
                )
                
            }
            
            else if key == 23 {
                
                achievement(
                    title = "Livin' Dangerously", description = "In Ghost Bayou, reach the first checkpoint without activating the Pac-Dot chain over the fence.", points = 25,
                    trigger = word(0x5BA764) == 13673 && trigger_when(byte(0x5B741C) == 1) && unless(once(dword(0x88D36C) == 1)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13655 && word(0x5BA764) == 13673 && byte(0x5B741C) == 0))))
                )
                
                achievement(
                    title = "Skull Bouncer", description = "In Ghost Bayou, defeat 20 Skeletal Minions before the timer reaches less than 10 seconds!", points = 10,
                    trigger = word(0x5BA764) == 13673 && byte(0x5B741C) == 3 && never((prev(word(0x5BA764)) == 13655 && word(0x5BA764)
                               == 13673)) &&
                              ((once(prev(float(0x87F568)) == 30.0 && float(0x87F568) < 30.0) && trigger_when((prev(byte(0x87F56C)) == 1
                                 && byte(0x87F56C) == 0)) && unless(once(float(0x87F568) > 0.0 && float(0x87F568) < 10.0))) ||
                               (once(prev(float(0x87FC68)) == 30.0 && float(0x87FC68) < 30.0) && trigger_when((prev(byte(0x87FC6C)) == 1
                                 && byte(0x87FC6C) == 0)) && unless(once(float(0x87FC68) > 0.0 && float(0x87FC68) < 10.0))))
                )
                
                achievement(
                    title = "Trick the Tree", description = "Complete Ghost Bayou while collecting no more than 73 Pac-Dots...", points = 25,
                    trigger = word(0x5BA764) == 13673 && trigger_when(dword(0x361E90) == 1163281740) && unless(once(byte(0x5B9F50) > 73
                               || float(0x5B9114) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5BA764)) == 13655 && word(0x5BA764) == 13673))))
                )
                
            }
        }
        
        else {
            achievement(
                title = "Rooftop Rev Roller", description = "In Pac-Village, start on the blue roof and collect all of the rooftop fruits without falling off.", points = 25,
                trigger = (word(0x5BA764) == 13370 || word(0x5BA764) == 13242) && once((prev(bit0(tbyte(0x5B7400) + 0x00002A)) == 0)
                           && bit0(tbyte(0x5B7400) + 0x00002A) == 1) && trigger_when(repeated(5, byte(0x5F8D80) >
                           prev(byte(0x5F8D80)))) && trigger_when(repeated(2, byte(0x5F8D70) > prev(byte(0x5F8D70)))) && 
                          trigger_when(once(byte(0x5F8D74) > prev(byte(0x5F8D74)))) && trigger_when(once(byte(0x5F8D7C) >
                           prev(byte(0x5F8D7C)))) &&
                          ((never((prev(float(0x3E6B54)) <= -11.0 && float(0x3E6B54) > -11.0))) ||
                           (never((prev(float(0x3E6B54)) >= -11.0 && float(0x3E6B54) < -11.0))) ||
                           (never((prev(float(0x3E6B50)) <= 180.0 && float(0x3E6B50) > 180.0))) ||
                           (never((prev(float(0x3E6B50)) >= -300.0 && float(0x3E6B50) < -300.0))) ||
                           (never((prev(float(0x3E6B58)) <= 290.0 && float(0x3E6B58) > 290.0))) ||
                           (never((prev(float(0x3E6B58)) >= -120.0 && float(0x3E6B58) < -120.0))))
            )
        }
    }
    
    else {
        
        if key == 4 {
            
            achievement(
                title = "Dinky Blinky", description = "Defeat Blinky without jumping or taking damage.", points = 10,
                trigger = word(0x5BA764) == 13837 && trigger_when(dword(0x361E90) == 1145851719) && unless(once(byte(0x5B8D7C) == 3
                           || byte(0x5B8D7C) == 10 || float(0x495B58) < prev(float(0x495B58)))) &&
                          (always_false() || (never((prev(word(0x5BA764)) == 13819 && word(0x5BA764) == 13837 && byte(0x8003F8) == 0))))
            )
            
        }
        
        else if key == 8 {
            
            achievement(
                title = "What Blades?", description = "Defeat Inky in less than 25 seconds and without taking damage!", points = 25,
                trigger = word(0x5BA764) == 12969 && trigger_when(dword(0x361E90) == 1145851719) && unless(once(repeated(1500,
                           word(0x5BA764) == 12969) || float(0x495B58) < prev(float(0x495B58)))) &&
                          (always_false() || (never((prev(word(0x5BA764)) == 12951 && word(0x5BA764) == 12969 && float(0x7FAFAC) == 0.0))))
            )
            
        }
        
        else if key == 12 {
            
            achievement(
                title = "Wombo Combo", description = "Defeat Pinky in less than 30 seconds and without taking damage!", points = 25,
                trigger = word(0x5BA764) == 12951 && trigger_when(dword(0x361E90) == 1145851719) && unless(once(repeated(1800,
                           word(0x5BA764) == 12951) || float(0x495B58) < prev(float(0x495B58)))) &&
                          (always_false() || (never((prev(word(0x5BA764)) == 12933 && word(0x5BA764) == 12951 && float(0x80642C) == 0.0))))
            )
            
        }
        
        else if key == 16 {
            
            achievement(
                title = "Fire Sale", description = "Defeat Clyde in less than 1 minute and 30 seconds!", points = 50,
                trigger = word(0x5BA764) == 11919 && trigger_when(dword(0x361E90) == 1145851719) && unless(repeated(5400,
                           word(0x5BA764) == 11919)) &&
                          (always_false() || (never((prev(word(0x5BA764)) == 11901 && word(0x5BA764) == 11919 && float(0x81A22C) == 0.0))))
            )
            
        }
        
        else if key == 20 {
            
            achievement(
                title = "Submarine Supernova", description = "Defeat the Whale on a Sub in 2 phases or less!", points = 50,
                trigger = word(0x5BA764) == 14152 && trigger_when(dword(0x361E90) == 1145851719) && unless(once(byte(0x5B741C) ==
                           5)) &&
                          (always_false() || (never((prev(word(0x5BA764)) == 14134 && word(0x5BA764) == 14152 && byte(0x5B741C) == 0))))
            )
            
        }
        
        else if key == 24 {
            
            achievement(
                title = "Sir-Pac-A-Lot II", description = "Defeat Spooky without taking damage!", points = 25,
                trigger = prev(word(0x5BA764)) == 12911 && trigger_when(word(0x5BA764) == 9505) && unless(once(dword(0x1FFFB34) == 1
                           || float(0x495B58) < prev(float(0x495B58)))) &&
                          (always_false() || (never((prev(word(0x5BA764)) == 12893 && word(0x5BA764) == 12911 && low4(0x7EEAFC) == 0))))
            )

            achievement(
                title = "Sucker Kicks", description = "At the very start of the battle, kick Spooky 4 times before he has a chance to get away!", points = 25,
                trigger = word(0x5BA764) == 12911 && low4(0x7EEAFC) == 0 && trigger_when(float(0x3E6B50) == 0.0) && 
                          trigger_when(float(0x3E6B58) == 0.0) && trigger_when(float(0x3E6B54) == -0.557057) && unless(repeated(250,
                           always_true())) &&
                          (always_false() || (never((prev(word(0x5BA764)) == 12893 && word(0x5BA764) == 12911 && low4(0x7EEAFC) == 0))))
            )
            
        }
    }
}

achievement(
    title = "The Restoration of Pac-Village", description = "View all of the concept art in the Pac-Village Museum.", points = 1,
    trigger = byte(0x49BD2C) == 0 && prev(byte(0x5B8A50)) == 29 && byte(0x5B8A50) == 0
)

achievement(
    title = "Keeper of the Golden Fruit Tree", description = "Achieve 100% completion in every level!", points = 50,
    trigger = (prev(byte(0x496770)) / 100 + prev(byte(0x496A18)) / 100 + prev(byte(0x496AA0)) / 100 +
               prev(byte(0x496B28)) / 100 + prev(byte(0x496BB0)) / 100 + prev(byte(0x496C38)) / 100 +
               prev(byte(0x496CC0)) / 100 + prev(byte(0x496D48)) / 100 + prev(byte(0x496DD0)) / 100 +
               prev(byte(0x496E58)) / 100 + prev(byte(0x496EE0)) / 100 + prev(byte(0x496F68)) / 100 +
               prev(byte(0x496FF0)) / 100 + prev(byte(0x497078)) / 100 + prev(byte(0x497100)) / 100 +
               prev(byte(0x497188)) / 100 + prev(byte(0x497210)) / 100 + prev(byte(0x497298)) / 100 +
               prev(byte(0x497320)) / 100 + prev(byte(0x4973A8)) / 100 + prev(byte(0x497430)) / 100 +
               prev(byte(0x4974B8)) / 100 + prev(byte(0x497540)) / 100 + prev(byte(0x4975C8)) / 100 +
               prev(byte(0x497650)) / 100 + 0) == 24 && measured((byte(0x496770) / 100 + byte(0x496A18) / 100 +
               byte(0x496AA0) / 100 + byte(0x496B28) / 100 + byte(0x496BB0) / 100 + byte(0x496C38) / 100 +
               byte(0x496CC0) / 100 + byte(0x496D48) / 100 + byte(0x496DD0) / 100 + byte(0x496E58) / 100 +
               byte(0x496EE0) / 100 + byte(0x496F68) / 100 + byte(0x496FF0) / 100 + byte(0x497078) / 100 +
               byte(0x497100) / 100 + byte(0x497188) / 100 + byte(0x497210) / 100 + byte(0x497298) / 100 +
               byte(0x497320) / 100 + byte(0x4973A8) / 100 + byte(0x497430) / 100 + byte(0x4974B8) / 100 +
               byte(0x497540) / 100 + byte(0x4975C8) / 100 + byte(0x497650) / 100 + 0) == 25, when=dword(0x5B8CB8) !=
               8010240 && dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224)
)

achievement(
    title = "Champion of the Golden Fruit Free", description = "Start a new game, defeat Spooky, and then save your game in under 2 hours!", points = 50,
    trigger = once(byte(0x495B61) == 0 && byte(0x495B62) == 0 && float(0x495B64) == 0.0 && word(0x5BA764) == 13370) && 
              once(byte(0x49BD2C) == 24 && prev(bit0(0x4975E0)) == 0 && bit0(0x4975E0) == 1) && (byte(0x495B61) !=
               prev(byte(0x495B61)) || byte(0x495B62) != prev(byte(0x495B62)) || float(0x495B64) !=
               prev(float(0x495B64))) && (byte(0x495B61) * 3600 + byte(0x495B62) * 60 + float(0x495B64)) < 7200 && 
              never((prev(word(0x3E7082)) == 0 && word(0x3E7082) == 16908))
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
    title = "Arcade Fanatic IV", description = "Collect 100 tokens and unlock Pac-Mania in Sue's Arcade.", points = 25,
    trigger = prev(byte(0x495B80)) == 99 && measured(byte(0x495B80) == 100, when=(dword(0x5B8CB8) != 8010240 &&
               dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "Arcade Fanatic V", description = "Collect 150 tokens and unlock the Museum in Pac-Village.", points = 25,
    trigger = prev(byte(0x495B80)) == 149 && measured(byte(0x495B80) == 150, when=(dword(0x5B8CB8) != 8010240 &&
               dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "Patron of Sue's Arcade", description = "Collect 180 tokens and unlock Ms. Pac-Man in Sue's Arcade.", points = 25,
    trigger = prev(byte(0x495B80)) == 179 && measured(byte(0x495B80) == 180, when=(dword(0x5B8CB8) != 8010240 &&
               dword(0x5B8CB8) != 8114944 && dword(0x5B8CB8) != 8116224))
)

achievement(
    title = "Token Enthusiast", description = "Collect all 189 tokens!", points = 50,
    trigger = prev(byte(0x495B80)) == 188 && measured(byte(0x495B80) == 189, when=(dword(0x5B8CB8) != 8010240 &&
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
    title = "[Pac-Man] Intermission III", description = "Complete Intermission III.", points = 25,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && prev(byte(0x5D3C10)) == 13 && byte(0x5D3C10) == 14
)

achievement(
    title = "[Pac-Man] Lifesaver I", description = "Gain a multiple of 10,000 score and earn an extra life.", points = 5,
    trigger = word(0x5BA764) == 12403 && low4(0x5BB818) == 1 && dword(0x5BB878) > prev(dword(0x5BB878)) && 
              byte(0x5BB840) > prev(byte(0x5BB840))
)

achievement(
    title = "[Pac-Man] Ghost Gobbler", description = "Eat all 4 ghosts in succession to receive a score bonus of 1600.", points = 10,
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
    title = "[Pac-Attack] Pac-Tris", description = "Clear 50 levels in one game.", points = 25,
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
    title = "[Pac-Attack] Aliens and Marbles Galore", description = "Eat at least 10 ghosts consecutively.", points = 25,
    trigger = prev(byte(0x57E448)) < 10 && byte(0x57E448) >= 10 &&
              ((dword(0x361E90) == 1297239886) ||
               (dword(0x361E90) == 1146241352) ||
               (dword(0x361E90) == 1162893640) ||
               (dword(0x361E90) == 776228679))
)

achievement(
    title = "[Pac-Attack] Pac-Trimino", description = "Clear at least 4 lines at once.", points = 25,
    trigger = prev(byte(0x57E44E)) < 4 && byte(0x57E44E) >= 4 &&
              ((dword(0x361E90) == 1297239886) ||
               (dword(0x361E90) == 1146241352) ||
               (dword(0x361E90) == 1162893640) ||
               (dword(0x361E90) == 776228679))
)

achievement(
    title = "[Pac-Attack] Floor the Fairy", description = "Guide a fairy to the very bottom of the board and earn a massive score bonus.", points = 25,
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
    title = "[Pac-Mania] Nice Going! The Show's Gonna Go On!", description = "Complete 11 rounds without using a continue.", points = 25,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && low4(tbyte(0x5B9624) + 0x000621)
               > 0 && prev(byte(tbyte(0x5B9624) + 0x000623)) >= 9 && prev(byte(tbyte(0x5B9624) + 0x000623)) < 12 && 
              trigger_when(byte(tbyte(0x5B9624) + 0x000623) == 12) && unless(once((prev(low4(tbyte(0x5B9624) +
               0x000621)) == 0) && low4(tbyte(0x5B9624) + 0x000621) == 3)) &&
              (always_false() || (never((prev(byte(tbyte(0x5B9624) + 0x000623)) == 0) && byte(tbyte(0x5B9624) + 0x000623) == 1)))
)

achievement(
    title = "[Pac-Mania] ...To Be Continued", description = "Complete round 23 and view the credits.", points = 25,
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
    title = "[Pac-Mania] Ghostly Goroawase", description = "Eat all 6 ghosts in succession to receive a score bonus of 7650.", points = 10,
    trigger = dword(0x361E90) == 1195527504 && bit0(tbyte(0x5B9624) + 0x000612) == 0 && byte(0x5F7552) != 255 && 
              once((dword(0x464B14) - prev(dword(0x464B14))) == 200) && once((dword(0x464B14) - prev(dword(0x464B14)))
               == 400) && once((dword(0x464B14) - prev(dword(0x464B14))) == 800) && once((dword(0x464B14) -
               prev(dword(0x464B14))) == 1600) && once((dword(0x464B14) - prev(dword(0x464B14))) == 3200) && 
              (dword(0x464B14) - prev(dword(0x464B14))) == 7650 && byte(0x464AA0) == prev(byte(0x464AA0)) && 
              byte(0x464A9C) == prev(byte(0x464A9C)) && never((prev(byte(0x5F7552)) == 255 && byte(0x5F7552) != 255))
)

achievement(
    title = "[Pac-Mania] NA-MU-KO-O ", description = "While a score-up pellet is active, eat 3 ghosts in succession to receive a score bonus of 7650.", points = 10,
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
    title = "[Ms. Pac-Man] Full Course Meal", description = "Eat all 4 ghosts in succession in the order of: Blinky, Pinky, Inky, and Sue.", points = 25,
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

//Code Notes

// $354A10: [32-bit] Misc ID (v2.00)
//          Cutscenes
//          0x4556454c = Completed a Level
//          0x444c4f47 = Collected a Golden Fruit
// $361E90: [32-bit] Misc ID
//          Cutscenes
//          0x4556454c = Completed a Level
//          0x444c4f47 = Collected a Golden Fruit
//          Arcade
//          0x41435241 = Inside Arcade
//          0x454c4953 = Pac-Man, Ms. Pac-Man
//          0x4e45504f = Pac-Attack (Select Screen)
//          0x4d524f4e = Pac-Attack (1 Player - Beginner, Novice)
//          0x44524148 = Pac-Attack (1 Player - Standard)
//          0x45505948 = Pac-Attack (1 Player - Veteran)
//          0x2e444f47 = Pac-Attack (1 Player - Godhand?)
//          0x41434150 = Pac-Attack (Game Over)
//          0x4f434552 = Pac-Attack (Record Screen)
//          0x4f4d5032 = Pac-Attack (2 Player)
//          0x47424d50 = Pac-Mania
// $363474: [Lower4] Power Pellet
//          1 = Active
//          2 = Ending Soon
// $3D9FE0: [Float] X,Y Coordinate Pair (v2.00)
// $3D9FE4: [Float] Z Coordinate (v2.00)
// $3D9FE8: [Float] X,Y Coordinate Pair (v2.00)
// $3DA4F4: [8-bit] User Input - Face Buttons/Bumpers/Triggers (v2.00)
//          Bit7 = Square
//          Bit6 = Cross
//          Bit5 = Cricle
//          Bit4 = Triangle
//          Bit3 = RB
//          Bit2 = LB
//          Bit1 = RT
//          Bit0 = LT
// $3DA512: [16-bit] Game State (v2.00)
//          0 = Loading/In a Level
//          0x3e80 = Overworld
//          0x420c = Title Screen
// $3E6B50: [Float] X,Y Coordinate Pair
// $3E6B54: [Float] Z Coordinate
// $3E6B58: [Float] X,Y Coordinate Pair
// $3E7064: [8-bit] User Input - Face Buttons/Bumpers/Triggers
//          Bit7 = Square
//          Bit6 = Cross
//          Bit5 = Cricle
//          Bit4 = Triangle
//          Bit3 = RB
//          Bit2 = LB
//          Bit1 = RT
//          Bit0 = LT
// $3E7065: [8-bit] User Input - D-Pad/Start/Select
//          Bit7 = Left
//          Bit6 = Down
//          Bit5 = Right
//          Bit4 = Up
//          Bit3 = Start
//          Bit2 = R3
//          Bit1 = L3
//          Bit0 = Select
// $3E7071: [8-bit] User Input - Analog
//          Bit7 = Left
//          Bit6 = Down
//          Bit5 = Right
//          Bit4 = Up
// $3E7082: [16-bit] Game State
//          0 = Loading/In a Level
//          0x3e80 = Overworld
//          0x420c = Title Screen
// $464A44: [32-bit] Arcade - Pac-Mania - High Score
// $464A48: [8-bit] Arcade - Pac-Mania - Round Record (No Continues)
// $464A68: [8-bit] Arcade - Pac-Mania - Apple Count
// $464A6C: [8-bit] Arcade - Pac-Mania - Strawberry Count
// $464A70: [8-bit] Arcade - Pac-Mania - Cherry Count
// $464A74: [8-bit] Arcade - Pac-Mania - Orange Count
// $464A78: [8-bit] Arcade - Pac-Mania - Bananas Count
// $464A7C: [8-bit] Arcade - Pac-Mania - Peach Count
// $464A80: [8-bit] Arcade - Pac-Mania - Bell Count
// $464A84: [8-bit] Arcade - Pac-Mania - Key Count
// $464A88: [8-bit] Arcade - Pac-Mania - Hamburger Count
// $464A8C: [8-bit] Arcade - Pac-Mania - Candy Count
// $464A90: [8-bit] Arcade - Pac-Mania - Chocolate Ice Cream Count
// $464A94: [8-bit] Arcade - Pac-Mania - Vanilla Ice Cream Count
// $464A98: [8-bit] Arcade - Pac-Mania - Coffee Count
// $464A9C: [8-bit] Arcade - Pac-Mania - Galaxian Flagship Count
// $464AA0: [8-bit] Arcade - Pac-Mania - Score-Up Pellet Count
// $464AA4: [8-bit] Arcade - Pac-Mania - Speed-Up Pellet Count
// $464AF4: [8-bit] Arcade - Pac-Mania - Green Apple Count
// $464AF8: [8-bit] Arcade - Pac-Mania - Silver Bell Count
// $464AFC: [8-bit] Arcade - Pac-Mania - Silver Key Count
// $464B00: [8-bit] Arcade - Pac-Mania - Silver Galaxian Flagship Count
// $464B14: [32-bit] Arcade - Pac-Mania - Score
//          Notes:
//          -Consecutive ghost chain: 200 -> 400 -> 800 -> 1600 -> 3200 -> 7650 (Namco's popular number).
//          -Alternatively using a Score-Up Pellet: 400 ->1600 ->7650.
//          -Earn 100,000 score to obtain an extra life (EXTEND!).
// $46D210: [Bit0] Magma Opus - Blue Platform Switch (Between Checkpoint 2 & 3)
// $488EB8: [8-bit] Loaded Slot - Lives (v2.00)
// $488EC0: [Float] Loaded Slot - Health (v2.00)
//          0 = Dead
//          25 = 0 Segments
//          50 = 1 Segment
//          75 = 2 Segments
//          100 = 3 Segments
// $488EC9: [8-bit] Loaded Slot - Total Time - Hours (v2.00)
// $488ECA: [8-bit] Loaded Slot - Total Time - Minutes (v2.00)
// $488ECC: [Float] Loaded Slot - Total Time - Seconds (v2.00)
// $489D54: [Bit0] Pac-Village - Tall Tree Token (v2.00)
// $48A048: [32-bit] Butane Pain - Score (v2.00)
// $48A8C8: [32-bit] Ghost Bayou - Score (v2.00)
// $48A948: [Bit0] Spooky - Level Complete (v2.00)
// $48F094: [8-bit] Level ID (v2.00)
//          0x00 = Pac-Village
//          0x01 = The Bear Basics
//          0x02 = Canyon Chaos
//          0x03 = Pac-Dot Pond
//          0x04 = Blinky's Frog
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
// $495B50: [8-bit] Loaded Slot - Lives
// $495B54: [32-bit] Loaded Slot - Grand Score
// $495B58: [Float] Loaded Slot - Health
//          0 = Dead
//          25 = 0 Segments
//          50 = 1 Segment
//          75 = 2 Segments
//          100 = 3 Segments
// $495B61: [8-bit] Loaded Slot - Total Time - Hours
// $495B62: [8-bit] Loaded Slot - Total Time - Minutes
// $495B64: [Float] Loaded Slot - Total Time - Seconds
// $495B80: [8-bit] Loaded Slot - Total Tokens
//          Notes:
//          -10 Tokens = Pac-Man
//          -30 Tokens = Pac-Attack
//          -60 Token = Jukebox
//          -100 Tokens = Pac-Mania
//          -150 Tokens = Museum
//          -180 Tokens = Ms. Pac-Man
// $496700: [Bit0] The Bear Basics - Level Complete
// $496704: [Float] The Bear Basics - Best Time Trial
// $496708: [32-bit] The Bear Basics - Score
// $49670C: [32-bit] The Bear Basics - High Score
// $49671C: [8-bit] The Bear Basics - Best Cherries
// $49671E: [8-bit] The Bear Basics - Best Strawberries
// $496720: [8-bit] The Bear Basics - Best Oranges
// $496722: [8-bit] The Bear Basics - Best Apples
// $496724: [8-bit] The Bear Basics - Best Melons
// $496740: [Bit0] The Bear Basics - Token
// $496744: [Bit0] The Bear Basics - Token
// $496748: [Bit0] The Bear Basics - Token
// $49674C: [Bit0] The Bear Basics - Token
// $496750: [Bit0] The Bear Basics - Token
// $496754: [Bit0] The Bear Basics - Token
// $496758: [Bit0] The Bear Basics - Token
// $49675C: [Bit0] The Bear Basics - Token
// $496760: [Bit0] The Bear Basics - Collectibles Bonus Token
// $496764: [Bit0] The Bear Basics - Time Trial Bonus Token
// $49676A: [16-bit] The Bear Basics - Best Pac-Dots
// $496770: [8-bit] The Bear Basics - Complete %
//          Note: Tokens are not counted towards this.
// $4969A8: [Bit0] Pac-Village - Level Complete
// $4969B0: [32-bit] Pac-Village - Score
// $4969B4: [32-bit] Pac-Village - High Score
// $4969C4: [8-bit] Pac-Village - Best Cherries
// $4969C6: [8-bit] Pac-Village - Best Strawberries
// $4969CA: [8-bit] Pac-Village - Best Apples
// $4969CC: [8-bit] Pac-Village - Best Melons
// $4969E8: [Bit0] Pac-Village - Token
// $4969EC: [Bit0] Pac-Village - Token
// $4969F0: [Bit0] Pac-Village - Token
// $4969F4: [Bit0] Pac-Village - Token
// $4969F8: [Bit0] Pac-Village - Token
// $4969FC: [Bit0] Pac-Village - Token
// $496A00: [Bit0] Pac-Village - Token
// $496A04: [Bit0] Pac-Village - Token
// $496A08: [Bit0] Pac-Village - Bonus Token
// $496A12: [16-bit] Pac-Village - Best Pac-Dots
// $496A18: [8-bit] Pac-Village - Complete %
//          Note: Tokens are not counted towards this.
// $496A30: [Bit0] Canyon Chaos - Level Complete
// $496A34: [Float] Canyon Chaos - Best Time Trial
// $496A38: [32-bit] Canyon Chaos - Score
// $496A3C: [32-bit] Canyon Chaos - High Score
// $496A4C: [8-bit] Canyon Chaos - Best Cherries
// $496A4E: [8-bit] Canyon Chaos - Best Strawberries
// $496A50: [8-bit] Canyon Chaos - Best Oranges
// $496A52: [8-bit] Canyon Chaos - Best Apples
// $496A54: [8-bit] Canyon Chaos - Best Melons
// $496A56: [8-bit] Canyon Chaos - Best Galaxians
// $496A70: [Bit0] Canyon Chaos  - Token
// $496A74: [Bit0] Canyon Chaos  - Token
// $496A78: [Bit0] Canyon Chaos  - Token
// $496A7C: [Bit0] Canyon Chaos  - Token
// $496A80: [Bit0] Canyon Chaos  - Token
// $496A84: [Bit0] Canyon Chaos - Token
// $496A88: [Bit0] Canyon Chaos  - Token
// $496A8C: [Bit0] Canyon Chaos  - Token
// $496A90: [Bit0] Canyon Chaos - Collectibles Bonus Token
// $496A94: [Bit0] Canyon Chaos - Time Trial Bonus Token
// $496A9A: [16-bit] Canyon Chaos - Best Pac-Dots
// $496AA0: [8-bit] Canyon Chaos - Complete %
//          Note: Tokens are not counted towards this.
// $496AB8: [Bit0] Pac-Dot Pond - Level Complete
// $496ABC: [Float] Pac-Dot Pond - Best Time Trial
// $496AC0: [32-bit] Pac-Dot Pond - Score
// $496AC4: [32-bit] Pac-Dot Pond - High Score
// $496AD4: [8-bit] Pac-Dot Pond - Best Cherries
// $496AD6: [8-bit] Pac-Dot Pond - Best Strawberries
// $496AD8: [8-bit] Pac-Dot Pond - Best Oranges
// $496ADA: [8-bit] Pac-Dot Pond - Best Apples
// $496ADC: [8-bit] Pac-Dot Pond - Best Melons
// $496ADE: [8-bit] Pac-Dot Pond - Best Galaxians
// $496AF8: [Bit0] Pac-Dot Pond - Token
// $496AFC: [Bit0] Pac-Dot Pond - Token
// $496B00: [Bit0] Pac-Dot Pond - Token
// $496B04: [Bit0] Pac-Dot Pond - Token
// $496B08: [Bit0] Pac-Dot Pond - Token
// $496B0C: [Bit0] Pac-Dot Pond - Token
// $496B10: [Bit0] Pac-Dot Pond - Token
// $496B14: [Bit0] Pac-Dot Pond - Token
// $496B18: [Bit0] Pac-Dot Pond - Collectibles Bonus Token
// $496B1C: [Bit0] Pac-Dot Pond - Time Trial Bonus Token
// $496B22: [16-bit] Pac-Dot Pond - Best Pac-Dots
// $496B28: [8-bit] Pac-Dot Pond - Complete %
//          Note: Tokens are not counted towards this.
// $496B40: [Bit0] Blinky's Killer Frog - Level Complete
// $496B48: [32-bit] Blinky's Killer Frog - Score
// $496B4C: [32-bit] Blinky's Killer Frog - High Score
// $496BB0: [8-bit] Blinky's Killer Frog - Complete %
//          Note: Tokens are not counted towards this.
// $496BC8: [Bit0] B-Doing Woods - Level Complete
// $496BCC: [Float] B-Doing Woods - Best Time Trial
// $496BD0: [32-bit] B-Doing Woods - Score
// $496BD4: [32-bit] B-Doing Woods - High Score
// $496BE4: [8-bit] B-Doing Woods - Best Cherries
// $496BE6: [8-bit] B-Doing Woods - Best Strawberries
// $496BE8: [8-bit] B-Doing Woods - Best Oranges
// $496BEA: [8-bit] B-Doing Woods - Best Apples
// $496BEC: [8-bit] B-Doing Woods - Best Melons
// $496BEE: [8-bit] B-Doing Woods - Best Galaxians
// $496C08: [Bit0] B-Doing Woods - Token
// $496C0C: [Bit0] B-Doing Woods - Token
// $496C10: [Bit0] B-Doing Woods - Token
// $496C14: [Bit0] B-Doing Woods - Token
// $496C18: [Bit0] B-Doing Woods - Token
// $496C1C: [Bit0] B-Doing Woods - Token
// $496C20: [Bit0] B-Doing Woods - Token
// $496C24: [Bit0] B-Doing Woods - Token
// $496C28: [Bit0] B-Doing Woods - Cellectibles Bonus Token
// $496C2C: [Bit0] B-Doing Woods - Time Trial Bonus Token
// $496C32: [16-bit] B-Doing Woods - Best Pac-Dots
// $496C38: [8-bit] B-Doing Woods - Complete %
//          Note: Tokens are not counted towards this.
// $496C50: [Bit0] Treewood Forest - Level Complete
// $496C54: [Float] Treewood Forest - Best Time Trial
// $496C58: [32-bit] Treewood Forest - Score
// $496C5C: [32-bit] Treewood Forest - High Score
// $496C6C: [8-bit] Treewood Forest - Best Cherries
// $496C6E: [8-bit] Treewood Forest - Best Strawberries
// $496C70: [8-bit] Treewood Forest - Best Oranges
// $496C72: [8-bit] Treewood Forest - Best Apples
// $496C74: [8-bit] Treewood Forest - Best Melons
// $496C76: [8-bit] Treewood Forest - Best Galaxians
// $496C90: [Bit0] Treewood Forest - Token
// $496C94: [Bit0] Treewood Forest - Token
// $496C98: [Bit0] Treewood Forest - Token
// $496C9C: [Bit0] Treewood Forest - Token
// $496CA0: [Bit0] Treewood Forest - Token
// $496CA4: [Bit0] Treewood Forest - Token
// $496CA8: [Bit0] Treewood Forest - Token
// $496CAC: [Bit0] Treewood Forest - Token
// $496CB0: [Bit0] Treewood Forest - Collectibles Bonus Token
// $496CB4: [Bit0] Treewood Forest - Time Trial Bonus Token
// $496CBA: [16-bit] Treewood Forest - Best Pac-Dots
// $496CC0: [8-bit] Treewood Forest - Complete %
//          Note: Tokens are not counted towards this.
// $496CD8: [Bit0] Butane Pain - Level Complete
// $496CDC: [Float] Butane Pain - Best Time Trial
// $496CE0: [32-bit] Butane Pain - Score
// $496CE4: [32-bit] Butane Pain - High Score
// $496CF4: [8-bit] Butane Pain - Best Cherries
// $496CF6: [8-bit] Butane Pain - Best Strawberries
// $496CF8: [8-bit] Butane Pain - Best Oranges
// $496CFA: [8-bit] Butane Pain - Best Apples
// $496CFC: [8-bit] Butane Pain - Best Melons
// $496CFE: [8-bit] Butane Pain - Best Galaxians
// $496D18: [Bit0] Butane Pain - Token
// $496D1C: [Bit0] Butane Pain - Token
// $496D20: [Bit0] Butane Pain - Token
// $496D24: [Bit0] Butane Pain - Token
// $496D28: [Bit0] Butane Pain - Token
// $496D2C: [Bit0] Butane Pain - Token
// $496D30: [Bit0] Butane Pain - Token
// $496D34: [Bit0] Butane Pain - Token
// $496D38: [Bit0] Butane Pain - Collectibles Bonus Token
// $496D3C: [Bit0] Butane Pain - Time Trial Bonus Token
// $496D42: [16-bit] Butane Pain - Best Pac-Dots
// $496D48: [8-bit] Butane Pain - Complete %
//          Note: Tokens are not counted towards this.
// $496D60: [Bit0] Inky's Blade-O-Matic - Level Complete
// $496D68: [32-bit] Inky's Blade-O-Matic - Score
// $496D6C: [32-bit] Inky's Blade-O-Matic - High Score
// $496DD0: [8-bit] Inky's Blade-O-Matic - Complete %
//          Note: Tokens are not counted towards this.
// $496DE8: [Bit0] Ice River Run - Level Complete
// $496DEC: [Float] Ice River Run - Best Time Trial
// $496DF0: [32-bit] Ice River Run - Score
// $496DF4: [32-bit] Ice River Run - High Score
// $496E04: [8-bit] Ice River Run - Best Cherries
// $496E06: [8-bit] Ice River Run - Best Strawberries
// $496E08: [8-bit] Ice River Run - Best Oranges
// $496E0A: [8-bit] Ice River Run - Best Apples
// $496E0E: [8-bit] Ice River Run - Best Galaxians
// $496E28: [Bit0] Ice River Run - Token
// $496E2C: [Bit0] Ice River Run - Token
// $496E30: [Bit0] Ice River Run - Token
// $496E34: [Bit0] Ice River Run - Token
// $496E38: [Bit0] Ice River Run - Token
// $496E3C: [Bit0] Ice River Run - Token
// $496E40: [Bit0] Ice River Run - Token
// $496E44: [Bit0] Ice River Run - Token
// $496E48: [Bit0] Ice River Run - Collectibles Bonus Token
// $496E4C: [Bit0] Ice River Run - Time Trial Bonus Token
// $496E52: [16-bit] Ice River Run - Best Pac-Dots
// $496E58: [8-bit] Ice River Run - Complete %
//          Note: Tokens are not counted towards this.
// $496E70: [Bit0] Avalanche Alley - Level Complete
// $496E74: [Float] Avalanche Alley - Best Time Trial
// $496E78: [32-bit] Avalanche Alley - Score
// $496E7C: [32-bit] Avalanche Alley - High Score
// $496E8C: [8-bit] Avalanche Alley - Best Cherries
// $496E8E: [8-bit] Avalanche Alley - Best Strawberries
// $496E92: [8-bit] Avalanche Alley - Best Apples
// $496E94: [8-bit] Avalanche Alley - Best Melons
// $496E96: [8-bit] Avalanche Alley - Best Galaxians
// $496EB0: [Bit0] Avalanche Alley - Token
// $496EB4: [Bit0] Avalanche Alley - Token
// $496EB8: [Bit0] Avalanche Alley - Token
// $496EBC: [Bit0] Avalanche Alley - Token
// $496EC0: [Bit0] Avalanche Alley - Token
// $496EC4: [Bit0] Avalanche Alley - Token
// $496EC8: [Bit0] Avalanche Alley - Token
// $496ECC: [Bit0] Avalanche Alley - Token
// $496ED0: [Bit0] Avalanche Alley - Collectibles Bonus Token
// $496ED4: [Bit0] Avalanche Alley - Time Trial Bonus Token
// $496EDA: [16-bit] Avalanche Alley - Best Pac-Dots
// $496EE0: [8-bit] Avalanche Alley - Complete %
//          Note: Tokens are not counted towards this.
// $496EF8: [Bit0] Blade Mountain - Level Complete
// $496EFC: [Float] Blade Mountain - Best Time Trial
// $496F00: [32-bit] Blade Mountain - Score
// $496F04: [32-bit] Blade Mountain - High Score
// $496F14: [Bit0] Blade Mountain - Best Cherries
// $496F16: [Bit0] Blade Mountain - Best Strawberries
// $496F18: [Bit0] Blade Mountain - Best Oranges
// $496F1A: [Bit0] Blade Mountain - Best Apples
// $496F1C: [Bit0] Blade Mountain - Best Melons
// $496F1E: [Bit0] Blade Mountain - Best Galaxians
// $496F38: [Bit0] Blade Mountain - Token
// $496F3C: [Bit0] Blade Mountain - Token
// $496F40: [Bit0] Blade Mountain - Token
// $496F44: [Bit0] Blade Mountain - Token
// $496F48: [Bit0] Blade Mountain - Token
// $496F4C: [Bit0] Blade Mountain - Token
// $496F50: [Bit0] Blade Mountain - Token
// $496F54: [Bit0] Blade Mountain - Token
// $496F58: [Bit0] Blade Mountain - Collectibles Bonus Token
// $496F5C: [Bit0] Blade Mountain - Time Trial Bonus Token
// $496F62: [16-bit] Blade Mountain - Best Pac-Dots
// $496F68: [8-bit] Blade Mountain - Complete %
//          Note: Tokens are not counted towards this.
// $496F80: [Bit0] Pinky's Revenge - Level Complete
// $496F88: [32-bit] Pinky's Revenge - Score
// $496F8C: [32-bit] Pinky's Revenge - High Score
// $496FF0: [8-bit] Pinky's Revenge - Complete %
//          Note: Tokens are not counted towards this.
// $497008: [Bit0] Into the Volcano - Level Complete
// $49700C: [Float] Into the Volcano - Best Time Trial
// $497010: [32-bit] Into the Volcano - Score
// $497014: [32-bit] Into the Volcano - High Score
// $497024: [8-bit] Into the Volcano - Best Cherries
// $497026: [8-bit] Into the Volcano - Best Strawberries
// $497028: [8-bit] Into the Volcano - Best Oranges
// $49702A: [8-bit] Into the Volcano - Best Apples
// $49702C: [8-bit] Into the Volcano - Best Melons
// $49702E: [8-bit] Into the Volcano - Best Galaxians
// $497048: [Bit0] Into the Volcano - Token
// $49704C: [Bit0] Into the Volcano - Token
// $497050: [Bit0] Into the Volcano - Token
// $497054: [Bit0] Into the Volcano - Token
// $497058: [Bit0] Into the Volcano - Token
// $49705C: [Bit0] Into the Volcano - Token
// $497060: [Bit0] Into the Volcano - Token
// $497064: [Bit0] Into the Volcano - Token
// $497068: [Bit0] Into the Volcano - Collectibles Bonus Token
// $49706C: [Bit0] Into the Volcano - Time Trial Bonus Token
// $497072: [16-bit] Into the Volcano - Best Pac-Dots
// $497078: [8-bit] Into the Volcano - Complete %
//          Note: Tokens are not counted towards this.
// $497090: [Bit0] Volcanic Panic - Level Complete
// $497094: [Float] Volcanic Panic - Best Time Trial
// $497098: [32-bit] Volcanic Panic - Score
// $49709C: [32-bit] Volcanic Panic - High Score
// $4970AC: [8-bit] Volcanic Panic - Best Cherries
// $4970AE: [8-bit] Volcanic Panic - Best Strawberries
// $4970B0: [8-bit] Volcanic Panic - Best Oranges
// $4970B2: [8-bit] Volcanic Panic - Best Apples
// $4970B4: [8-bit] Volcanic Panic - Best Melons
// $4970B6: [8-bit] Volcanic Panic - Best Galaxians
// $4970D0: [Bit0] Volcanic Panic - Token
// $4970D4: [Bit0] Volcanic Panic - Token
// $4970D8: [Bit0] Volcanic Panic - Token
// $4970DC: [Bit0] Volcanic Panic - Token
// $4970E0: [Bit0] Volcanic Panic - Token
// $4970E4: [Bit0] Volcanic Panic - Token
// $4970E8: [Bit0] Volcanic Panic - Token
// $4970EC: [Bit0] Volcanic Panic - Token
// $4970F0: [Bit0] Volcanic Panic - Collectibles Bonus Token
// $4970F4: [Bit0] Volcanic Panic - Time Trial Bonus Token
// $4970FA: [16-bit] Volcanic Panic - Best Pac-Dots
// $497100: [8-bit] Volcanic Panic - Complete %
//          Note: Tokens are not counted towards this.
// $497118: [Bit0] Magma Opus - Level Complete
// $49711C: [Float] Magma Opus - Best Time Trial
// $497120: [32-bit] Magma Opus - Score
// $497124: [32-bit] Magma Opus - High Score
// $497134: [8-bit] Magma Opus - Best Cherries
// $497136: [8-bit] Magma Opus - Best Strawberries
// $497138: [8-bit] Magma Opus - Best Oranges
// $49713A: [8-bit] Magma Opus - Best Apples
// $49713C: [8-bit] Magma Opus - Best Melons
// $49713E: [8-bit] Magma Opus - Best Galaxians
// $497158: [Bit0] Magma Opus - Token
// $49715C: [Bit0] Magma Opus - Token
// $497160: [Bit0] Magma Opus - Token
// $497164: [Bit0] Magma Opus - Token
// $497168: [Bit0] Magma Opus - Token
// $49716C: [Bit0] Magma Opus - Token
// $497170: [Bit0] Magma Opus - Token
// $497174: [Bit0] Magma Opus - Token
// $497178: [Bit0] Magma Opus - Collectibles Bonus Token
// $49717C: [Bit0] Magma Opus - Time Trial Bonus Token
// $497182: [16-bit] Magma Opus - Best Pac-Dots
// $497188: [8-bit] Magma Opus - Complete %
//          Note: Tokens are not counted towards this.
// $4971A0: [Bit0] Clyde in the Caldera - Level Complete
// $4971A8: [32-bit] Clyde in the Caldera - Score
// $4971AC: [32-bit] Clyde in the Caldera - High Score
// $497210: [8-bit] Clyde in the Caldera - Complete %
//          Note: Tokens are not counted towards this.
// $497228: [Bit0] Scuba Duba - Level Complete
// $49722C: [Float] Scuba Duba - Best Time Trial
// $497230: [32-bit] Scuba Duba - Score
// $497234: [32-bit] Scuba Duba - High Score
// $497244: [8-bit] - Scuba Duba - Best Cherries
// $497246: [8-bit] - Scuba Duba - Best Strawberries
// $497248: [8-bit] - Scuba Duba - Best Oranges
// $49724A: [8-bit] - Scuba Duba - Best Apples
// $49724C: [8-bit] - Scuba Duba - Best Melons
// $49724E: [8-bit] - Scuba Duba - Best Galaxians
// $497268: [Bit0] Scuba Duba - Token
// $49726C: [Bit0] Scuba Duba - Token
// $497270: [Bit0] Scuba Duba - Token
// $497274: [Bit0] Scuba Duba - Token
// $497278: [Bit0] Scuba Duba - Token
// $49727C: [Bit0] Scuba Duba - Token
// $497280: [Bit0] Scuba Duba - Token
// $497284: [Bit0] Scuba Duba - Token
// $497288: [Bit0] Scuba Duba - Collectibles Bonus Token
// $49728C: [Bit0] Scuba Duba - Time Trial Bonus Token
// $497292: [16-bit] Scuba Duba - Best Pac-Dots
// $497298: [8-bit] Scuba Duba - Complete %
//          Note: Tokens are not counted towards this.
// $4972B0: [Bit0] Shark Attack - Level Complete
// $4972B4: [Float] Shark Attack - Best Time Trial
// $4972B8: [32-bit] Shark Attack - Score
// $4972BC: [32-bit] Shark Attack - High Score
// $4972CC: [8-bit] Shark Attack - Best Cherries
// $4972CE: [8-bit] Shark Attack - Best Strawberries
// $4972D0: [8-bit] Shark Attack - Best Oranges
// $4972D2: [8-bit] Shark Attack - Best Apples
// $4972D4: [8-bit] Shark Attack - Best Melons
// $4972D6: [8-bit] Shark Attack - Best Galaxians
// $49731A: [16-bit] Shark Attack - Best Pac-Dots
// $497320: [8-bit] Shark Attack - Complete %
//          Note: Tokens are not counted towards this.
// $497338: [Bit0] Yellow Pac-Marine - Level Complete
// $49733C: [Float] Yellow Pac-Marine - Best Time Trial
// $497340: [32-bit] Yellow Pac-Marine - Score
// $497344: [32-bit] Yellow Pac-Marine - High Score
// $497354: [8-bit] Yellow Pac-Marine - Best Cherries
// $497358: [8-bit] Yellow Pac-Marine - Best Oranges
// $49735A: [8-bit] Yellow Pac-Marine - Best Apples
// $497378: [Bit0] Yellow Pac-Marine - Token
// $49737C: [Bit0] Yellow Pac-Marine - Token
// $497380: [Bit0] Yellow Pac-Marine - Token
// $497384: [Bit0] Yellow Pac-Marine - Token
// $497388: [Bit0] Yellow Pac-Marine - Token
// $49738C: [Bit0] Yellow Pac-Marine - Token
// $497390: [Bit0] Yellow Pac-Marine - Token
// $497394: [Bit0] Yellow Pac-Marine - Token
// $497398: [Bit0] Yellow Pac-Marine - Collectibles Bonus Token
// $49739C: [Bit0] Yellow Pac-Marine - Time Trial Bonus Token
// $4973A8: [8-bit] Yellow Pac-Marine - Complete %
//          Note: Tokens are not counted towards this.
// $4973C0: [Bit0] Whale on a Sub - Level Complete
// $4973C8: [32-bit] Whale on a Sub - Score
// $4973CC: [32-bit] Whale on a Sub - High Score
// $497430: [8-bit] Whale on a Sub - Complete %
//          Note: Tokens are not counted towards this.
// $49744C: [Float] Haunted Boardwalk - Best Time Trial
// $497450: [32-bit] Haunted Boardwalk - Score
// $497454: [32-bit] Haunted Boardwalk - High Score
// $497464: [8-bit] Haunted Boardwalk - Best Cherries
// $497466: [8-bit] Haunted Boardwalk - Best Strawberries
// $497468: [8-bit] Haunted Boardwalk - Best Oranges
// $49746A: [8-bit] Haunted Boardwalk - Best Apples
// $49746C: [8-bit] Haunted Boardwalk - Best Melons
// $49746E: [8-bit] Haunted Boardwalk - Best Galaxians
// $497488: [Bit0] Haunted Boardwalk - Token
// $49748C: [Bit0] Haunted Boardwalk - Token
// $497490: [Bit0] Haunted Boardwalk - Token
// $497494: [Bit0] Haunted Boardwalk - Token
// $497498: [Bit0] Haunted Boardwalk - Token
// $49749C: [Bit0] Haunted Boardwalk - Token
// $4974A0: [Bit0] Haunted Boardwalk - Token
// $4974A4: [Bit0] Haunted Boardwalk - Token
// $4974A8: [Bit0] Haunted Boardwalk - Collectibles Bonus Token
// $4974AC: [Bit0] Haunted Boardwalk - Time Trial Bonus Token
// $4974B2: [16-bit] Haunted Boardwalk - Best Pac-Dots
// $4974B8: [8-bit] Haunted Boardwalk - Complete %
//          Note: Tokens are not counted towards this.
// $4974D0: [Bit0] Night Crawling - Level Complete
// $4974D4: [Float] Night Crawling - Best Time Trial
// $4974D8: [32-bit] Night Crawling - Score
// $4974DC: [32-bit] Night Crawling - High Score
// $4974EC: [8-bit] Night Crawling - Best Cherries
// $4974EE: [8-bit] Night Crawling - Best Strawberries
// $4974F0: [8-bit] Night Crawling - Best Oranges
// $4974F2: [8-bit] Night Crawling - Best Apples
// $4974F4: [8-bit] Night Crawling - Best Melons
// $497510: [Bit0] Night Crawling - Token
// $497514: [Bit0] Night Crawling - Token
// $497518: [Bit0] Night Crawling - Token
// $49751C: [Bit0] Night Crawling - Token
// $497520: [Bit0] Night Crawling - Token
// $497524: [Bit0] Night Crawling - Token
// $497528: [Bit0] Night Crawling - Token
// $49752C: [Bit0] Night Crawling - Token
// $497530: [Bit0] Night Crawling - Collectibles Bonus Token
// $497534: [Bit0] Night Crawling - Time Trial Bonus Token
// $49753A: [16-bit] Night Crawling - Best Pac-Dots
// $497540: [8-bit] Night Crawling - Complete %
//          Note: Tokens are not counted towards this.
// $497558: [Bit0] Ghost Bayou - Level Complete
// $49755C: [Float] Ghost Bayou - Best Time Trial
// $497560: [32-bit] Ghost Bayou - Score
// $497564: [32-bit] Ghost Bayou - High Score
// $497574: [8-bit] Ghost Bayou - Best Cherries
// $497576: [8-bit] Ghost Bayou - Best Strawberries
// $49757A: [8-bit] Ghost Bayou - Best Apples
// $49757C: [8-bit] Ghost Bayou - Best Melons
// $49757E: [8-bit] Ghost Bayou - Best Galaxians
// $497598: [Bit0] Ghost Bayou - Token
// $49759C: [Bit0] Ghost Bayou - Token
// $4975A0: [Bit0] Ghost Bayou - Token
// $4975A4: [Bit0] Ghost Bayou - Token
// $4975A8: [Bit0] Ghost Bayou - Token
// $4975AC: [Bit0] Ghost Bayou - Token
// $4975B0: [Bit0] Ghost Bayou - Token
// $4975B4: [Bit0] Ghost Bayou - Token
// $4975B8: [Bit0] Ghost Bayou - Collectibles Bonus Token
// $4975BC: [Bit0] Ghost Bayou - Time Trial Bonus Token
// $4975C2: [16-bit] Ghost Bayou - Best Pac-Dots
// $4975C8: [8-bit] Ghost Bayou - Complete %
//          Note: Tokens are not counted towards this.
// $4975E0: [Bit0] Spooky - Level Complete
// $4975E8: [32-bit] Spooky - Score
// $4975EC: [32-bit] Spooky - High Score
// $497650: [8-bit] Spooky - Complete %
// $497760: [32-bit] Arcade - Pac-Attack - Rank 1 Score
//          Default = 0x186a0 (100,000)
//          Note: Held by "Mayumi".
// $497764: [16-bit] Arcade - Pac-Attack - Rank 1 Level
//          Default = 0x46 (70)
//          Note: Held by "Mayumi".
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
// $57E35C: [32-bit] Arcade - Pac-Attack - Player Detection
//          0 = 1 Player (Start of Game)
//          0xffffffe0 = 2 Players (Start of Game)
// $57E378: [16-bit] Arcade - Pac-Attack Level
//          Notes:
//          -Beginner starts at 0.
//          -Novice starts at 0x0a (10).
//          -Standard starts at 0x28 (40).
//          -Veteran starts at 0x64 (100).
//          -Godhand? starts at 0x384 (900) (hold right and select Veteran).
// $57E3A0: [Bit0] Arcade - Pac-Attack - Game Over
//          1 = True
// $57E3AC: [8-bit] Arcade - Pac-Attack - Fairy Meter
// $57E3C0: [8-bit] Arcade - Pac-Attack - Floored Fairy Count (Bottom Number)
// $57E3F4: [Bit0] Arcade - Pac-Attack - Playing
//          0 = Select Screen, Demo Mode
//          1 = Actually Playing
// $57E41C: [32-bit] Arcade - Pac-Attack - Score
// $57E448: [8-bit] Arcade - Pac-Attack - Best Ghost Chain (Top Number)
// $57E44E: [8-bit] Arcade - Pac-Attack - Best Line Clear (Middle Number)
// $5A69F0: [24-bit] Object Pointer (v2.00)
//          +0x31 = [Bit0] Pac-Village - Tall Tree Token
//          +0x8b = [Bit0] The Bear Basics - Crate in Right Side of Lake
// $5A6A0C: [8-bit] Checkpoint (v2.00)
//          0 = Start of Level
//          2 = Pre B-Doing Woods Skip
//          3 = Post B-Doing Woods Skip
//          6 = Whale on a Sub 1
// $5A8398: Animation ID (8-bit) (v2.00)
//          0x00 = Talking with NPC
//          0x01 = Running
//          0x02 = Walk
//          0x03 = Moving Jump
//          0x04 = 2-Step (Idle)
//          0x05 = Stationary Butt Bounce
//          0x06 = Rev Rolling
//          0x09 = Tip-Toeing
//          0x0a = Stationary Jump
//          0x[0e,30] = Hanging on Ledge
//          0x10 = Swimming
//          0x11 = Hanging on Ledge (Idle)
//          0x14 = Treading in Water
//          0x15 = Jumping Up Out of Water
//          0x16 = Took Damage
//          0x19 = Standing (Idle)
//          0x1a = Stretching (Idle)
//          0x1b = Slowing Down
//          0x13 = Gliding on Ice
//          0x22 = Falling
//          0x26 = Red Pac-Dot Chain
//          0x27 = Moving Butt Bounce
//          0x28 = Charging Rev Roll
//          0x2b = Landing
//          0x2d = Looking Around (Idle)
//          0x2f = Mid-Air Kick
//          0x33 = Slamming on Ground from Fall
//          0x35 = Slipping on Ice
//          0x39 = Crushed by Avalanche
//          0x3b = Kicking a Pac-Dot (Idle)
//          0x3d = Preparing for Sleep
//          0x3e = Sleeping (Idle)
// $5A872C: [Float] Time Trial Timer (v2.00)
// $5A9438: [Lower4] Power-Ups (v2.00)
//          1 = Steel Ball
//          2 = Shrink Pellet
// $5A945C: [24-bit] Spooky Pointer (v2.00)
//          +0x377c = [Lower4] Phase
//          0 = Start
//          1 = Second Phase
//          2 = Final Phase
//          Notes:
//          -Spooky has these coordinates during a phase shift cutscene: (0.0, 0.0, -0.557057) (X,Y,Z).
//          -This is unstable during death/load. Use stored hits.
// $5A9CFC: [16-bit] Sub-Level ID (v2.00)
//          Misc.
//          0x384c = Overworld
//          Levels
//          0x366d = Loading Pac-Village
//          0x367f = Pac-Village
//          0x35ed = Loading Restored Pac-Village
//          0x35ff = Restored Pac-Village
//          0x388d = Loading The Bear Basics
//          0x389f = The Bear Basics
//          0x37fc = Loading Canyon Chaos
//          0x380e = Canyon Chaos
//          0x37fd = Loading Pac-Dot Pond
//          0x380f = Pac-Dot Pond
//          0x37bc = Loading Blinky's Frog
//          0x3852 = Blinky's Frog
//          0x38d8 = Loading B-Doing Woods
//          0x38ea = B-Doing Woods
//          0x3461 = Loading Treewood Forest
//          0x3473 = Treewood Forest
//          0x36cb = Loading Butane Pain
//          0x36dd = Butane Pain
//          0x33dc = Loading Inky's Blade-o-Matic
//          0x34ee = Inky's Blade-o-Matic
//          0x3484 = Loading Ice River Run
//          0x3496 = Ice River Run
//          0x35c6 = Loading Avalanche Alley
//          0x35d8 = Avalanche Alley
//          0x35ae = Loading Blade Mountain
//          0x35c0 = Blade Mountain
//          0x34ca = Loading Pinky's Revenge
//          0x34dc = Pinky's Revenge
//          0x3555 = Loading Into the Volcano
//          0x3567 = Into the Volcano
//          0x38df = Loading Volcanic Panic
//          0x38f1 = Volcanic Panic
//          0x36b9 = Loading Magma Opus
//          0x36cb = Magma Opus
//          0x30c2 = Loading Clyde in the Caldera
//          0x30d4 = Clyde in the Caldera
//          0x3d0d = Loading Scuba Duba
//          0x3d1f = Scuba Duba
//          0x3ebb = Loading Shark Attack
//          0x3ecd = Shark Attack
//          0x2ca7 = Loading Yellow Pac-Marine
//          0x3279 = Yellow Pac-Marine
//          0x3497 = Loading Whale on a Sub
//          0x398d = Whale on a Sub
//          0x318b = Loading Haunted Boardwalk
//          0x319d = Haunted Boardwalk
//          0x3aa5 = Loading Night Crawling
//          0x3ab7 = Night Crawling
//          0x35ee = Loading Ghost Bayou
//          0x3600 = Ghost Bayou
//          0x32a8 = Loading Spooky
//          0x34b4 = Spooky
//          0x2766 = Quit Spooky, Defeated Spooky
//          Arcade
//          0x30b2 = Inside Arcade
// $5AADB0: [16-bit] Cutscene Timer (v2.00)
//          Note: Resets to 0 and then counts up until the cutscene is done.
// $5B7400: [24-bit] Fruit/Crate Pointer
//          +0x2a = [Bit0] Pac-Village - Blue Roof Melon
//          +0x84 = [Bit0] The Bear Basics - Lake Strawberry
//          +0x8b = [Bit0] The Bear Basics - Crate in Right Side of Lake
//          +0x44 = [Bit0] Canyon Chaos - Red RGB
//          +0x58 = [Bit0] Canyon Chaos - Green RGB
//          +0x5a = [Bit0] Canyon Chaos - Blue RGB
//          +0x[6d,6e,6f,70,71,72,73,77,7b,7f,80,81,82,83,84] = [Bit0]  B-Doing Woods - 15 Fruits in Trampoline Section
// $5B741C: [8-bit] Checkpoint
//          0 = Start of Level
//          1 = Ghost Bayou 1
//          3 = Ghost Bayou - Skeletal Minion Army
//          4 = B-Doing Woods - After 15-Fruit Trampoline Section
//          5 = Magma Opus 2, Whale on a Sub 2
//          6 = Magma Opus 3, Whale on a Sub 1
//          0xd = Magma Opus - Top of Slide
// $5B8638: [Float] Galaxian Maze Score
// $5B8A50: [8-bit] Pac-Village - Museum Concept Art Slideshow
//          1 = First Screen
//          0x1d = Second to Last Screen
//          0 = Last Screen (A Picture of the Team)
// $5B8CB8: [32-bit] Level Data Pointer
//          0x7bd800 = Title Screen
//          0x7bd300 = Load Game Screen
//          0x7a3a00 = Loading Screen
//          0x7d9d80 = Pac-Village
//          0x7be980 = Arcade
//          0x7de080 = Overworld
//          0x7e1c80 = The Bear Basics
//          0x7da780 = Canyon Chaos
//          0x7cfc00 = Canyon Chaos Galaxian Maze
//          0x7da200 = Pac-Dot Pond
//          0x7c6c80 = Pac-Dot Pond Galaxian Maze
//          0x7d1880 = Blinky's Killer Frog
//          0x7e5580 = B-Doing Woods
//          0x7cc500 = B-Doing Woods Galaxian Maze
//          0x7ef900 = Treewood Forest
//          0x7c1c00 = Treewood Forest Galaxian Maze
//          0x7fc200 = Butane Pain
//          0x7ca100 = Butane Pain Galaxian Maze
//          0x7c8980 = Inky's Blade-o-Matic
//          0x7c0f00 = Ice River Run - Intro Cutscene
//          0x7f1280 = Ice River Run
//          0x7bf800 = Ice River Run Galaxian Maze
//          0x7f2f80 = Avalanche Alley
//          0x7bee80 = Avalanche Alley Galaxian Maze
//          0x7f2380 = Blade Mountain
//          0x7c0700 = Blade Mountain Galaxian Maze
//          0x7da800 = Pinky's Revenge
//          0x7e1000 = Into the Volcano
//          0x7bfc80 = Into the Volcano Galaxian Maze
//          0x7da180 = Volcanic Panic
//          0x7be580 = Volcanic Panic Galaxian Maze
//          0x7dfd80 = Magma Opus
//          0x7bdb80 = Magma Opus Galaxian Maze
//          0x7ca380 = Clyde in the Caldera
//          0x839a80 = Scuba Duba
//          0x7c0500 = Scuba Duba Galaxian Maze
//          0x829d00 = Shark Attack
//          0x7c1e00 = Shark Attack Galaxian Maze
//          0x7c4480 = Yellow Pac-Marine, Whale on a Sub
//          0x80ba80 = Haunted Boardwalk
//          0x7d2900 = Haunted Boardwalk Galaxian Maze
//          0x7fc780 = Night Crawling
//          0x827480 = Ghost Bayou
//          0x7d6900 = Ghost Bayou Galaxian Maze
//          0x7bfa00 = Spooky
//          0x7bff80 = Spooky (Die & Respawn)
// $5B8D7C: Animation ID (8-bit)
//          0x00 = Talking with NPC
//          0x01 = Running
//          0x02 = Walk
//          0x03 = Moving Jump
//          0x04 = 2-Step (Idle)
//          0x05 = Stationary Butt Bounce
//          0x06 = Rev Rolling
//          0x09 = Tip-Toeing
//          0x0a = Stationary Jump
//          0x[0e,30] = Hanging on Ledge
//          0x10 = Swimming
//          0x11 = Hanging on Ledge (Idle)
//          0x14 = Treading in Water
//          0x15 = Jumping Up Out of Water
//          0x16 = Took Damage
//          0x19 = Standing (Idle)
//          0x1a = Stretching (Idle)
//          0x1b = Slowing Down
//          0x13 = Gliding on Ice
//          0x22 = Falling
//          0x26 = Red Pac-Dot Chain
//          0x27 = Moving Butt Bounce
//          0x28 = Charging Rev Roll
//          0x2b = Landing
//          0x2d = Looking Around (Idle)
//          0x2f = Mid-Air Kick
//          0x33 = Slamming on Ground from Fall
//          0x35 = Slipping on Ice
//          0x39 = Crushed by Avalanche
//          0x3b = Kicking a Pac-Dot (Idle)
//          0x3d = Preparing for Sleep
//          0x3e = Sleeping (Idle)
// $5B90FC: [32-bit] Idle Timer
//          Note: Idle animations start at 0x12c. Sleep starts at 0x290d.
// $5B9114: [Float] Time Trial Timer
// $5B9624: [24-bit] Arcade - Pac-Mania Pointer
//          +0x41 = [8-bit] Pac-Man - Bounce
//          0 = Not Bouncing
//          Else = Bouncing
//          +0x600 = [16-bit] Game State
//          0x1717 = Playing
//          0x1818 = Right Before Completing a Round
//          0x1919 = Completed Round
//          +0x612 = [Bit0] Players
//          0 = 1 Player
//          1 = 2 Player
//          +0x621 = [Lower4] Lives
//          +0x623 = [8-bit] Round
//          1 = Block Town Introduction
//          3 = Pac-Man's Park Introduction
//          6 = Sandbox Land Introduction
//          9 = Jungly Steps Introduction
//          0x0c = Nice Going! The Show's Gonna Go On!
//          0x17 = The Last Round
//          0x18 = Credits (Congratulations! ...To Be Continued)
//          +0x4100 = [8-bit] Bonus Item Spawn
//          0x0a = Speed-Up Pellet (Green)
//          0x0b = Score-Up Pellet (Pink)
//          0x0d = Cherry
//          0x0e = Strawberry
//          0x0f = Orange
//          0x10 = Red Apple
//          0x11 = Bananas
//          0x12 = Peach
//          0x13 = Bell
//          0x14 = Key
//          0x15 = Galaxian Flagship
//          0x16 = Silver Galaxian Flagship
//          0x17 = Silver Bell
//          0x18 = Silver Key
//          0x19 = Green Apple
//          0x1a = Hamburger
//          0x1b = Coffee
//          0x1c = Vanilla Ice Cream
//          0x1d = Chocolate Ice Cream
//          0x1e = Candy
//          0xff = Nothing
//          +0x41a0 = [8-bit] Pac-Man
//          0 = Alive
//          0x0c = Dying
//          0xff = Dead
//          +0x41a7 = [8-bit] Pac-Man - Bounce
//          0 = Not Bouncing
//          Else = Bouncing
// $5B9E10: [Lower4] Power-Ups
//          1 = Steel Ball
//          2 = Shrink Pellet
// $5B9E88: [Bit0] Pause Menu
// $5B9F50: [16-bit] Current Pac-Dots
// $5BA764: [16-bit] Sub-Level ID
//          Misc.
//          0x2ccd = Title Screen, Credits
//          0x2799 = Load Game Screen
//          0x2f58 = General Loading Screen
//          0x3607 = Overworld
//          Levels
//          0x3428 = Loading Pac-Village
//          0x343a = Pac-Village
//          0x33a8 = Loading Restored Pac-Village
//          0x33ba = Restored Pac-Village
//          0x3648 = Loading The Bear Basics
//          0x365a = The Bear Basics
//          0x35b7 = Loading Canyon Chaos
//          0x35c9 = Canyon Chaos
//          0x35b8 = Loading Pac-Dot Pond
//          0x35ca = Pac-Dot Pond
//          0x35fb = Loading Blinky's Killer Frog
//          0x360d = Blinky's Killer Frog
//          0x3693 = Loading B-Doing Woods
//          0x36a5 = B-Doing Woods
//          0x321c = Loading Treewood Forest
//          0x322e = Treewood Forest
//          0x3486 = Loading Butane Pain
//          0x3498 = Butane Pain
//          0x3297 = Loading Inky's Blade-o-Matic
//          0x32a9 = Inky's Blade-o-Matic
//          0x323f = Loading Ice River Run
//          0x3251 = Ice River Run
//          0x3381 = Loading Avalanche Alley
//          0x3393 = Avalanche Alley
//          0x32e9 = Loading Blade Mountain
//          0x32fb = Blade Mountain
//          0x3285 = Loading Pinky's Revenge
//          0x3297 = Pinky's Revenge
//          0x3310 = Loading Into the Volcano
//          0x3322 = Into the Volcano
//          0x369a = Loading Volcanic Panic
//          0x36ac = Volcanic Panic
//          0x3474 = Loading Magma Opus
//          0x3486 = Magma Opus
//          0x2e7d = Loading Clyde in the Caldera
//          0x2e8f = Clyde in the Caldera
//          0x3ac8 = Loading Scuba Duba
//          0x3ada = Scuba Duba
//          0x3c76 = Loading Shark Attack
//          0x3c88 = Shark Attack
//          0x3022 = Loading Yellow Pac-Marine
//          0x3034 = Yellow Pac-Marine
//          0x3736 = Loading Whale on a Sub
//          0x3748 = Whale on a Sub
//          0x30e4 = Loading Haunted Boardwalk
//          0x30f6 = Haunted Boardwalk
//          0x3860 = Loading Night Crawling
//          0x3872 = Night Crawling
//          0x3557 = Loading Ghost Bayou
//          0x3569 = Ghost Bayou
//          0x325d = Loading Spooky
//          0x326f = Spooky
//          0x2521 = Quit Spooky, Defeated Spooky
//          Arcade
//          0x2e6d = Inside Arcade
//          0x3073 = Pac-Man
//          0x[3603,368a,3718,371b,379d,370c] = Pac-Attack (use Misc ID instead)
//          0x[3a39,3a59,etc...] = Pac-Mania (use Misc ID instead)
//          0x318b = Ms. Pac-Man
//          Galaxian Mazes
//          0x34b3 = Canyon Chaos
//          0x30a1 = Pac-Dot Pond
//          0x3761 = B-Doing Woods
//          0x2cb7 = Treewood Forest
//          0x30ab = Butane Pain
//          0x2bf3 = Ice River Run
//          0x29db = Avalanche Alley
//          0x299d = Blade Mountain
//          0x2cdb = Into the Volcano
//          0x2c1b = Volcanic Panic
//          0x28b3 = Magma Opus
//          0x2c23 = Scuba Duba
//          0x2bd6 = Shark Attack
//          0x2d58 = Haunted Boardwalk
//          0x2f58 = Ghost Bayou
// $5BB2B4: [Bit0] Pac-Dot Chain
//          1 = Active
// $5BB588: [Lower4] Galaxian Maze Lives
// $5BB658: [Lower4] Arcade - Ms. Pac-Man - Players
//          1 = 1 Player
//          2 = 2 Players
// $5BB690: [8-bit] Arcade Ms. Pac-Man - Lives
//          3 = Start of Game
//          0xff = Game Over
// $5BB6A8: [32-bit] Arcade - Ms. Pac-Man - High Score
//          Note: Multiply by 10 to get the actual score.
// $5BB774: [32-bit] Arcade - Ms. Pac-Man - Demo
//          0 = Demo
//          0xffffffff = Playing
// $5BB818: [Lower4] Arcade - Pac-Man - Players
//          1 = 1 Player
//          2 = 2 Player
// $5BB840: [8-bit] Arcade - Pac-Man - Lives
//          3 = Start of Game
//          0xff = Game Over
// $5BB878: [32-bit] Arcade - Pac-Man - Score
//          Notes:
//          -Multiply by 10 to get the actual score.
//          -Consecutive ghost chain: 200 -> 400 -> 800 -> 1600.
//          -Earn 10,000 score to obtain an extra life.
// $5BB880: [32-bit] Arcade - Pac-Man - High Score
//          Note: Multiply by 10 to get the actual high score.
// $5BB918: [32-bit] Arcade - Pac-Man - Demo
//          0 = Demo
//          0xffffffff = Playing
// $5C9060: [16-bit] Galaxian Maze State
//          0 = Completed
//          52 = Maze Over
// $5CA3E0: [8-bit] Arcade - Ms. Pac-Man - Round
//          1-2 = Start of Game
//          3-5 = Act I
//          6-9 = Act II
//          0x[0a-0d] = Act III
//          0x0e = Act III
// $5CAB48: [8-bit] Arcade - Ms. Pac-Man - Death Count
// $5CAB62: [8-bit] Arcade - Ms. Pac-Man - Cherry Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5CAB64: [8-bit] Arcade - Ms. Pac-Man - Strawberry Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5CAB66: [8-bit] Arcade - Ms. Pac-Man - Orange Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5CAB68: [8-bit] Arcade - Ms. Pac-Man - Pretzel Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5CAB6A: [8-bit] Arcade - Ms. Pac-Man - Apple Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5CAB6C: [8-bit] Arcade - Ms. Pac-Man - Pear Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5CAB6E: [8-bit] Arcade - Ms. Pac-Man - Banana Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5CADC8: [32-bit] Arcade - Ms. Pac-Man - Score
//          Notes:
//          -Multiply by 10 to get the actual score.
//          -Consecutive ghost chain: 200 -> 400 -> 800 -> 1600.
//          -Earn 10,000 score to obtain an extra life.
// $5CAE28: [32-bit] Arcade - Ms. Pac-Man - Ghost 1
//          0 = Vulnerable
//          Note: Freeze to 0x00000000 to set as permanently vulnerable.
// $5CAE54: [32-bit] Arcade - Ms. Pac-Man - Ghost 2
//          0 = Vulnerable
//          Note: Freeze to 0x00000000 to set as permanently vulnerable.
// $5CAE80: [32-bit] Arcade - Ms. Pac-Man - Ghost 3
//          0 = Vulnerable
//          Note: Freeze to 0x00000000 to set as permanently vulnerable.
// $5CAEAC: [32-bit] Arcade - Ms. Pac-Man - Ghost 4
//          0 = Vulnerable
//          Note: Freeze to 0x00000000 to set as permanently vulnerable.
// $5D2FDB: [8-bit] Arcade - Ms. Pac-Man - Blinky
//          0 = Normal
//          0x28 = Eaten
//          0x40 = Retuning to Spawn
//          0x50 = Vulnerable
//          0x60 = Phasing out of Vulnerability
// $5D300B: [8-bit] Arcade - Ms. Pac-Man - Pinky
//          0x20 = Normal
//          0x28 = Eaten
//          0x40 = Retuning to Spawn
//          0x50 = Vulnerable
//          0x60 = Phasing out of Vulnerability
// $5D303B: [8-bit] Arcade - Ms. Pac-Man - Inky
//          0x10 = Normal
//          0x28 = Eaten
//          0x40 = Retuning to Spawn
//          0x50 = Vulnerable
//          0x60 = Phasing out of Vulnerability
// $5D306B: [8-bit] Arcade - Ms. Pac-Man - Sue
//          0x30 = Normal
//          0x28 = Eaten
//          0x40 = Retuning to Spawn
//          0x50 = Vulnerable
//          0x60 = Phasing out of Vulnerability
// $5D3C10: [8-bit] Arcade - Pac-Man - Round
//          1-2 = Start of Game
//          3-5 = Intermission I
//          6-9 = Intermission II
//          0x[0a-0d] = Intermission III
//          0x0e = Intermission III
// $5D441E: [8-bit] Arcade - Pac-Man - Cherry Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5D4420: [8-bit] Arcade - Pac-Man - Strawberry Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5D4422: [8-bit] Arcade - Pac-Man - Orange Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5D4424: [8-bit] Arcade - Pac-Man - Apple Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5D4426: [8-bit] Arcade - Pac-Man - Melon Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5D4428: [8-bit] Arcade - Pac-Man - Galaxian Flagship Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5D442A: [8-bit] Arcade - Pac-Man - Bell Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5D442C: [8-bit] Arcade - Pac-Man - Key Counter
//          Note: This does not reset when exiting the arcade game. You must use a delta counter.
// $5ED488: [32-bit] Arcade - Pac-Man - Ghost 1
//          Note: Freeze to 0x00000000 to set as permanently vulnerable.
// $5ED4B4: [32-bit] Arcade - Pac-Man - Ghost 2
//          Note: Freeze to 0x00000000 to set as permanently vulnerable.
// $5ED4E0: [32-bit] Arcade - Pac-Man - Ghost 3
//          Note: Freeze to 0x00000000 to set as permanently vulnerable.
// $5ED50C: [32-bit] Arcade - Pac-Man - Ghost 4
//          Note: Freeze to 0x00000000 to set as permanently vulnerable.
// $5F7552: [8-bit] Pac-Mania - Power Type Active
//          0xff = Not Power Active
//          Else = Power Active
// $5F8D70: [8-bit] Current Cherries
//          Note: This value is 0xff when not in a level with fruit.
// $5F8D74: [8-bit] Current Strawberries
//          Note: This value is 0xff when not in a level with fruit.
// $5F8D78: [8-bit] Current Oranges
//          Note: This value is 0xff when not in a level with fruit.
// $5F8D7C: [8-bit] Current Apples
//          Note: This value is 0xff when not in a level with fruit.
// $5F8D80: [8-bit] Current Melons
//          Note: This value is 0xff when not in a level with fruit.
// $5F8D84: [8-bit] Current Galaxians
//          Note: This value is 0xff when not in a level with fruit.
// $7D8ED4: [Float] Pac-Village Speed (v2.00)
// $7D9E70: [Float] Pac-Village  - Pac-Man Speed
// $7EA22C: [Float] Number of Hits on Inky (v2.00)
//          2 = Phase 2
//          4 = Phase 3
//          6 = Dead
// $7EEAFC: [Lower4] Spooky - Phase
//          0 = Start
//          1 = Second Phase
//          2 = Final Phase
//          Note: Spooky has these coordinates during a phase shift cutscene: (0.0, 0.0, -0.557057) (X,Y,Z)
// $7EF978: [8-bit] Number of Hits on Blinky (v2.00)
//          3 = Phase 2
//          6 = Dead
//          0x65 = Overworld
//          Note: This is unstable during death/load. Use stored hits.
// $7F2470: [Float] Blade Mountain - Pac-Man Speed
// $7F3070: [Float] Avalanche Alley - Pac-Man Speed
// $7F56AC: [Float] Number of Hits on Pinky (v2.00)
//          2 = Phase 2
//          4 = Phase 3
//          7 = Phase 4
//          10 = Dead
// $7FAFAC: [Float] Number of Hits on Inky
//          2 = Phase 2
//          4 = Phase 3
//          6 = Dead
// $8003F8: [8-bit] Number of Hits on Blinky
//          3 = Phase 2
//          6 = Dead
//          0x25 = Overworld
// $80642C: [Float] Number of Hits on Pinky
//          2 = Phase 2
//          4 = Phase 3
//          7 = Phase 4
//          10 = Dead
// $808A2C: [Float] Number of Hits on Clyde (v2.00)
//          2 = Phase 2
//          4 = Phase 3
//          6 = Phase 4
//          8 = Phase 5
//          10 = Dead
// $81A22C: [Float] Number of Hits on Clyde
//          2 = Phase 2
//          4 = Phase 3
//          6 = Phase 4
//          8 = Phase 5
//          10 = Dead
// $829DF0: [Float] Shark Attack Speed
// $85E208: [Bit0] The Bear Basics - "Pac-Bear" Sign
// $87F568: [Float] Ghost Bayou - Sands of Time Counter
// $87F56C: [8-bit] Ghost Bayou - Skeletal Minion Count
// $87FC68: [Float] Ghost Bayou - Sands of Time Counter (Alt)
//          Note: Not sure what causes it to change to this instead of the previous location.
// $87FC6C: [8-bit] Ghost Bayou - Skeletal Minion Count (Alt)
//          Note: Not sure what causes it to change to this instead of the previous location.
// $88D36C: [Bit0] Ghost Bayou - Green Fence Switch
// $1FFFB34: [Bit0] Exit/Die In Level (v1.00+v2.00)
//           Notes:
//           -Flips to 1 for a moment when the player selects "Exit Level".
//           -Also flips to 1 for a moment when the player dies in a level.