/// @description check for end game flags
// You can write your code in this editor
event_inherited();

if ((global.keyknown == true) && (global.leverSuccess == true) && (global.pplateSuccess == true) && (global.hswitchSuccess == true) && (global.npcSuccess == true) && (global.rockSuccess == true)) { //add checks here
	myState = npcState.itemGiven;
}