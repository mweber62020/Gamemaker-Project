/// @description Insert description here
// You can write your code in this editor
myState = npcState.itemWanted;
currentLine = 1;
// [npcState][line]
npcText[npcState.itemWanted][0] = "Hi, I'm Bob 3.";
npcText[npcState.itemWanted][1] = "I see you have not proven yourself yet.";
npcText[npcState.itemWanted][2] = "Please leave now. Or else I'll get Bob 1 and Bob 2 to jump you.";

npcText[npcState.itemGiven][0] = "Huh, You did it.";
npcText[npcState.itemGiven][1] = "What exactly you did, I'm not too sure.";
npcText[npcState.itemGiven][2] = "But congrats on doing something I guess.";
npcText[npcState.itemGiven][3] = "Im going to kill you now. Goodbye.";