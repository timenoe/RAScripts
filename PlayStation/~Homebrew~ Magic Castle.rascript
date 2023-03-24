// ~Homebrew~ Magic Castle
// #ID = 9018
// Version: Magic_Castle_2021_07_May
// timenoe

///Addresses
///These may need to be updated when a new version is released. Verify them while playing in English.

bootMenuPointerAddress = 0x94db4

promoVideoFeatureLoadPointerAddress = 0x90350
promoVideoPointerAddress = 0xf3810
activeVideoAddress = 0xee008

betaFeatureLoadPointerAddress = 0x62b10
betaGameStateAddress = 0x12fc40

//[Ja, En, Es, It, Pt, Tu]
featureLoadPointerAddress = [0x13f7d4, 0x13f824, 0x13f914, 0x13fcf4, 0x13fc94, 0x13fb14]
itemAddress = [0x154ba0, 0x155020, 0x155290, 0x155690, 0x155660, 0x1552f0]
characterPointerAddress = [0x157c34, 0x1580b4, 0x158354, 0x158754, 0x158724, 0x1583b4]
trainingSectionAddress = [0x157ee8, 0x158358, 0x1585f8, 0x1589f8, 0x1589c8, 0x158658]
gameStateAddress = [0x157f50, 0x1583b0, 0x158630, 0x158a40, 0x158a20, 0x1586c0]
runStatsAddress = [0x1584a2, 0x1588d2, 0x158ac2, 0x158ef2, 0x158ec2, 0x158bc2]
inputAddress = [0x15bc00, 0x15c030, 0x15c220, 0x15c650, 0x15c620, 0x15c320]
scoreboardAddress = [0x160900, 0x160d30, 0x160f20, 0x161350, 0x161320, 0x161020]

gameStateBase = gameStateAddress[1]
player1Address = 0x1583b9
player2Address = 0x1583ba
player3Address = 0x1583bb
player4Address = 0x1583bc
optionsMenuAddress = 0x1583fc
extraModeAddress = 0x158404
debugModeAddress = 0x158452
turkishOptionsMenuAddress = 0x158704
turkishExtraModeAddress = 0x15870c

runStatsBase = runStatsAddress[1]
floorAddress = 0x158930
huntAGhostTaskAddress = 0x1589d2
gameModeAddress = 0x1589de
healTheRatQueenTaskAddress = 0x1589ec
warpScrollSkillFactorAddress = 0x1589f2
luckyCharmSkillFactorAddress = 0x1589f4
finalRankSkillFactorAddress = 0x1589f8
secretEndingAddress = 0x1589fe
ringOfPowerSkillFactorAddress = 0x158a02
player1StepsAddress = 0x158a08
defeatTheBlackGolemTaskAddress = 0x158a10
hoursElapsedAddress = 0x158a12
releaseTheFairiesTaskAddress = 0x158a14
menuAddress = 0x158a18
minutesElapsedAddress = 0x158a20
defeatTheDoppelgangersTaskAddress = 0x158a22
secondsElapsedAddress = 0x158a24
unlockableSecondsRemainingAddress = 0x158a2a
helpYourAlliesTaskAddress = 0x158a2c
player4StepsAddress = 0x158a30
player3StepsAddress = 0x158a3c
player2StepsAddress = 0x158a48
findTheTreasureTaskAddress = 0x158a58
unlockableMinutesRemainingAddress = 0x158a5c
classPromotionTaskAddress = 0x158a5e
player2KillsAddress = 0x158a70
player3KillsAddress = 0x158a72
player1KillsAddress = 0x158a74
player4KillsAddress = 0x158a76
messageAddress = 0x158a80

scoreboardBase = scoreboardAddress[1]
difficultyAddress = 0x160d36

///Offsets

featureLoadPointerOffset = 0xffffffd0

itemOffset = 0x28

coinsOffset = 0x1c8
levelOffset = 0x1c4
obtainedItemOffset = 0x1bc

debugModeOffset = debugModeAddress - gameStateBase
extraModeOffset = extraModeAddress - gameStateBase
optionsMenuOffset = optionsMenuAddress - gameStateBase
player1Offset = player1Address - gameStateBase
player2Offset = player2Address - gameStateBase
player3Offset = player3Address - gameStateBase
player4Offset = player4Address - gameStateBase

classPromotionTaskOffset = classPromotionTaskAddress - runStatsBase
defeatTheBlackGolemTaskOffset = defeatTheBlackGolemTaskAddress - runStatsBase
defeatTheDoppelgangersTaskOffset = defeatTheDoppelgangersTaskAddress - runStatsBase
finalRankSkillFactorOffset = finalRankSkillFactorAddress - runStatsBase
findTheTreasureTaskOffset = findTheTreasureTaskAddress - runStatsBase
floorOffset = floorAddress - runStatsBase
gameModeOffset = gameModeAddress - runStatsBase
hoursElapsedOffset = hoursElapsedAddress - runStatsBase
menuOffset = menuAddress - runStatsBase
messageOffset = messageAddress - runStatsBase
healTheRatQueenTaskOffset = healTheRatQueenTaskAddress - runStatsBase
helpYourAlliesTaskOffset = helpYourAlliesTaskAddress - runStatsBase
huntAGhostTaskOffset = huntAGhostTaskAddress - runStatsBase
luckyCharmSkillFactorOffset = luckyCharmSkillFactorAddress - runStatsBase
minutesElapsedOffset = minutesElapsedAddress - runStatsBase
player1KillsOffset = player1KillsAddress - runStatsBase
player2KillsOffset = player2KillsAddress - runStatsBase
player3KillsOffset = player3KillsAddress - runStatsBase
player4KillsOffset = player4KillsAddress - runStatsBase
player1StepsOffset = player1StepsAddress - runStatsBase
player2StepsOffset = player2StepsAddress - runStatsBase
player3StepsOffset = player3StepsAddress - runStatsBase
player4StepsOffset = player4StepsAddress - runStatsBase
releaseTheFairiesTaskOffset = releaseTheFairiesTaskAddress - runStatsBase
ringOfPowerSkillFactorOffset = ringOfPowerSkillFactorAddress - runStatsBase
secondsElapsedOffset = secondsElapsedAddress - runStatsBase
secretEndingOffset = secretEndingAddress - runStatsBase
unlockableMinutesRemainingOffset = unlockableMinutesRemainingAddress - runStatsBase
unlockableSecondsRemainingOffset = unlockableSecondsRemainingAddress - runStatsBase
warpScrollSkillFactorOffset = warpScrollSkillFactorAddress - runStatsBase
playerKillsOffset = [player1KillsOffset, player2KillsOffset, player3KillsOffset, player4KillsOffset]
playerStepsOffset = [player1StepsOffset, player2StepsOffset, player3StepsOffset, player4StepsOffset]
taskOffset = [findTheTreasureTaskOffset, huntAGhostTaskOffset, defeatTheBlackGolemTaskOffset, releaseTheFairiesTaskOffset, classPromotionTaskOffset, helpYourAlliesTaskOffset, healTheRatQueenTaskOffset, defeatTheDoppelgangersTaskOffset]

difficultyOffset = difficultyAddress - scoreboardBase

///Constants

A = 3
AAAplus = 8
assortedBooks = 0x22
archer = 4
artBooks = 0x1a
blackKnight = 5
blueCharm = 58
classPromotionTask = 5
computerProgrammingBooks = 0x1f
cursed = 6
defeatTheBlackGolemTask = 3
defeatTheDoppelgangersTask = 8
en = 1
escapeTheBlaze = 2
fantasyNovels = 0x1e
feather = 70
fighter = 3
findTheTreasureTask = 1
forbiddenBow = 72
hard = 2
healTheRatQueenTask = 7
helpYourAlliesTask = 6
historyBooks = 0x1c
huntAGhostTask = 2
knight = 1
magicBall = 71
mangas = 0x1b
newGame = 0
normal = 1
politicsAndHumorBooks = 0x21
raidAtNight = 3
releaseTheFairiesTask = 4
romanticNovels = 0x19
scienceBooks = 0x1d
scienceFictionNovels = 0x20
select = 0
shuriken = 69
training = 1
tea = 57
treasureHunt = 4
tu = 5
wizard = 2
wizardryBook = 0x2c

///Achievement Functions

function AAAplusRank(lang) {
	
	sum = 0
	for i in range(0, 7) {
	
		sum = sum + byte(runStatsAddress[lang] + taskOffset[i])
	}
	
	return sum == AAAplus
}
function beatTheGame(lang) => __ornext(prev(byte(gameStateAddress[lang])) == 0 || prev(byte(gameStateAddress[lang])) == 4) && byte(gameStateAddress[lang]) == 0xf && prev(byte(runStatsAddress[lang] + menuOffset)) == 1 && byte(runStatsAddress[lang] + menuOffset) == 0xa
function character(lang, char) => __ornext(byte(gameStateAddress[lang] + player1Offset) == char || byte(gameStateAddress[lang] + player2Offset) == char || byte(gameStateAddress[lang] + player3Offset) == char || byte(gameStateAddress[lang] + player4Offset) == char)
function clearTask(lang, task) => prev(byte(runStatsAddress[lang] + taskOffset[task - 1])) == 0 && byte(runStatsAddress[lang] + taskOffset[task - 1]) == 1
function clearUnlockable(lang) => __ornext(prev(byte(gameStateAddress[lang])) == 0 || prev(byte(gameStateAddress[lang])) == 4) && byte(gameStateAddress[lang]) == 0xf && prev(byte(runStatsAddress[lang] + menuOffset)) == 1 && byte(runStatsAddress[lang] + menuOffset) == 9
function coins(lang) => dword(tbyte(characterPointerAddress[lang]) + coinsOffset)
function extraMode(lang) {

	if (lang == tu) return byte(turkishExtraModeAddress) == 1
	else return byte(gameStateAddress[lang] + extraModeOffset) == 1
}
function floor100Shortcut(lang) => word(runStatsAddress[lang] + floorOffset) - prev(word(runStatsAddress[lang] + floorOffset)) > 1 && word(runStatsAddress[lang] + floorOffset) == 100
function fullGame(lang) => tbyte(tbyte(bootMenuPointerAddress) + featureLoadPointerOffset) == featureLoadPointerAddress[lang]
function gameMode(lang, mode) => byte(runStatsAddress[lang] + gameModeOffset) == mode
function inGame(lang) => __ornext(byte(gameStateAddress[lang]) == 0 || byte(gameStateAddress[lang]) == 4)
function levelUpTo(lang, lv) => word(tbyte(characterPointerAddress[lang]) + levelOffset) > prev(word(tbyte(characterPointerAddress[lang]) + levelOffset)) && word(tbyte(characterPointerAddress[lang]) + levelOffset) == lv
function maxSkill(lang) => coins(lang) >= 100 && byte(runStatsAddress[lang] + warpScrollSkillFactorOffset) == 0 && byte(runStatsAddress[lang] + luckyCharmSkillFactorOffset) == 0 && minRank(lang, A) && byte(runStatsAddress[lang] + ringOfPowerSkillFactorOffset) == 0
function minDifficulty(lang, diff) => byte(scoreboardAddress[lang] + difficultyOffset) >= diff
function minRank(lang, rank) {

	sum = 0
	for i in range(0, 7) {
	
		sum = sum + byte(runStatsAddress[lang] + taskOffset[i])
	}
	
	return sum >= rank
}
function noDebugMode(lang) {

	if (lang == en) //Debug mode is only available in English
		
		return byte(gameStateAddress[lang] + debugModeOffset) == 0
		
	else
		
		return always_true()
}
function obtainItem(lang, item) => tbyte(tbyte(tbyte(characterPointerAddress[lang]) + obtainedItemOffset)) != prev(tbyte(tbyte(tbyte(characterPointerAddress[lang]) + obtainedItemOffset))) && tbyte(tbyte(tbyte(characterPointerAddress[lang]) + obtainedItemOffset)) == itemAddress[lang] + item*itemOffset
function onePlayer(lang) => byte(gameStateAddress[lang] + player1Offset)/byte(gameStateAddress[lang] + player1Offset) + byte(gameStateAddress[lang] + player2Offset)/byte(gameStateAddress[lang] + player2Offset) + byte(gameStateAddress[lang] + player3Offset)/byte(gameStateAddress[lang] + player3Offset) + byte(gameStateAddress[lang] + player4Offset)/byte(gameStateAddress[lang] + player4Offset) == 1
function optionsMenu(lang) {
	
	if (lang == tu) return byte(turkishOptionsMenuAddress) //Turkish has weird inconsistencies
	else return byte(gameStateAddress[lang] + optionsMenuOffset)
}
function readMessage(lang, msg) => prev(byte(gameStateAddress[lang])) == 0 && byte(gameStateAddress[lang]) == 4 && byte(runStatsAddress[lang]) > prev(byte(runStatsAddress[lang])) && byte(runStatsAddress[lang] + messageOffset) != prev(byte(runStatsAddress[lang] + messageOffset)) && byte(runStatsAddress[lang] + messageOffset) == msg
function requiredDifficulty(lang, diff) => byte(scoreboardAddress[lang] + difficultyOffset) == diff
function secretEnding(lang) => prev(byte(runStatsAddress[lang] + secretEndingOffset)) == 0 && byte(runStatsAddress[lang] + secretEndingOffset) == 1

///Leaderboard Functions

function IGT(lang) => word(runStatsAddress[lang] + hoursElapsedOffset)*3600 + byte(runStatsAddress[lang] + minutesElapsedOffset)*60 + byte(runStatsAddress[lang] + secondsElapsedOffset)
function unlockableIGT(lang) => byte(runStatsAddress[lang] + unlockableMinutesRemainingOffset)*60 + byte(runStatsAddress[lang] + unlockableSecondsRemainingOffset)
function playerSteps(lang, player) => word(runStatsAddress[lang] + playerStepsOffset[player])
function playerKills(lang, player) => word(runStatsAddress[lang] + playerKillsOffset[player])

///Trigger Functions

function commonMinDifficulty(lang, mode) => fullGame(lang) && minDifficulty(lang, normal) && gameMode(lang, mode) && onePlayer(lang) && noDebugMode(lang)
function commonRequiredDifficulty(lang, mode, diff) => fullGame(lang) && requiredDifficulty(lang, diff) && gameMode(lang, mode) && onePlayer(lang) && noDebugMode(lang)

function trainingTrigger(lang) => fullGame(lang) && once(prev(byte(runStatsAddress[lang] + gameModeOffset)) == 0 && byte(runStatsAddress[lang] + gameModeOffset) == 1 && never(byte(runStatsAddress[lang] + gameModeOffset) != 1 || bit(select, inputAddress[lang] + 1) == 1)) && trigger_when(prev(byte(trainingSectionAddress[lang])) == 29 && byte(trainingSectionAddress[lang]) == 30)
function clearTaskTrigger(lang, task) => commonMinDifficulty(lang, newGame) && inGame(lang) && clearTask(lang, task)
function clearClassPromotionTaskTrigger(lang, character) => clearTaskTrigger(lang, classPromotionTask) && character(lang, character)
function levelUpTo20Trigger(lang) => commonMinDifficulty(lang, newGame) && inGame(lang) && levelUpTo(lang, 20)
function obtainItemTrigger(lang, item) => commonMinDifficulty(lang, newGame) && inGame(lang) && obtainItem(lang, item)
function obtainCharacterItemTrigger(lang, char, item) => obtainItemTrigger(lang, item) && character(lang, char)
function readMessageTrigger(lang, msg) => commonMinDifficulty(lang, newGame) && readMessage(lang, msg)
function floor100ShortcutTrigger(lang) => commonMinDifficulty(lang, newGame) && inGame(lang) && floor100Shortcut(lang)
function beatTheGameTrigger(lang, diff) => commonMinDifficulty(lang, newGame) && beatTheGame(lang)
function requiredDifficultyBeatTheGameTrigger(lang, diff) => commonRequiredDifficulty(lang, newGame, diff) && beatTheGame(lang)
function normalKnightBeatTheGameTrigger(lang) => requiredDifficultyBeatTheGameTrigger(lang, normal) && character(lang, knight)
function normalWizardBeatTheGameTrigger(lang) => requiredDifficultyBeatTheGameTrigger(lang, normal) && character(lang, wizard)
function normalFighterBeatTheGameTrigger(lang) => requiredDifficultyBeatTheGameTrigger(lang, normal) && character(lang, fighter)
function normalArcherBeatTheGameTrigger(lang) => requiredDifficultyBeatTheGameTrigger(lang, normal) && character(lang, archer)
function AAAplusBeatTheGameTrigger(lang) => beatTheGameTrigger(lang, normal) && AAAplusRank(lang)
function secretEndingBeatTheGameTrigger(lang) => beatTheGameTrigger(lang, normal) && secretEnding(lang)
function maxSkillBeatTheGameTrigger(lang) => beatTheGameTrigger(lang, normal) && maxSkill(lang)
function extraNormalBeatTheGameTrigger(lang, normal) => requiredDifficultyBeatTheGameTrigger(lang, normal) && extraMode(lang)
function extraHardBeatTheGameTrigger(lang) => requiredDifficultyBeatTheGameTrigger(lang, hard) && extraMode(lang)
function clearUnlockableTrigger(lang, unlk) => commonMinDifficulty(lang, unlk) && clearUnlockable(lang)
function requiredDifficultyClearUnlockableTrigger(lang, unlk, diff) => commonRequiredDifficulty(lang, unlk, diff) && clearUnlockable(lang)
function clearEscapeTheBlazeTrigger(lang) => clearUnlockableTrigger(lang, escapeTheBlaze)
function clearRaidAtNightTrigger(lang) => clearUnlockableTrigger(lang, raidAtNight)
function clearTreasureHuntTrigger(lang) => clearUnlockableTrigger(lang, treasureHunt)
function clearNormalBlackKnightTrigger(lang) => requiredDifficultyClearUnlockableTrigger(lang, blackKnight, normal)
function clearHardBlackKnightTrigger(lang) => requiredDifficultyClearUnlockableTrigger(lang, blackKnight, hard)
function doubleBlackKnightTrigger(lang) => fullGame(lang) && byte(gameStateAddress[lang] + player1Offset) == 1 && byte(gameStateAddress[lang] + player2Offset) == 1 && gameMode(lang, blackKnight) && prev(byte(gameStateAddress[lang])) == 0xf && byte(gameStateAddress[lang]) == 0 && prev(byte(runStatsAddress[lang] + menuOffset)) == 8 && byte(runStatsAddress[lang] + menuOffset) == 1
function clearCursedTrigger(lang) => clearUnlockableTrigger(lang, cursed) && minDifficulty(lang, normal)
function artGalleryTrigger(lang) => repeated(10, never(tbyte(tbyte(bootMenuPointerAddress) + featureLoadPointerOffset) != featureLoadPointerAddress[lang] || byte(gameStateAddress[lang]) != 0xf || byte(runStatsAddress[lang] + menuOffset) != 4) && optionsMenu(lang) == 3)
function BGMMenuTrigger(lang) => repeated(10, never(tbyte(tbyte(bootMenuPointerAddress) + featureLoadPointerOffset) != featureLoadPointerAddress[lang] || byte(gameStateAddress[lang]) != 0xf || optionsMenu(lang) != 1) && byte(runStatsAddress[lang] + menuOffset) == 0xe)
function SFXMenuTrigger(lang) => repeated(10, never(tbyte(tbyte(bootMenuPointerAddress) + featureLoadPointerOffset) != featureLoadPointerAddress[lang] || byte(gameStateAddress[lang]) != 0xf || optionsMenu(lang) != 1) && byte(runStatsAddress[lang] + menuOffset) == 0xd)
function textureViewerTrigger(lang) => repeated(10, never(tbyte(tbyte(bootMenuPointerAddress) + featureLoadPointerOffset) != featureLoadPointerAddress[lang] || byte(gameStateAddress[lang]) != 0xf || optionsMenu(lang) != 2) && byte(runStatsAddress[lang] + menuOffset) == 0xf)

watchThePromoVideoAchievementTrigger = never(tbyte(tbyte(bootMenuPointerAddress) + featureLoadPointerOffset) != promoVideoFeatureLoadPointerAddress) && repeated(35250, tbyte(promoVideoPointerAddress) == activeVideoAddress)
beatTheBetaAchievementTrigger = tbyte(tbyte(bootMenuPointerAddress) + featureLoadPointerOffset) == betaFeatureLoadPointerAddress && prev(byte(betaGameStateAddress)) == 0 && byte(betaGameStateAddress) == 0x27
trainingAchievementTrigger = always_false()
findTheTreasureTaskAchievementTrigger = always_false()
huntAGhostTaskAchievementTrigger = always_false()
defeatTheBlackGolemTaskAchievementTrigger = always_false()
releaseTheFairiesTaskAchievementTrigger = always_false()
knightClassPromotionTaskAchievementTrigger = always_false()
wizardClassPromotionTaskAchievementTrigger = always_false()
fighterClassPromotionTaskAchievementTrigger = always_false()
archerClassPromotionTaskAchievementTrigger = always_false()
helpYourAlliesTaskAchievementTrigger = always_false()
healTheRatQueenTaskAchievementTrigger = always_false()
defeatTheDoppelgangersTaskAchievementTrigger = always_false()
levelUpTo20AchievementTrigger = always_false()
obtainTeaAchievementTrigger = always_false()
obtainBlueCharmAchievementTrigger = always_false()
obtainFeatherAchievementTrigger = always_false()
obtainMagicBallAchievementTrigger = always_false()
obtainShurikenAchievementTrigger = always_false()
obtainForbiddenBowAchievementTrigger = always_false()
readRomanticNovelsAchievementTrigger = always_false()
readArtBooksAchievementTrigger = always_false()
readMangasAchievementTrigger = always_false()
readHistoryBooksAchievementTrigger = always_false()
readScienceBooksAchievementTrigger = always_false()
readFantasyNovelsAchievementTrigger = always_false()
readComputerProgrammingBooksAchievementTrigger = always_false()
readScienceFictionNovelsAchievementTrigger = always_false()
readPoliticsAndHumorBooksAchievementTrigger = always_false()
readAssortedBooksAchievementTrigger = always_false()
readWizardryBookAchievementTrigger = always_false()
floor100ShortcutAchievementTrigger = always_false()
beatTheGameAchievementTrigger = always_false()
normalKnightBeatTheGameAchievementTrigger = always_false()
normalWizardBeatTheGameAchievementTrigger = always_false()
normalFighterBeatTheGameAchievementTrigger = always_false()
normalArcherBeatTheGameAchievementTrigger = always_false()
hardBeatTheGameAchievementTrigger = always_false()
AAAplusBeatTheGameAchievementTrigger = always_false()
secretEndingBeatTheGameAchievementTrigger = always_false()
maxSkillBeatTheGameAchievementTrigger = always_false()
extraNormalBeatTheGameAchievementTrigger = always_false()
extraHardBeatTheGameAchievementTrigger = always_false()
clearEscapeTheBlazeAchievementTrigger = always_false()
clearRaidAtNightAchievementTrigger = always_false()
clearTreasureHuntAchievementTrigger = always_false()
clearNormalBlackKnightAchievementTrigger = always_false()
clearHardBlackKnightAchievementTrigger = always_false()
doubleBlackKnightAchievementTrigger = always_false()
clearCursedAchievementTrigger = always_false()
artGalleryAchievementTrigger = always_false()
BGMMenuAchievementTrigger = always_false()
SFXMenuAchievementTrigger = always_false()
textureViewerAchievementTrigger = always_false()

IGTValue = []
unlockableIGTValue = []
coinsValue = []
playerStepsValue = []
playerKillsValue = []

for lang in range(0, 5) {

	trainingAchievementTrigger = trainingAchievementTrigger || trainingTrigger(lang)
	findTheTreasureTaskAchievementTrigger = findTheTreasureTaskAchievementTrigger || clearTaskTrigger(lang, findTheTreasureTask)
	huntAGhostTaskAchievementTrigger = huntAGhostTaskAchievementTrigger || clearTaskTrigger(lang, huntAGhostTask)
	defeatTheBlackGolemTaskAchievementTrigger = defeatTheBlackGolemTaskAchievementTrigger || clearTaskTrigger(lang, defeatTheBlackGolemTask)
	releaseTheFairiesTaskAchievementTrigger = releaseTheFairiesTaskAchievementTrigger || clearTaskTrigger(lang, releaseTheFairiesTask)
	knightClassPromotionTaskAchievementTrigger = knightClassPromotionTaskAchievementTrigger || clearClassPromotionTaskTrigger(lang, knight)
	wizardClassPromotionTaskAchievementTrigger = wizardClassPromotionTaskAchievementTrigger || clearClassPromotionTaskTrigger(lang, wizard)
	fighterClassPromotionTaskAchievementTrigger = fighterClassPromotionTaskAchievementTrigger || clearClassPromotionTaskTrigger(lang, fighter)
	archerClassPromotionTaskAchievementTrigger = archerClassPromotionTaskAchievementTrigger || clearClassPromotionTaskTrigger(lang, archer)
	helpYourAlliesTaskAchievementTrigger = helpYourAlliesTaskAchievementTrigger || clearTaskTrigger(lang, helpYourAlliesTask)
	healTheRatQueenTaskAchievementTrigger = healTheRatQueenTaskAchievementTrigger || clearTaskTrigger(lang, healTheRatQueenTask)
	defeatTheDoppelgangersTaskAchievementTrigger = defeatTheDoppelgangersTaskAchievementTrigger || clearTaskTrigger(lang, defeatTheDoppelgangersTask)
	levelUpTo20AchievementTrigger = levelUpTo20AchievementTrigger || levelUpTo20Trigger(lang)
	obtainTeaAchievementTrigger = obtainTeaAchievementTrigger || obtainItemTrigger(lang, tea)
	obtainBlueCharmAchievementTrigger = obtainBlueCharmAchievementTrigger || obtainItemTrigger(lang, blueCharm)
	obtainFeatherAchievementTrigger = obtainFeatherAchievementTrigger || obtainCharacterItemTrigger(lang, knight, feather)
	obtainMagicBallAchievementTrigger = obtainMagicBallAchievementTrigger || obtainCharacterItemTrigger(lang, wizard, magicBall)
	obtainShurikenAchievementTrigger = obtainShurikenAchievementTrigger || obtainCharacterItemTrigger(lang, fighter, shuriken)
	obtainForbiddenBowAchievementTrigger = obtainForbiddenBowAchievementTrigger || obtainCharacterItemTrigger(lang, archer, forbiddenBow)
	readRomanticNovelsAchievementTrigger = readRomanticNovelsAchievementTrigger || readMessageTrigger(lang, romanticNovels)
	readArtBooksAchievementTrigger = readArtBooksAchievementTrigger || readMessageTrigger(lang, artBooks)
	readMangasAchievementTrigger = readMangasAchievementTrigger || readMessageTrigger(lang, mangas)
	readHistoryBooksAchievementTrigger = readHistoryBooksAchievementTrigger || readMessageTrigger(lang, historyBooks)
	readScienceBooksAchievementTrigger = readScienceBooksAchievementTrigger || readMessageTrigger(lang, scienceBooks)
	readFantasyNovelsAchievementTrigger = readFantasyNovelsAchievementTrigger || readMessageTrigger(lang, fantasyNovels)
	readComputerProgrammingBooksAchievementTrigger = readComputerProgrammingBooksAchievementTrigger || readMessageTrigger(lang, computerProgrammingBooks)
	readScienceFictionNovelsAchievementTrigger = readScienceFictionNovelsAchievementTrigger || readMessageTrigger(lang, scienceFictionNovels)
	readPoliticsAndHumorBooksAchievementTrigger = readPoliticsAndHumorBooksAchievementTrigger || readMessageTrigger(lang, politicsAndHumorBooks)
	readAssortedBooksAchievementTrigger = readAssortedBooksAchievementTrigger || readMessageTrigger(lang, assortedBooks)
	readWizardryBookAchievementTrigger = readWizardryBookAchievementTrigger || readMessageTrigger(lang, wizardryBook) && gameMode(lang, newGame)
	floor100ShortcutAchievementTrigger = floor100ShortcutAchievementTrigger || floor100ShortcutTrigger(lang)
	beatTheGameAchievementTrigger = beatTheGameAchievementTrigger || requiredDifficultyBeatTheGameTrigger(lang, normal)
	normalKnightBeatTheGameAchievementTrigger = normalKnightBeatTheGameAchievementTrigger || normalKnightBeatTheGameTrigger(lang)
	normalWizardBeatTheGameAchievementTrigger = normalWizardBeatTheGameAchievementTrigger || normalWizardBeatTheGameTrigger(lang)
	normalFighterBeatTheGameAchievementTrigger = normalFighterBeatTheGameAchievementTrigger || normalFighterBeatTheGameTrigger(lang)
	normalArcherBeatTheGameAchievementTrigger = normalArcherBeatTheGameAchievementTrigger || normalArcherBeatTheGameTrigger(lang)
	hardBeatTheGameAchievementTrigger = hardBeatTheGameAchievementTrigger || requiredDifficultyBeatTheGameTrigger(lang, hard)
	AAAplusBeatTheGameAchievementTrigger = AAAplusBeatTheGameAchievementTrigger || AAAplusBeatTheGameTrigger(lang)
	secretEndingBeatTheGameAchievementTrigger = secretEndingBeatTheGameAchievementTrigger || secretEndingBeatTheGameTrigger(lang)
	maxSkillBeatTheGameAchievementTrigger = maxSkillBeatTheGameAchievementTrigger || maxSkillBeatTheGameTrigger(lang)
	extraNormalBeatTheGameAchievementTrigger = extraNormalBeatTheGameAchievementTrigger || extraNormalBeatTheGameTrigger(lang, normal)
	extraHardBeatTheGameAchievementTrigger = extraHardBeatTheGameAchievementTrigger || extraHardBeatTheGameTrigger(lang)
	clearEscapeTheBlazeAchievementTrigger = clearEscapeTheBlazeAchievementTrigger || clearEscapeTheBlazeTrigger(lang)
	clearRaidAtNightAchievementTrigger = clearRaidAtNightAchievementTrigger || clearRaidAtNightTrigger(lang)
	clearTreasureHuntAchievementTrigger = clearTreasureHuntAchievementTrigger || clearTreasureHuntTrigger(lang)
	clearNormalBlackKnightAchievementTrigger = clearNormalBlackKnightAchievementTrigger || clearNormalBlackKnightTrigger(lang)
	clearHardBlackKnightAchievementTrigger  = clearHardBlackKnightAchievementTrigger || clearHardBlackKnightTrigger(lang)
	doubleBlackKnightAchievementTrigger = doubleBlackKnightAchievementTrigger || doubleBlackKnightTrigger(lang)
	clearCursedAchievementTrigger = clearCursedAchievementTrigger || clearCursedTrigger(lang)
	artGalleryAchievementTrigger = artGalleryAchievementTrigger || artGalleryTrigger(lang)
	BGMMenuAchievementTrigger = BGMMenuAchievementTrigger || BGMMenuTrigger(lang)
	SFXMenuAchievementTrigger = SFXMenuAchievementTrigger || SFXMenuTrigger(lang)
	textureViewerAchievementTrigger = textureViewerAchievementTrigger || textureViewerTrigger(lang)
	
	array_push(IGTValue, measured(IGT(lang), when = fullGame(lang)))
	array_push(unlockableIGTValue, measured(unlockableIGT(lang), when = fullGame(lang)))
	array_push(coinsValue, measured(coins(lang), when = fullGame(lang)))
	for player in range(0, 3) {
	
		array_push(playerKillsValue, measured(playerKills(lang, player), when = fullGame(lang)))
		array_push(playerStepsValue, measured(playerSteps(lang, player), when = fullGame(lang)))
	}
}

IGTLeaderboardValue = max_of(IGTValue[0], IGTValue[1], IGTValue[2], IGTValue[3], IGTValue[4], IGTValue[5])
unlockableIGTLeaderboardValue = max_of(unlockableIGTValue[0], unlockableIGTValue[1], unlockableIGTValue[2], unlockableIGTValue[3], unlockableIGTValue[4], unlockableIGTValue[5])
coinsLeaderboardValue = max_of(coinsValue[0], coinsValue[1], coinsValue[2], coinsValue[3], coinsValue[4], coinsValue[5])
playerKillsLeaderboardValue = max_of(playerKillsValue[0], playerKillsValue[1], playerKillsValue[2], playerKillsValue[3], playerKillsValue[4], playerKillsValue[5], 
									 playerKillsValue[6], playerKillsValue[7], playerKillsValue[8], playerKillsValue[9], playerKillsValue[10], playerKillsValue[11], 
									 playerKillsValue[12], playerKillsValue[13], playerKillsValue[14], playerKillsValue[15], playerKillsValue[16], playerKillsValue[17],
									 playerKillsValue[18], playerKillsValue[19], playerKillsValue[20], playerKillsValue[21], playerKillsValue[22], playerKillsValue[23])
playerStepsLeaderboardValue = max_of(playerStepsValue[0], playerStepsValue[1], playerStepsValue[2], playerStepsValue[3], playerStepsValue[4], playerStepsValue[5], 
									 playerStepsValue[6], playerStepsValue[7], playerStepsValue[8], playerStepsValue[9], playerStepsValue[10], playerStepsValue[11], 
									 playerStepsValue[12], playerStepsValue[13], playerStepsValue[14], playerStepsValue[15], playerStepsValue[16], playerStepsValue[17],
									 playerStepsValue[18], playerStepsValue[19], playerStepsValue[20], playerStepsValue[21], playerStepsValue[22], playerStepsValue[23])

///Achievements

achievement(
	title = "Magic Masterpiece",
	description = "Watch the entire promotional video for the original game",
	points = 1,
	trigger = watchThePromoVideoAchievementTrigger
)

achievement(
	title = "Lost & Found",
	description = "Beat the original 1998 beta version of the game",
	points = 10,
	trigger = beatTheBetaAchievementTrigger
)

achievement(
	title = "Take Up Your Arms",
	description = "Clear training without skipping a section",
	points = 5,
	trigger = trainingAchievementTrigger
)

achievement(
	title = "Find the Treasure",
	description = "Clear the Find the Treasure task",
	points = 10,
	trigger = findTheTreasureTaskAchievementTrigger
)

achievement(
	title = "Hunt a Ghost",
	description = "Clear the Hunt a Ghost task",
	points = 10,
	trigger = huntAGhostTaskAchievementTrigger
)

achievement(
	title = "Defeat the Black Golem",
	description = "Clear the Defeat the Black Golem task",
	points = 10,
	trigger = defeatTheBlackGolemTaskAchievementTrigger
)

achievement(
	title = "Release the Fairies",
	description = "Clear the Release the Fairies task",
	points = 10,
	trigger = releaseTheFairiesTaskAchievementTrigger
)

achievement(
	title = "Holy Knight",
	description = "Clear the Class Promotion task as the Knight",
	points = 10,
	trigger = knightClassPromotionTaskAchievementTrigger
)

achievement(
	title = "Monk",
	description = "Clear the Class Promotion task as the Wizard",
	points = 10,
	trigger = wizardClassPromotionTaskAchievementTrigger
)

achievement(
	title = "Ninja",
	description = "Clear the Class Promotion task as the Fighter",
	points = 10,
	trigger = fighterClassPromotionTaskAchievementTrigger
)

achievement(
	title = "Thief",
	description = "Clear the Class Promotion task as the Archer",
	points = 10,
	trigger = archerClassPromotionTaskAchievementTrigger
)

achievement(
	title = "Help Your Allies",
	description = "Clear the Help Your Allies task",
	points = 25,
	trigger = helpYourAlliesTaskAchievementTrigger
)

achievement(
	title = "Heal the Rat Queen",
	description = "Clear the Heal the Rat Queen task",
	points = 25,
	trigger = healTheRatQueenTaskAchievementTrigger
)

achievement(
	title = "Defeat the Doppelgangers",
	description = "Clear the Defeat the Doppelgangers task",
	points = 25,
	trigger = defeatTheDoppelgangersTaskAchievementTrigger
)

achievement(
	title = "Dopamine Deposition",
	description = "Level up to 20",
	points = 10,
	trigger = levelUpTo20AchievementTrigger
)

achievement(
	title = "Drink of Choice",
	description = "Obtain Tea",
	points = 10,
	trigger = obtainTeaAchievementTrigger
)

achievement(
	title = "Prelude of Light",
	description = "Obtain a Blue Charm",
	points = 10,
	trigger = obtainBlueCharmAchievementTrigger
)

achievement(
	title = "Weight Loss Supplement",
	description = "Obtain a Feather as the Knight",
	points = 10,
	trigger = obtainFeatherAchievementTrigger
)

achievement(
	title = "Catch This",
	description = "Obtain a Magic Ball as the Wizard",
	points = 10,
	trigger = obtainMagicBallAchievementTrigger
)

achievement(
	title = "Hidden Blade",
	description = "Obtain a Shuriken as the Fighter",
	points = 10,
	trigger = obtainShurikenAchievementTrigger
)

achievement(
	title = "Trigger Finger",
	description = "Obtain a Forbidden Bow as the Archer",
	points = 10,
	trigger = obtainForbiddenBowAchievementTrigger
)

achievement(
	title = "Icha Icha Paradise",
	description = "Read romantic novels",
	points = 5,
	trigger = readRomanticNovelsAchievementTrigger
)

achievement(
	title = "Student of the Arts",
	description = "Read art books",
	points = 5,
	trigger = readArtBooksAchievementTrigger
)

achievement(
	title = "Drawn to Life",
	description = "Read mangas",
	points = 5,
	trigger = readMangasAchievementTrigger
)

achievement(
	title = "History Buff",
	description = "Read history books",
	points = 5,
	trigger = readHistoryBooksAchievementTrigger
)

achievement(
	title = "Natural Law",
	description = "Read science books",
	points = 5,
	trigger = readScienceBooksAchievementTrigger
)

achievement(
	title = "Imaginary Instantiation",
	description = "Read fantasy novels",
	points = 5,
	trigger = readFantasyNovelsAchievementTrigger
)

achievement(
	title = "Hello World",
	description = "Read computer programming books",
	points = 5,
	trigger = readComputerProgrammingBooksAchievementTrigger
)

achievement(
	title = "What Could Have Been",
	description = "Read science fiction novels",
	points = 5,
	trigger = readScienceFictionNovelsAchievementTrigger
)

achievement(
	title = "One and the Same",
	description = "Read politics and humor books",
	points = 5,
	trigger = readPoliticsAndHumorBooksAchievementTrigger
)

achievement(
	title = "Renaissance Man",
	description = "Read assorted books",
	points = 5,
	trigger = readAssortedBooksAchievementTrigger
)

achievement(
	title = "Light the Way",
	description = "Read A Wizardry Book",
	points = 10,
	trigger = readWizardryBookAchievementTrigger
)

achievement(
	title = "Make a Wish",
	description = "Take a shortcut to floor 100",
	points = 10,
	trigger = floor100ShortcutAchievementTrigger
)

achievement(
	title = "Well Done",
	description = "Beat the game",
	points = 25,
	trigger = beatTheGameAchievementTrigger
)

achievement(
	title = "Paladin",
	description = "Beat the game as the Knight on normal difficulty",
	points = 10,
	trigger = normalKnightBeatTheGameAchievementTrigger
)

achievement(
	title = "Archmage",
	description = "Beat the game as the Wizard on normal difficulty",
	points = 10,
	trigger = normalWizardBeatTheGameAchievementTrigger
)

achievement(
	title = "Champion",
	description = "Beat the game as the Fighter on normal difficulty",
	points = 10,
	trigger = normalFighterBeatTheGameAchievementTrigger
)

achievement(
	title = "Sniper",
	description = "Beat the game as the Archer on normal difficulty",
	points = 10,
	trigger = normalArcherBeatTheGameAchievementTrigger
)

achievement(
	title = "Conquer the Hoard",
	description = "Beat the game on hard difficulty",
	points = 25,
	trigger = hardBeatTheGameAchievementTrigger
)

achievement(
	title = "Awesome",
	description = "Beat the game with an AAA+ rank",
	points = 50,
	trigger = AAAplusBeatTheGameAchievementTrigger
)

achievement(
	title = "Amazing",
	description = "Find the secret ending",
	points = 100,
	trigger = secretEndingBeatTheGameAchievementTrigger
)

achievement(
	title = "Professional Plunderer",
	description = "Beat the game with a five-star skill rating",
	points = 50,
	trigger = maxSkillBeatTheGameAchievementTrigger
)

achievement(
	title = "Ward for the Hoard",
	description = "Beat the game on extra normal difficulty",
	points = 25,
	trigger = extraNormalBeatTheGameAchievementTrigger
)

achievement(
	title = "Breeding Bulwark",
	description = "Beat the game on extra hard difficulty",
	points = 25,
	trigger = extraHardBeatTheGameAchievementTrigger
)

achievement(
	title = "Escape the Blaze",
	description = "Clear the Escape the Blaze unlockable",
	points = 10,
	trigger = clearEscapeTheBlazeAchievementTrigger
)

achievement(
	title = "Raid at Night",
	description = "Clear the Raid at Night unlockable",
	points = 10,
	trigger = clearRaidAtNightAchievementTrigger
)

achievement(
	title = "Treasure Hunt",
	description = "Clear the Treasure Hunt unlockable",
	points = 10,
	trigger = clearTreasureHuntAchievementTrigger
)

achievement(
	title = "Dark Knight",
	description = "Clear the Black Knight unlockable on normal difficulty",
	points = 10,
	trigger = clearNormalBlackKnightAchievementTrigger
)

achievement(
	title = "Azure Knight",
	description = "Clear the Black Knight unlockable on hard difficulty",
	points = 10,
	trigger = clearHardBlackKnightAchievementTrigger
)

achievement(
	title = "Kage Bunshin No Jutsu",
	description = "Get help from another knight in the Black Knight unlockable",
	points = 5,
	trigger = doubleBlackKnightAchievementTrigger
)

achievement(
	title = "Cursed",
	description = "Clear the Cursed unlockable",
	points = 10,
	trigger = clearCursedAchievementTrigger
)

achievement(
	title = "Self-Portrait From Ninety-Eight",
	description = "Find a hidden art gallery",
	points = 1,
	trigger = artGalleryAchievementTrigger
)

achievement(
	title = "Hosoi Hymns",
	description = "Find a hidden BGM player",
	points = 1,
	trigger = BGMMenuAchievementTrigger
)

achievement(
	title = "Soshi Sounds",
	description = "Find a hidden SFX player",
	points = 1,
	trigger = SFXMenuAchievementTrigger
)

achievement(
	title = "Enjoy the View",
	description = "Find a hidden texture viewer",
	points = 1,
	trigger = textureViewerAchievementTrigger
)

///Leaderboards

leaderboard(

	title = "Any% Speedrun (IGT)",
	description = "",
	start = beatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Normal Knight Speedrun",
	description = "",
	start = normalKnightBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Normal Wizard Speedrun",
	description = "",
	start = normalWizardBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Normal Fighter Speedrun",
	description = "",
	start = normalFighterBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Normal Archer Speedrun",
	description = "",
	start = normalArcherBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Hard Speedrun",
	description = "",
	start = hardBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "AAA+ Rank Speedrun",
	description = "",
	start = AAAplusBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Secret Ending Speedrun",
	description = "",
	start = secretEndingBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Five-Star Skill Speedrun",
	description = "",
	start = maxSkillBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Extra Normal Speedrun",
	description = "",
	start = extraNormalBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Extra Hard Speedrun",
	description = "",
	start = extraHardBeatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = IGTLeaderboardValue,
	format = "SECS",
	lower_is_better=true
)

leaderboard(

	title = "Escape the Blaze Speedrun",
	description = "",
	start = clearEscapeTheBlazeAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = unlockableIGTLeaderboardValue,
	format = "SECS",
	lower_is_better=false
)

leaderboard(

	title = "Raid at Night Speedrun",
	description = "",
	start = clearRaidAtNightAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = unlockableIGTLeaderboardValue,
	format = "SECS",
	lower_is_better=false
)

leaderboard(

	title = "Treasure Hunt Speedrun",
	description = "",
	start = clearTreasureHuntAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = unlockableIGTLeaderboardValue,
	format = "SECS",
	lower_is_better=false
)

leaderboard(

	title = "Normal Black Knight Speedrun",
	description = "",
	start = clearNormalBlackKnightAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = unlockableIGTLeaderboardValue,
	format = "SECS",
	lower_is_better=false
)

leaderboard(

	title = "Hard Black Knight Speedrun",
	description = "",
	start = clearHardBlackKnightAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = unlockableIGTLeaderboardValue,
	format = "SECS",
	lower_is_better=false
)

leaderboard(

	title = "Cursed Speedrun",
	description = "",
	start = clearCursedAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = unlockableIGTLeaderboardValue,
	format = "SECS",
	lower_is_better=false
)

leaderboard(

	title = "Most Coins",
	description = "",
	start = beatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = coinsLeaderboardValue,
	format = "VALUE",
	lower_is_better=false
)

leaderboard(

	title = "Least Kills",
	description = "",
	start = beatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = playerKillsLeaderboardValue,
	format = "VALUE",
	lower_is_better=true
)

leaderboard(

	title = "Most Kills",
	description = "",
	start = beatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = playerKillsLeaderboardValue,
	format = "VALUE",
	lower_is_better=false
)

leaderboard(

	title = "Least Steps",
	description = "",
	start = beatTheGameAchievementTrigger,
	cancel = always_false(),
	submit = always_true(),
	value = playerStepsLeaderboardValue,
	format = "VALUE",
	lower_is_better=true
)