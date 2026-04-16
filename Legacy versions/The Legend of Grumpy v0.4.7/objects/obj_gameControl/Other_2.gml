/// @description game variables

// Game variables
global.playerControl = true;
global.gameOver = false;
global.gameStart = false;
global.inConvo = false;
global.plateIteration = 0
global.leverSuccess = false;
global.pplateSuccess = false;
global.hswitchSuccess = false;
global.npcSuccess = false;
global.rockSuccess = false;

// Item array
var i = 0;
repeat(10)// change this for size of array (num items)
{
    global.item_array[i] = 0;
    i += 1;
}
global.item_names = ["sword", "berries", "piece of a key", "key", "special key", "note"];
// Item indexes: 0=sword, 1=berries, 2=keyPiece, 3=key, 4=special key, 5=note
// Item discovered status (used for inventory)
global.item_known = [false, false, false, false, false, false, false, false, false, false];

// Player states
enum playerState {
	idle,
	walking,
}

// Lever states
enum leverState {
	left,
	right,
}

// NPC states
enum npcState {
	itemWanted,
	itemGiven,
}

curSeqLayer = noone;