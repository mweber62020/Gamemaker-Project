/// @description game variables

// Game variables
global.playerControl = true;
global.gameOver = false;
global.gameStart = false;
global.inConvo = false;
global.keyknown = false;
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
global.item_names = ["sword", "berries", "piece of a key", "key"];
// Item indexes: 0=sword, 1=berries, 2=keyPiece, 3=key

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

var curSeqLayer = noone;