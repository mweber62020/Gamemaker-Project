myState = npcState.choiceAsked;
currentLine = 1;

// [npcState][line]
npcText[npcState.choiceAsked][0] = "Hey there! I've got some spare coins. Would you like 10?";

npcText[npcState.choiceYes][0] = "Great! Enjoy the coins, friend.";

npcText[npcState.choiceNo][0] = "Ok, come back whenever.";

// Choice setup
hasChoice = true;
choiceState = npcState.choiceAsked;
choiceLine = 0; // which line (0-indexed) in choiceState triggers the choice
choiceOptions = ["Yes", "No"];
choiceYesState = npcState.choiceYes;
choiceNoState = npcState.choiceNo;
choiceCoinReward = 10;
