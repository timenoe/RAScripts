// Go! Go! Hypergrind
// #ID = 25442

// Subset Ideas
// Completionist (Story Mode All Players/Difficulties)
// Kevin's Medal on Expert

// #region Common
ptr_mask = 0x7fffffff
function bit_flip(addr) => bit(addr[0], addr[1]) > prev(bit(addr[0], addr[1]))
function prev_bit(addr)
{
	if (addr[0] == 7) return [0, addr[1] - 1]
	else return [addr[0] + 1, addr[1]]
}
function next_bit(addr)
{
	if (addr[0] == 7) return [0, addr[1] + 1]
	else return [addr[0] + 1, addr[1]]
}
function count_bits_backward(addr, count)
{
	sum = 0
	for bit in range(1, count)
	{
		sum = sum + bit(addr[0], addr[1])
		addr = prev_bit(addr)
	}
	return sum
}
function count_bits_forward(addr, count)
{
	sum = 0
	for bit in range(1, count)
	{
		sum = sum + bit(addr[0], addr[1])
		addr = next_bit(addr)
	}
	return sum
}
// #endregion

// #region Addresses
board_designs_addr = [0, 0x4cc86b + 5 - 1] // 40 counting backwards
gear_addr_1 = [0, 0x4cc879 + 7 - 1] // 50 counting backwards
gear_addr_2 = [0, 0x4cc881 + 7 - 1] // 50 counting backwards
boards_addr = [0, 0x4cc898 + 1 - 1] // 12 counting backwards
wheel_designs_addr = [0, 0x4cc89c + 1 - 1] // 16 counting backwards
gallery_addr_1 = [0, 0x4cc8a9 + 7 - 1] // 50 counting backwards
gallery_addr_2 = [0, 0x4cc8b2 + 6 - 1] // 46 counting backwards
figures_addr = [0, 0x4cc8bb + 5 - 1] // 33 counting backwards
movies_addr = [0, 0x4cc8c4 + 4 - 1] // 28 counting backwards
// #endregion

// #region Constants
players = ["Decker", "Gigi", "Freddy", "Penny", "Mr. Smith", "Piggy-Sue", "Pxhbiqt (Bob)", "Sally", "Johnson Bros.", "Vert", "Kevin"]
stages = ["Toon City", "Western Film", "Fantasy Studio", "Haunted Night", "Factory", "Jungle", "Ninja Village", "Hong Kong Night"]
story_titles = ["Got Milk?", "Texas Tornado", "Final Fantasy", "Don't Fear the Reaper", "Cog in the Machine", "Jungle Fever", "The Land of Jipang", "Wake the Sleeping Dragon"]
stage_lesson_count = [5, 3, 4, 4, 4, 5, 3, 4]
negative_reaction_counts = [11, 12, 10, 11, 12, 11, 10, 11]

board_designs = count_bits_backward(board_designs_addr, 40)
gear = count_bits_backward(gear_addr_1, 50) + count_bits_backward(gear_addr_2, 50)
boards = count_bits_backward(boards_addr, 12)
wheel_designs = count_bits_backward(wheel_designs_addr, 16)
gallery = count_bits_backward(gallery_addr_1, 50) + count_bits_backward(gallery_addr_2, 46)
figures = count_bits_backward(figures_addr, 33)
kevins_figures = bit(6, 0x4cc8bc) + bit(7, 0x4cc8bc) + bit(0, 0x4cc8bd)
movies = count_bits_backward(movies_addr, 28)
// #endregion

// #region Functions
function game_ptr() => dword_be(0x2b1240) & ptr_mask
function player_ptr() => dword_be(game_ptr() + 0x14) & ptr_mask
function appeal_ptr() => dword_be(player_ptr() + 0x1834) & ptr_mask
function stage_ptr() => dword_be(0x2b1244) & ptr_mask
function lesson_ptr() => dword_be(stage_ptr() + 0x16c) & ptr_mask
function game_state() => dword_be(0x4c4bc0)
function mode() => dword_be(0x4c504c)
function player() => dword_be(0x4c50d0)
function stage() => dword_be(0x4c5058)
function difficulty() => dword_be(0x4cc768)
function round() => dword_be(0x4cc770)
function rank_1_points() => dword_be(0x4cc570)

function not_booting() => game_state() >= 3
function not_cheating() => bitcount(0x4cc8cf) - bit7(0x4cc8cf) == 0
function in_game() => game_state() >= 7 && not_cheating()

function rank_1_is_player() => dword_be(0x4cc564) == 1
function beat_round(round) => prev(round()) == round -1 && round() == round
function complete_lessons(stage, count)
{
    lessons_sum = 0
    lesson_offset = 0x60
    for lesson in range(1, count)
    {
        lessons_sum = lessons_sum + dword_be(lesson_ptr() + lesson_offset) / 2
        lesson_offset = lesson_offset + 4
    }
    return prev(lessons_sum) == count - 1 && measured(lessons_sum == count, when=game_state() == 7 && stage() == stage)
}

function all_normal_bonuses() => dword_be(0x4c5100) == 1 && dword_be(0x4c5104) == 1 && dword_be(0x4c5108) == 1 && dword_be(0x4c510c) == 1 && dword_be(0x4c5110) == 1 && dword_be(0x4c512c) == 1 && dword_be(0x4c5130) == 1
function all_appeal_bonuses(player) => prev(dword_be(0x4c511c) + dword_be(0x4c5120) + dword_be(0x4c5124) + dword_be(0x4c5128)) < 4 && measured(dword_be(0x4c511c) + dword_be(0x4c5120) + dword_be(0x4c5124) + dword_be(0x4c5128) == 4, when=player() == player && game_state() == 8)

function negative_reaction() => dword_be(appeal_ptr() + 0x3b8)
function all_negative_reactions(count)
{
    reactions = []
    for reaction in range(0x10, 0x1c) array_push(reactions, negative_reaction() != prev(negative_reaction()) && once(negative_reaction() == reaction))
    return tally(count, reactions)
}

function single_session_end() => prev(dword_be(game_ptr() + 0x378)) == 5 && dword_be(game_ptr() + 0x378) == 0
function single_session_total_score() => dword_be(0x4c50e8)
function single_session_link_score() => dword_be(0x4c50ec)
function single_session_most_links() => dword_be(0x4c50f0)
function single_session_reaction_time() => dword_be(0x4c50f4)
function single_session_items() => dword_be(0x4c50f8)

function loading_minigame_active() => dword_be(0x4c5000) == 1 && dword_be(0x4c5008) != 0
function loading_minigame_end() => prev(dword_be(0x4c5000)) == 1 && dword_be(0x4c5000) == 0 && prev(dword_be(0x4c5008)) != 0 && dword_be(0x4c5008) == 0
function loading_minigame_score() => dword_be(0x4cd038)

function credits_minigame_ptr() => dword_be(0x2b123c) & ptr_mask
function credits_minigame_complete() => prev(dword_be(credits_minigame_ptr() + 0x5120)) == 3 && dword_be(credits_minigame_ptr() + 0x5120) == 4
function credits_minigame_hits() => dword_be(credits_minigame_ptr() + 0x512c)
// #endregion

//// #region Achievements
/// Progression
achievement("Chase Your Dreams", "Finish the Skill Test in Story Mode for the first time", 3, in_game() && bit_flip([2, 0x4cc8c7]), type="progression")

story_progress = 5
for stage in range(0, 7)
{
    desc = "Complete " + stages[stage] + " in Story Mode"
    if (stages[stage] == "Hong Kong Night") desc = "Complete Hong Kong Night in Story Mode and unlock Vert"
    points = 5
    if (story_progress >= 25) points = 10
    type = "progression"
    if (stages[stage] == "Hong Kong Night") type = "win_condition"

    achievement(story_titles[stage], desc, points, in_game() && beat_round(story_progress), type=type)
    story_progress = story_progress + 5
}

/// Completion
achievement("Student Becomes the Master", "Beat the game a second time and unlock Kevin", 10, in_game() && bit_flip([2, 0x4cc8c8]))

// Special Gear items (Story Mode Bonus Prizes)
special_gear = ["Kaminari", "Samurai", "Geisha", "Rice Cake", "Gears", "Gavel", "Bronze Medal", "Silver Medal", "Gold Medal", "Kevin's Medal"]

gear_addr = [0, 0x4cc882]
for gear in special_gear
{
    points = 5
    if (gear == "Gold Medal" || gear == "Kevin's Medal") points = 10
    achievement(gear + " Collector", "Collect the " + gear + " Gear", points, in_game() && bit_flip(gear_addr))
    gear_addr = next_bit(gear_addr)
}

// Special Gallery illustrations (Single Session Item Collection/Gold Medals)
rank_addr = 0x4cc8d0
for stage in range(0, 7)
{
    achievement(stages[stage] + " Master", "Earn a Gold Medal during a Single Session run in " + stages[stage] + " for the first time", 10, in_game() && prev(dword_be(rank_addr)) != 0 && dword_be(rank_addr) == 0)
    rank_addr = rank_addr + 4
}

// Figures (All except the gold Figures which are impossible to obtain normally, with the exception of Kevin's)
figure_addr = figures_addr
for player in range(0, 9)
{
    figure_sum = 0
    for figure in range(1, 2)
    {
        figure_sum = figure_sum + bit(figure_addr[0], figure_addr[1])
        figure_addr = next_bit(figure_addr)
    }
    figure_addr = next_bit(figure_addr) // To account for the impossible gold figures

    achievement(players[player] + "'s Prize", "Collect the first two " + players[player] + " Figures", 10, in_game() && prev(figure_sum) < 2 && measured(figure_sum == 2, when=not_booting()))
}
achievement("Hi Kevin", "Collect all three Kevin Figures", 25, in_game() && prev(kevins_figures) < 3 && measured(kevins_figures == 3, when=not_booting()))

// Special Movies (Story Mode Endings)
ending_addr = [2, 0x4cc8c5]
for player in range(0, 9)
{
    achievement(players[player] + "'s Ending", "Beat the game with " + players[player], 10, in_game() && bit_flip(ending_addr))
    ending_addr = next_bit(ending_addr) // To account for the impossible gold figures
}

// Overall
achievement("Style Is Important", "Collect all 40 Board Designs", 10, in_game() && prev(board_designs) < 40 && measured(board_designs == 40, when=not_booting()))
achievement("Fully Kitted", "Collect all 100 Gear items", 25, in_game() && prev(gear) < 100 && measured(gear == 100, when=not_booting()))
achievement("Decked Out", "Collect all 12 Boards", 5, in_game() && prev(boards) == 12 && measured(boards == 12, when=not_booting()))
achievement("Roll Out", "Collect all 16 Wheel Designs", 5, in_game() && prev(wheel_designs) < 16 && measured(wheel_designs == 16, when=not_booting()))
achievement("Art Appreciation", "Collect all 96 Gallery illustrations", 50, in_game() && prev(gallery) < 96 && measured(gallery == 96, when=not_booting()))
achievement("Movie Buff", "Collect all 28 Movies", 10, in_game() && prev(movies) == 28 && measured(movies == 28, when=not_booting()))

/// Miscellaneous/Challenges
// Story Mode
story_progress = 5
for stage in range(0, 7)
{
    // 3 in western, 4 in fantasy, 4 in haunted, 4 in factory, 5 in jungle, 3 in ninja, 4 in hong kong
    achievement(stages[stage] + " Rookie", "Complete all " + stage_lesson_count[stage] + " Lessons in " + stages[stage] + " in Story Mode", 5, in_game() && complete_lessons(stage, stage_lesson_count[stage]))

    points = 10
    if (story_progress >= 25) points = 25
    achievement(stages[stage] + " Expert", "Complete " + stages[stage] + " on Expert difficulty in Story Mode", points, in_game() && difficulty() == 2 && beat_round(story_progress))
    story_progress = story_progress + 5
}
achievement("A-List Actor", "Beat the game with 480 total Points", 25, in_game() && rank_1_is_player() && rank_1_points() == 480 && beat_round(40))

// Freeride Mode
achievement("Quick Change Artist", "Start Freeride Mode using an alternate Player pallete", 2, in_game() && prev(game_state()) == 5 && dword_be(0x4c5140) > prev(dword_be(0x4c5140)))
for player in range(0, 0xa) achievement(players[player] + "'s Performance", "Earn the All Air, Grind, Manual, and Lip Appeals Bonuses with " + players[player] + " in Freeride Mode", 5, in_game() && game_state() == 8 && all_appeal_bonuses(player))

// Single Session Mode
for stage in range(0, 7) achievement(stages[stage] + " Collector", "Collect all 5 Items during a Single Session run in " + stages[stage], 5, in_game() && prev(single_session_items()) == 4 && measured(single_session_items() == 5, when=game_state() == 8 && mode() == 2 && stage() == stage))
achievement("Action Packed Show", "Complete a Single Session run having earned the Air, Grind, Manual, Lip, Special, Pole, and Revert Appeal Bonuses", 25, in_game() && game_state() == 8 && mode() == 2 && all_normal_bonuses() && trigger_when(single_session_end()))

// Any Mode
for stage in range(0, 7) achievement(stages[stage] + " Tour", "Perform " + negative_reaction_counts[stage] + " different Negative Reactions in " + stages[stage] + " in one visit", 10, never(!in_game() || stage() != stage) && measured(all_negative_reactions(negative_reaction_counts[stage])))

achievement("Bullseye!", "Earn 1000 Points during the loading screen minigame", 10, not_booting() && loading_minigame_active() && trigger_when(loading_minigame_score() - prev(loading_minigame_score()) == 1000))

// For Rich Presence
// achievement("All Board Designs", "All 40 Board Designs", 0, board_designs == 40)
// achievement("All Gear", "All 100 Gear", 0, gear == 100)
// achievement("All Boards", "All 12 Boards", 0, boards == 12)
// achievement("All Wheel Designs", "All 16 Wheel Designs", 0, wheel_designs == 16)
// achievement("All Gallery", "All 96 Gallery", 0, gallery == 96)
// achievement("All Figures", "All 33 Figures", 0, figures == 33)
// achievement("All Movies", "All 28 Movies", 0, movies == 28)
// #endregion

// #region Leaderboards
for stage in range(0, 7)
{
    leaderboard(stages[stage] + " - Total Score", "Get the highest Total Score during a Single Session run in " + stages[stage], in_game() && stage() == stage && single_session_total_score() !=0 && single_session_end(), always_false(), always_true(), single_session_total_score())
    leaderboard(stages[stage] + " - Best Link Score", "Get the highest Best Link Score during a Single Session run in " + stages[stage], in_game() && stage() == stage && single_session_link_score() != 0 && single_session_end(), always_false(), always_true(), single_session_link_score())
    leaderboard(stages[stage] + " - Most Links", "Get the highest Most Links during a Single Session run in " + stages[stage], in_game() && stage() == stage && single_session_most_links() != 0 && single_session_end(), always_false(), always_true(), single_session_most_links())
    leaderboard(stages[stage] + " - Reaction Time", "Get the highest Reaction Time during a Single Session run in " + stages[stage], in_game() && stage() == stage && single_session_reaction_time() != 0 && single_session_end(), always_false(), always_true(), single_session_reaction_time() * 2, format="FRAMES")
}

leaderboard("Loading Minigame - Points", "Get the highest number of Points during the loading screen minigame", not_booting() && loading_minigame_end() && loading_minigame_score() != 0, always_false(), always_true(), loading_minigame_score())
leaderboard("Credits Minigame - Hits", "Get the highest number of Hits during the post-credits minigame", in_game() && credits_minigame_complete() && credits_minigame_hits() != 0, always_false(), always_true(), credits_minigame_hits())
// #endregion