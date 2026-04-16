function scr_moveRock(){
	pushDirection = noone;
	var r = nearbyRock;
	r.inSpot = r.x == r.rockDestinationX && r.y == r.rockDestinationY;
	
	if (r.inSpot) {return;}
	if (r.isMoving) {return;}
	
	// References the array in obj_rock's create function
	pushDirection = global.pushDirections[dir];
	
	// collision_line draws a line from current position to projected position, checks for obj_rockBlock, and if not there, moves rock.
	if (!collision_line(r.x, r.y, r.x + pushDirection.x, r.y + pushDirection.y, obj_rockBlock, false, false))
	{
		r.isMoving = true;
		r.rockStartX = r.x;
		r.rockStartY = r.y;
		r.rockStepX = pushDirection.x / 64;
		r.rockStepY = pushDirection.y / 64;
		r.rockStepDestX = r.rockStartX + pushDirection.x;
		r.rockStepDestY = r.rockStartY + pushDirection.y;
		
		r.alarm[0] = 1;
	}
	else
	{	
		show_debug_message("obj_rockblock is in the way of projected movement.");
	}

	
	/* Rock Debugging
	show_debug_message("------------");
	show_debug_message("rockDestinationX = " + string(r.rockDestinationX));
	show_debug_message("rockDestinationY = " + string(r.rockDestinationY));
	show_debug_message("rockStartingX = " + string(r.xstart));
	show_debug_message("rockStartingY = " + string(r.ystart));
	show_debug_message("rockX at begining of step = " + string(r.xprevious));
	show_debug_message("rockY at begining of step = " + string(r.yprevious));
	show_debug_message("rockX = " + string(r.x));
	show_debug_message("rockY = " + string(r.y));
	show_debug_message("------------");
	*/
	
	// move_and_collide() Might be an option, more research is required. <- CHECK LATER
}