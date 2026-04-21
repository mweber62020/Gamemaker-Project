/// @description game variables

// Game variables
global.playerControl = true;
global.gameOver = false;
global.gameStart = false;
global.item_array[99] = 0; // coins
global.inConvo = false;
global.plateIteration = 0
// If adding end condition, dont forget to add it to bob3 step event and hint text
global.leverSuccess = false;
global.pplateSuccess = false;
global.hswitchSuccess = false;
global.npcSuccess = false;
global.rockSuccess = false;
global.richSuccess = false;
global.pedestalSuccess = false;

// Item array
var i = 0;
repeat(10)// change this for size of array (num items)
{
    global.item_array[i] = 0;
    i += 1;
}
// If adding item, dont forget to put it in the inventory!
global.item_names = ["sword", "berries", "piece of a key", "key", "special key", "note", "diamond"];
global.item_names[99] = "coins";
// Item indexes: 0=sword, 1=berries, 2=keyPiece, 3=key, 4=special key, 5=note, 6=diamond, 99=coins
// -1 is used for null.
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
randomise();