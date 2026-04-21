/// @description check for end game flags
event_inherited();

if ((global.leverSuccess == true) && (global.pplateSuccess == true) && (global.hswitchSuccess == true) && (global.npcSuccess == true) 
	&& (global.rockSuccess == true) && (global.pedestalSuccess == true) && (global.richSuccess == true)) { //add checks here
	myState = npcState.itemGiven;
}