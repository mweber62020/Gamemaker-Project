// If rock is not yet at destination for this movement, keep moving it.
if ((x == rockDestX) && (y == rockDestY))
{
	// Rock has reached destination.
	isMoving = false;
	global.playerControl = true;
	
	// Update whether this rock is in its final spot
	inSpot = (x == rockFinalDestinationX) && (y == rockFinalDestinationY);

	// Check if all rocks are now in their final spots
	global.rockSuccess = true;

	with (obj_rock)
	{
		if (!inSpot)
		{
			global.rockSuccess = false;
		}
	}
	if (global.rockSuccess)
	{
	show_debug_message("global.rockSuccess is true!");
	audio_play_sound(snd_success,1,0);
	}
	
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