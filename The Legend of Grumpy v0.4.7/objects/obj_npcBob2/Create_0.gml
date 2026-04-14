/*for (i=0; i<array_length(customizableTextLines); i++)
{
	basicTextOptions[i] = customizableTextLines[i];
}

for (i=0; i<array_length(dialogueIfItemRecievedCustom); i++)
{
	dialogueIfItemRecieved[i] = dialogueIfItemRecievedCustom[i];
}*/
myState = npcState.itemWanted;
arrayIndexOfMyItem = 1;
numNeeded = 2;
currentLine = 1;
// [npcState][line]
npcText[npcState.itemWanted][0] = "Hi, I'm another npc.";
npcText[npcState.itemWanted][1] = "I dont really have anything for you to do right now, sorry.";
npcText[npcState.itemWanted][2] = "Uhh, you can leave now. I'm not going to do anyting, I promise.";

npcText[npcState.itemGiven][0] = "Thanks for this, I guess. Here, take this.";
npcText[npcState.itemGiven][1] = "What exactly do you want me to do with this?";