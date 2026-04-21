/// @description Switch Room

if (nearbyTpBlock)
{
	room_goto(asset_get_index(nearbyTpBlock.roomToGoTo));
	scr_tpPosition(nearbyTpBlock.xPosition, nearbyTpBlock.yPosition);
} else if (lever_flag) {
	room_goto(rm_cave);
	scr_tpPosition(320, 400);
	lever_flag = false;
	global.playerControl = true;
}
else
{
	room_goto(rm_error);
}
visible = true;