myState = npcState.itemWanted;
arrayIndexOfMyItem = 0;
numNeeded = 3;
currentLine = 1;
// [npcState][line]
npcText[npcState.itemWanted][0] = "But what if the text to show is really long, like this one? What will happen then I wonder.";
npcText[npcState.itemWanted][1] = "What's that? I have more to say? Cool.";
npcText[npcState.itemWanted][2] = "Woah! Another line of text!";
npcText[npcState.itemWanted][3] = "Here's a fourth.";

npcText[npcState.itemGiven][0] = "Wow, I really needed this.";
npcText[npcState.itemGiven][1] = "I don't need anything else, thank you.";
npcText[npcState.itemGiven][2] = "I said scram.";

/*
for (i = 0; i <array_length(npcText); i++)
// i here is the current state
	for (j = 0; j < array_length(npcText[i]); j++) 
	// j here is the line of text in the current state
		show_debug_message(npcText[i][j])
*/
