/// @description Switch Room

if (lever_flag) {
	room_goto(rm_cave);
	scr_tpPosition(320, 400);
	lever_flag = false;
}
else if (nearbyTpBlock)
{
	room_goto(asset_get_index(nearbyTpBlock.roomToGoTo));
	scr_tpPosition(nearbyTpBlock.xPosition, nearbyTpBlock.yPosition);
}
else
{
	room_goto(rm_error);
}
visible = true;