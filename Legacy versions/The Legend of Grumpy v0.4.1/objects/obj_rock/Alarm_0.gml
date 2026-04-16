if ((x == rockStepDestX) && (y == rockStepDestY))
{
	isMoving = false;
	return;
}
	else
{
	x += rockStepX;
	y += rockStepY;
	alarm[0] = 1;
}