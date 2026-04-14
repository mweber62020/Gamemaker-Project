function scr_moveRock(){
	
	pushDirection = noone;
	var r = nearbyRock;
	
	// Sets bool
	r.inSpot = (r.x == r.rockFinalDestinationX) && (r.y == r.rockFinalDestinationY);
	
	if (r.inSpot) {return;}
	if (r.isMoving) {return;}
	
	// References the array in obj_rock's create function
	pushDirection = global.pushDirections[dir];
	
	// collision_line draws a line from current position to projected position, checks for obj_rockBlock, and if not there, moves rock.
	if (!collision_line(r.x, r.y, r.x + pushDirection.x, r.y + pushDirection.y, obj_rockBlock, false, false))
	{
		// Does the magic math
		// if(collision_line()
		
		
		
		
		// Rock is now moving moron.
		r.isMoving = true;
		
		// Sets the amount of pixels the rocks moves every step.
		r.rockStepX = pushDirection.x / 32;
		r.rockStepY = pushDirection.y / 32;
		
		// Sets the destination for the rock at the end of it current trajectory (32 pixels).
		r.rockDestX = r.x + pushDirection.x;
		r.rockDestY = r.y + pushDirection.y;
		
		// Starts recursive alarm to move rock by a pixel each frame (step).
		r.alarm[0] = 1;
	}
	else
	{	
		show_debug_message("obj_rockblock is in the way of projected movement.");
	}

	
	/* Rock Debugging
	show_debug_message("------------");
	show_debug_message("rockFinalDestinationX = " + string(r.rockFinalDestinationX));
	show_debug_message("rockFinalDestinationY = " + string(r.rockFinalDestinationY));
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