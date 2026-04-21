myState = npcState.itemWanted;
arrayIndexOfMyItem = 1;
numNeeded = 4;
currentLine = 1;
// [npcState][line]
npcText[npcState.itemWanted][0] = "Hi, not seen you around here before. I'm Bob 2.";
npcText[npcState.itemWanted][1] = "You look pretty smart. Can you do me a favor?";
npcText[npcState.itemWanted][2] = "I need you to find at least 4 berries for me. I'd do it myself but, well, I'm stuck here.";

npcText[npcState.itemGiven][0] = "Thanks a bunch. Now I can finally start making dinner.";
npcText[npcState.itemGiven][1] = "Here, I found this the other day. It seems special.";