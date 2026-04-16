// If rock is not yet at destination for this movement, keep moving it.
if ((x == rockDestX) && (y == rockDestY))
{
	// Rock has reached destination.
	isMoving = false;
	global.playerControl = true;
	return;
}
	else
{
	// Rock still ain't there. Move along.
	global.playerControl = false;
	x += rockStepX;
	y += rockStepY;
	alarm[0] = 1;
}