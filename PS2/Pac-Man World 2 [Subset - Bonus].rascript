// Pac-Man World 2 [Subset - Bonus]
// #ID = 19890
// RA Checksum: e28ad5a426b18cf471faf798100f39a3

// Base: Pac-Man World 2 (USA) (v2.00) (Redump)

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

levelID = {

    1: 0x389f,
    2: 0x380e,
    3: 0x380f,
    5: 0x38ea,
    6: 0x3473,
    7: 0x36dd,
    9: 0x3496,
    10: 0x35d8,
    11: 0x35c0,
    13: 0x3567,
    14: 0x38f1,
    15: 0x36cb,
    17: 0x3d1f,
    18: 0x3ecd,
    19: 0x3279,
    21: 0x319d,
    22: 0x3ab7,
    23: 0x3600
    
}

requiredTime = {
    
    1: 20.0,
    2: 3.0,
    3: 10.0,
    5: 20.0,
    6: 60.0,
    7: 60.0,
    9: 30.0,
    10: 90.0,
    11: 50.0,
    13: 70.0,
    14: 30.0,
    15: 50.0,
    17: 70.0,
    18: 70.0,
    19: 240.0,
    21: 105.0,
    22: 90.0,
    23: 16.0

}

writtenTime = {
    
    1: "20 seconds",
    2: "3 seconds",
    3: "10 seconds",
    5: "20 seconds",
    6: "1 minute",
    7: "1 minute",
    9: "30 seconds",
    10: "1 minute and 30 seconds",
    11: "50 seconds",
    13: "1 minute and 10 seconds",
    14: "30 seconds",
    15: "50 seconds",
    17: "1 minute and 10 seconds",
    18: "1 minute and 10 seconds",
    19: "4 minutes",
    21: "1 minute and 45 seconds",
    22: "1 minute and 30 seconds",
    23: "16 seconds"
}

//Achievements

for key in levelName {
    
    if bossLevel[key] == false {
        
        if key != 0 {
            
            title = levelName[key] + " Fast!"
            description = "Complete the time trial in " + levelName[key] + " in under " + writtenTime[key] + "."
            trigger = word(0x5A9CFC) == levelID[key] && float(0x5A872C) > 0.0 && float(0x5A872C) < requiredTime[key] && trigger_when(dword(0x354A10)
               == 1163281740)
            achievement(title, description, 25, trigger)
            
            if key == 1 {
                
                achievement(
                    title = "Heavy Metal", description = "In The Bear Basics, break the crate in the right side of the lake without performing any actions, and then complete the level whilel the Steel Ball is still active.", points = 25,
                    trigger = word(0x5A9CFC) == 14495 && once(prev(byte(0x5A8398)) == 34 && bit0(tbyte(0x5A69F0) + 0x00008B) == 1 &&
                               never(prev(low4(0x5A9438)) == 1 && low4(0x5A9438) == 0)) && trigger_when(dword(0x354A10) == 1163281740) && 
                              unless(once(float(0x5A872C) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5A9CFC)) == 14477 && word(0x5A9CFC) == 14495))))
                )
                
            }
            
            else if key == 3 {
                
                achievement(
                    title = "Dreamscape", description = "Swim under the pond in Pac-Dot Pond.", points = 10,
                    trigger = word(0x5A9CFC) == 14351 && float(0x3D9FE8) < -1000.0 && float(0x3D9FE8) > -1300.0 && float(0x3D9FE4) > 0.0
                )
                
                achievement(
                    title = "Mysterious Floating Box", description = "Complete Pac-Dot Pond without crossing the final pit.", points = 10,
                    trigger = word(0x5A9CFC) == 14351 && trigger_when(dword(0x354A10) == 1163281740) && unless(once(float(0x3D9FE0) <
                               100.0 && float(0x3D9FE8) < -1850.0)) &&
                              (always_false() || (never((prev(word(0x5A9CFC)) == 14333 && word(0x5A9CFC) == 14351))))
                )
                
            }
            
            else if key == 5 {
                
               achievement(
                    title = "Muscle Memory", description = "Perform the B-Doing Woods skip and grab the next checkpoint.", points = 10,
                    trigger = word(0x5A9CFC) == 14570 && (prev(byte(0x5A6A0C)) == 0 || prev(byte(0x5A6A0C)) == 2) && 
                              trigger_when(byte(0x5A6A0C) == 3) && unless(once((float(0x3D9FE0) < 400.0 && float(0x3D9FE8) < -700.0) ||
                               float(0x5A872C) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5A9CFC)) == 14552 && word(0x5A9CFC) == 14570))))
                )
                
            }
            
            else if key == 7 {
                
                achievement(
                    title = "Bouncing Ball", description = "Perform the Ring Skip and complete Butane Pain with a score of 0.", points = 100,
                    trigger = word(0x5A9CFC) == 14045 && dword(0x48A048) == 0 && trigger_when(dword(0x354A10) == 1163281740) && 
                              unless(once(float(0x5A872C) != 0.0))
                )
                
            }
            
            else if key == 14 {
                
                achievement(
                    title = "Pig Iron", description = "Perform the Volcanic Panic skip and complete the level.", points = 25,
                    trigger = word(0x5A9CFC) == 14577 && trigger_when(dword(0x354A10) == 1163281740) && unless(once(float(0x3D9FE0) <
                               100.0 && float(0x3D9FE4) < -240.0)) &&
                              (always_false() || (never((prev(word(0x5A9CFC)) == 14559 && word(0x5A9CFC) == 14577 && byte(0x5A6A0C) == 0))))
                )
                
            }
            
            else if key == 23 {
                
                achievement(
                    title = "Boundary Breaker", description = "Clip through the invisible wall in the graveyard and complete Ghost Bayou with a score of 0.", points = 25,
                    trigger = word(0x5A9CFC) == 13824 && dword(0x48A8C8) == 0 && trigger_when(dword(0x354A10) == 1163281740) && 
                              unless(once(float(0x5A872C) != 0.0)) &&
                              (always_false() || (never((prev(word(0x5A9CFC)) == 13806 && word(0x5A9CFC) == 13824))))
                )
                
            }
        }
        
        else {
            
            achievement(
                title = "Treetop Trance", description = "Sleep on top of the Golden Fruit Tree.", points = 25,
                trigger = float(0x3D9FE0) > -80.0 && float(0x3D9FE0) < 20.0 && float(0x3D9FE4) < -85.0 && byte(0x5A8398) == 62 &&
                          ((word(0x5A9CFC) == 13951) ||
                           (word(0x5A9CFC) == 13823))
            )
            
            achievement(
                title = "Rev Glide [m]", description = "In Pac-Village, collect the token on top of the tall tree by Rev Rolling in a weird state...", points = 10,
                trigger = prev(bit0(0x489D54)) == 0 && never(float(0x7D8ED4) > 1.1) && trigger_when(once(prev(byte(0x5A8398)) == 40
                           && byte(0x5A8398) == 6)) && trigger_when(bit0(0x489D54) == 1) &&
                          ((word(0x5A9CFC) == 13951) ||
                           (word(0x5A9CFC) == 13823))
            )
            
            achievement(
                title = "Homecoming", description = "Clip into the Pac-Man World 2 arcade machine.", points = 10,
                trigger = word(0x5A9CFC) == 12466 && float(0x3D9FE0) > -71.0 && float(0x3D9FE0) < -69.0 && float(0x3D9FE8) > 64.0 && 
                          float(0x3D9FE8) < 66.0 && float(0x3D9FE4) > -10.0
            )
            
            achievement(
                title = "Hungry For Seconds", description = "After defeated Spooky, clip into the Golden Fruit Tree.", points = 10,
                trigger = word(0x5A9CFC) == 13823 && float(0x3D9FE0) > -37.0 && float(0x3D9FE0) < -30.0 && float(0x3D9FE8) > 102.0 && 
                          float(0x3D9FE8) < 109.0 && float(0x3D9FE4) > -25.0
            )

        }
    }
    
    else if key == 4 {
        
        achievement(
            title = "Wait. That's Illegal.", description = "Defeat Blinky in less than 30 seconds!", points = 50,
            trigger = word(0x5A9CFC) == 14418 && trigger_when(dword(0x354A10) == 1145851719) && unless(repeated(1800,
                       word(0x5A9CFC) == 14418)) &&
                      ((never((prev(word(0x5A9CFC)) != 14412 && word(0x5A9CFC) == 14412))) ||
                       (never((prev(word(0x5A9CFC)) == 14268 && word(0x5A9CFC) == 14418)) && unless(once(prev(byte(0x7EF978)) ==
                         2 && byte(0x7EF978) == 3))))
        )
        
        achievement(
            title = "Bird's Eye View", description = "Soar to greater heights during the fight with Blinky.", points = 10,
            trigger = word(0x5A9CFC) == 14418 && float(0x3D9FE4) < -400.0 && byte(0x5A8398) == 34
        )
        
    }
    
    else if key == 16 {
        
        achievement(
            title = "Exceptional Fire Sale", description = "Defeat Clyde in less than 1 minute and without taking damage!", points = 100,
            trigger = word(0x5A9CFC) == 12500 && trigger_when(dword(0x354A10) == 1145851719) && unless(once(repeated(3600,
                       word(0x5A9CFC) == 12500) || float(0x488EC0) < prev(float(0x488EC0)))) &&
                      (always_false() || (never((prev(word(0x5A9CFC)) == 12482 && word(0x5A9CFC) == 12500 && float(0x808A2C) == 0.0))))
        )
        
    }
    
    else if key == 20 {
        
        achievement(
            title = "Ultimate Submarine Supernova", description = "Defeat the Whale on a Sub in one phase!", points = 100,
            trigger = word(0x5A9CFC) == 14733 && trigger_when(dword(0x354A10) == 1145851719) && unless(once(byte(0x5A6A0C) ==
                       6)) &&
                      (always_false() || (never((prev(word(0x5A9CFC)) == 13463 && word(0x5A9CFC) == 14733 && byte(0x5A6A0C) == 0))))
        )
        
    }
    
    else if key == 24 {
        
        achievement(
            title = "The True Sir-Pac-A-Lot", description = "Defeat Spooky in under 30 seconds!", points = 100,
            trigger = once(prior(word(0x5A9CFC)) == 12968 && word(0x5A9CFC) == 13492) && trigger_when(prev(word(0x5AADB0)) != 0) && 
                      trigger_when(word(0x5AADB0) == 0) && unless(repeated(1800, word(0x5A9CFC) == 13492)) &&
                      ((never((prev(word(0x5A9CFC)) != 14412 && word(0x5A9CFC) == 14412))) ||
                       (never((prev(word(0x5A9CFC)) == 12968 && word(0x5A9CFC) == 13492)) && 
                        unless(once((prev(low4(tbyte(0x5A945C) + 0x00377C)) == 0) && low4(tbyte(0x5A945C) + 0x00377C) == 1))))
        )
        
    }
}

achievement(
    title = "Fatal Debt", description = "Get -1 lives by completing a level and dying at the same time.", points = 25,
    trigger = prev(dword(0x488EB8)) == 0 && dword(0x488EB8) == 4294967295
)

achievement(
    title = "Avenger of the Golden Fruit Tree", description = "Start a new game, defeat Spooky, and then save your game in under 1 hour!", points = 100,
    trigger = once(byte(0x488EC9) == 0 && byte(0x488ECA) == 0 && float(0x488ECC) == 0.0 && word(0x5A9CFC) == 13951) && 
              once(byte(0x48F094) == 24 && prev(bit0(0x48A948)) == 0 && bit0(0x48A948) == 1) && (byte(0x488EC9) !=
               prev(byte(0x488EC9)) || byte(0x488ECA) != prev(byte(0x488ECA)) || float(0x488ECC) !=
               prev(float(0x488ECC))) && (byte(0x488EC9) * 3600 + byte(0x488ECA) * 60 + float(0x488ECC)) < 3600 && 
              never((prev(word(0x3DA512)) == 0 && word(0x3DA512) == 16908))
)

//Code Notes

// $354A10: [32-bit] Misc ID (v2.00)
//          Cutscenes
//          0x4556454c = Completed a Level
//          0x444c4f47 = Collected a Golden Fruit
// $3D9FE0: [Float] X,Y Coordinate Pair (v2.00)
// $3D9FE4: [Float] Z Coordinate (v2.00)
// $3D9FE8: [Float] X,Y Coordinate Pair (v2.00)
// $3DA512: [16-bit] Game State (v2.00)
//          0 = Loading/In a Level
//          0x3e80 = Overworld
//          0x420c = Title Screen
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
// $5A69F0: [24-bit] Object Pointer (v2.00)
//          +0x31 = [Bit0] Pac-Village - Tall Tree Token
//          +0x8b = [Bit0] The Bear Basics - Crate in Right Side of Lake
// $5A6A0C: [8-bit] Checkpoint (v2.00)
//          0 = Start of Level
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
// $7D8ED4: [Float] Pac-Village Speed (v2.00)
// $7EF978: [8-bit] Number of Hits on Blinky (v2.00)
//          3 = Phase 2
//          6 = Dead
//          0x65 = Overworld
//          Note: This is unstable during death/load. Use stored hits.
// $808A2C: [Float] Number of Hits on Clyde (v2.00)
//          2 = Phase 2
//          4 = Phase 3
//          6 = Phase 4
//          8 = Phase 5
//          10 = Dead