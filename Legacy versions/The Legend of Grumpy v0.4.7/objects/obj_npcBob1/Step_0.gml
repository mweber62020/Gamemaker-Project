/// @description depth and item check

event_inherited();

if (global.item_array[arrayIndexOfMyItem] >= numNeeded) {
	myState = npcState.itemGiven;
}