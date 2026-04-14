myState = npcState.itemWanted;
arrayIndexOfMyItem = 0;
numNeeded = 5;
currentLine = 1;
// [npcState][line]
npcText[npcState.itemWanted][0] = "Hello. I see you have found your way here. My name is Bob 1";
npcText[npcState.itemWanted][1] = "I'm gonna need your help with something. All my swords ran off.";
npcText[npcState.itemWanted][2] = "Would you mind chasing them down for me? I need at least 5 of them back. Thanks man.";

npcText[npcState.itemGiven][0] = "Wow, I really needed this. I didn't think you would actually find them";
npcText[npcState.itemGiven][1] = "Here, take this for your troubles, im sure you can find a better use for it.";
npcText[npcState.itemGiven][2] = "If you see anything unusual around here, be sure to check it out.";

/*
for (i = 0; i <array_length(npcText); i++)
// i here is the current state
	for (j = 0; j < array_length(npcText[i]); j++) 
	// j here is the line of text in the current state
		show_debug_message(npcText[i][j])
*/
