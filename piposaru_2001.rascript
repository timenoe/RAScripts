// Ape Escape 2001 | Piposaru 2001
// #ID = 28952
// Author: timenoe
// Note: Rich Presence was done manually

// Constants

COURSES = ["Monkey", "Human", "Professor", "Specter"]
LANDS = ["Hono Bono Land", "Picha Picha Land", "Ati Ati Land", "Doki Doki Land", "Tsuru Tsuru Land", "Piko Piko Land"]
STATS = ["clear", "time", "transfer", "rank"]

BADDR = 
{
    "clear": 0x96faa0,
    "time": 0x96faa4,
    "transfer": 0x96faa8,
    "rank": 0x96fac8
}
RANK = 
{
    "s": 5
}
OFFSET = 
{
    "land": 0x550,
    "expert": 0x2600,
    "stage": 0x88
}
STATE = 
{
    "save_load": 0x0e,
    "stage_exit": 0x1e,
    "stage_clear": 0x1b,
    "ending": 0x21
}

COURSE_MONKEY = 
{
    "Hono Bono Land":   {"stages": [0, 1, 2, 4, 5]},
    "Picha Picha Land": {"stages": [0, 1, 4, 5]}
}
COURSE_HUMAN = 
{
    "Ati Ati Land":     {"stages": [0, 1, 2, 4, 5]},
    "Picha Picha Land": {"stages": [2]},
    "Doki Doki Land":   {"stages": [0, 1, 2, 4, 5]},
    "Tsuru Tsuru Land": {"stages": [0, 1]}
}
COURSE_PROFESSOR = 
{
    "Tsuru Tsuru Land": {"stages": [2, 3, 4, 5]},
    "Hono Bono Land":   {"stages": [3]},
    "Picha Picha Land": {"stages": [3]},
    "Ati Ati Land":     {"stages": [3]},
    "Doki Doki Land":   {"stages": [3]},
}
COURSE_SPECTER = 
{
    "Piko Piko Land": {"stages": [0, 1, 2, 3, 4]}
}

COURSE = 
{
    "Monkey": COURSE_MONKEY,
    "Human": COURSE_HUMAN,
    "Professor": COURSE_PROFESSOR,
    "Specter": COURSE_SPECTER
}
LAND = 
{
    "Hono Bono Land":   {"id": 0, "stages": 6},
    "Picha Picha Land": {"id": 1, "stages": 6},
    "Ati Ati Land":     {"id": 2, "stages": 6},
    "Doki Doki Land":   {"id": 3, "stages": 6},
    "Tsuru Tsuru Land": {"id": 4, "stages": 6},
    "Piko Piko Land":   {"id": 5, "stages": 5},
}

g_state = dword(0x96e9fc)
g_land = dword(0x96f2f0)
g_stage = dword(0x96f2f4)
g_expert = dword(0x96fa00)
g_clear_time = dword(0x975194)

// Functions
function expert_str(expert)
{
    if (expert == 1) return "Expert "
    else return ""
}
function expert_title(expert)
{
    if (expert == 1) return "[Expert] "
    else return ""
}
function game_clear() => prev(g_state) == STATE["stage_exit"] && g_state == STATE["ending"]
function stage_clear(expert, land, stage)
{
    clear = prev(g_state) == STATE["stage_exit"] && g_state == STATE["stage_clear"]
    if (expert == -1) return g_land == land && g_stage == stage && clear
    else return g_expert == expert && g_land == land && g_stage == stage && clear
}
function stage_stat(type, expert, land, stage) => dword(BADDR[type] + expert * OFFSET["expert"] + land * OFFSET["land"] + stage * OFFSET["stage"])
function stage_str(stage)
{
    if (stage <= 4)
    {
        return format("Lv {0}", stage + 1)
    }
    else
    {
        return "Specter"
    }
}
function state_init() => g_state >= 2 && g_state <= 0x22
function state_load() => g_state == STATE["save_load"]

// Achievements
function course_progression()
{
    trigger = stage_clear(-1, LAND["Hono Bono Land"]["id"], 5) || stage_clear(-1, LAND["Picha Picha Land"]["id"], 5)
    achievement("Monkeying Around", "Defeat Specter in Monkey Course", 5, trigger, type="progression")

    trigger = stage_clear(-1, LAND["Doki Doki Land"]["id"], 5) || stage_clear(-1, LAND["Ati Ati Land"]["id"], 5)
    achievement("Mount Sarumore", "Defeat Specter in Human Course", 10, trigger, type="progression")

    trigger = stage_clear(-1, LAND["Tsuru Tsuru Land"]["id"], 5)
    achievement("Christmas Cleaning", "Defeat Specter in Professor Course", 10, trigger, type="progression")

    achievement("Silky Smooth", "Defeat Specter in Specter Course", 10, game_clear(), type="win_condition")
}

function course_completion(expert)
{
    for c_key in COURSES
    {
        clear_sum = 0
        time_sum = 0
        transfer_sum = 0
        rank_sum = []
        rank_change = always_false()
        count = 0

        for l_key in COURSE[c_key]
        {
            l = LAND[l_key]["id"]

            for s in COURSE[c_key][l_key]["stages"]
            {
                clear_sum = clear_sum + stage_stat("clear", expert, l, s)
                time_sum = time_sum + stage_stat("time", expert, l, s)
                transfer_sum = transfer_sum + stage_stat("transfer", expert, l, s)
                
                if !(l_key == "Piko Piko Land" && s == 4)
                {
                    rank = stage_stat("rank", expert, l, s)
                    array_push(rank_sum, once(never(rank != RANK["s"]) && rank == RANK["s"]))
                    rank_change = __ornext(rank_change || rank != prev(rank))
                }
                
                count = count + 1
            }
        }

        points = 5
        if (expert == 1) points = 10

        // Progression covers the clears for the other two courses
        // Since there are no branching paths
        if (expert == 1 || c_key == "Monkey" || c_key == "Human")
        {
            trigger = !state_load() && prev(clear_sum) == count -1 && measured(clear_sum == count, when=state_init())
            achievement(format("{0}{1} Laundry", expert_title(expert), c_key), format("Clear all {0} {1}{2} Course stages", count, expert_str(expert), c_key), points, trigger)
        }

        trigger = !state_load() && prev(time_sum) == count -1 && measured(time_sum == count, when=state_init())
        achievement(format("{0}{1} Express", expert_title(expert), c_key), format("Clear all {0} {1}{2} Course stages within the Time Limit", count, expert_str(expert), c_key), points, trigger)
        
        trigger = !state_load() && prev(transfer_sum) == count -1 && measured(transfer_sum == count, when=state_init())
        achievement(format("{0}{1} Bonanza", expert_title(expert), c_key), format("Clear all {0} {1}{2} Course stages with 1 Transfer", count, expert_str(expert), c_key), points, trigger)
        
        points = 10
        if (expert == 1) points = 25
        
        trigger = never(!state_init()) && !state_load() && rank_change && measured(tally(length(rank_sum), rank_sum))
        achievement(format("{0}{1} Prestige", expert_title(expert), c_key), format("Clear all {0} {1}{2} Course stages with an S Rank", length(rank_sum), expert_str(expert), c_key), points, trigger)
    }
}

function full_completion(expert)
{
    sum = []
    change = always_false()
    for l_key in LANDS
    {
        for s in range(0, LAND[l_key]["stages"] - 1)
        {
            l = LAND[l_key]["id"]
            for stat in STATS
            {
                // Can only clear the final level
                if !(stat != "clear" && l_key == "Piko Piko Land" && s == 4)
                {
                    cur_stat = stage_stat(stat, expert, l, s)
                    if (stat == "rank")
                    {
                        array_push(sum, once(never(cur_stat != RANK["s"]) && cur_stat == RANK["s"]))
                    }
                    else
                    {
                        array_push(sum, once(never(cur_stat != 1) && cur_stat == 1))
                    }

                    change = __ornext(change || cur_stat != prev(cur_stat))
                }
            }
        }  
    }

    trigger = never(!state_init()) && !state_load() && change && measured(tally(length(sum), sum), format="percent")
    achievement(format("{0}Top Rated Laundromat", expert_title(expert)), format("Complete 100% of the {0}World Map", expert_str(expert)), 25 * (expert + 1), trigger)
}

course_progression()

course_completion(0)
full_completion(0)

course_completion(1)
full_completion(1)

// Leaderboards
function stage_lbs(expert)
{
    for l_key in LANDS
    {
        for s in range(0, LAND[l_key]["stages"] - 1)
        {
            l = LAND[l_key]["id"]

            // Can only clear the final level
            if !(l_key == "Piko Piko Land" && s == 4)
            {
                title = format("{0}{1} {2} Speedrun", expert_str(expert), l_key, stage_str(s))
                desc = format("Clear {0}{1} {2} as fast as possible", expert_str(expert), l_key, stage_str(s))
                // if (expert == 1)
                // {
                //     desc = format("Clear {0} {1} (Expert) as fast as possible", l_key, stage_str(s))
                // }
                // else
                // {
                //     desc = format("Clear {0} {1} as fast as possible", l_key, stage_str(s))
                // }
                
                leaderboard(title, desc, stage_clear(expert, l, s), always_false(), always_true(), g_clear_time, format="SECS", lower_is_better=true)
            }
        }  
    }
}

stage_lbs(0)
stage_lbs(1)