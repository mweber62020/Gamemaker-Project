/// @description Insert description here
// You can write your code in this editor
myState = npcState.itemWanted;
currentLine = 1;
// [npcState][line]
npcText[npcState.itemWanted][0] = "Oh. You found me. Hi, I'm Bob 3.";
npcText[npcState.itemWanted][1] = "I see you have not proven yourself yet. There must still be something for you to do around here.";
npcText[npcState.itemWanted][2] = "Here, I will give you a hint. Plate. Lever. Rock. NPC. Switch. Pedestal.";
npcText[npcState.itemWanted][3] = "Please leave now. Or else I'll get Bob 1 and Bob 2 to jump you.";

npcText[npcState.itemGiven][0] = "Huh, You did it.";
npcText[npcState.itemGiven][1] = "What exactly you did, I'm not too sure.";
npcText[npcState.itemGiven][2] = "But congrats on doing something I guess.";
npcText[npcState.itemGiven][3] = "Im going to kill you now. Goodbye.";