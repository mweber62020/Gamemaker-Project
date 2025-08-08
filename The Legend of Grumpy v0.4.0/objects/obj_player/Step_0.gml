/// @description Movement and object checks.


// If playerControl is true, allow movement, else stop all movement.
if (global.playerControl == true)
{
	// Can all be 0 or 1 for key not pressed or pressed, respectively.
	moveRight = keyboard_check(vk_right);
	moveLeft = keyboard_check(vk_left);
	moveUp = keyboard_check(vk_up);
	moveDown = keyboard_check(vk_down);
}
else
{
	moveRight = 0;
	moveLeft = 0;
	moveUp = 0;
	moveDown = 0;
}

// Checks if player is colliding with a slow block, then reduce speed, else set normal speed.
if (collision_point(x+velocityX, y, obj_block_slow, true, true) || collision_point(x, y+velocityY, obj_block_slow, true, true))
{
	// Player moves at 0.3 their normal speed.
	slownessMultiplier = 0.3;
	// Stop any running animation so that it looks like the player is moving slowly.
	// Only works for ladders right now.
	sprite_index = spr_idleUp;
}
else
{
	slownessMultiplier = 1;
}

// Calculates player movement, accounts for slowness multiplier.
velocityX = (moveRight - moveLeft) * 3 * slownessMultiplier;
velocityY = (moveDown - moveUp) * 3 * slownessMultiplier;

// If player is not moving in any direction, set an idle animation loop.
if (velocityX == 0 && velocityY == 0)
{
	myState = playerState.idle;
	// Random loop timing
	if (image_speed > 0)
	{
		if (image_index >= 2.8)
		{
			image_speed = 0;
			image_index = 0;
			alarm[0] = irandom_range(loopRange01,loopRange02);
		}
	}
}
// If the player is moving at all, perfom movement.
else
{
	image_speed = 1;
	
	// Performs player movement based on X and Y velocities, as long as there isn't any environment in front of the player..
	if !collision_point(x + velocityX, y, obj_par_environment, true, true)
	{
		if (velocityX != 0 && velocityY != 0)
		{
			x = x + (velocityX * 0.75);
		} else {
			x += velocityX;
		}
	}
	if !collision_point(x, y+velocityY, obj_par_environment, true, true)
	{
		if (velocityX != 0 && velocityY != 0)
		{
			y = y + (velocityY * 0.75);
		} else {
			y += velocityY;
		}
	}
	
	// Change sprite based on movement.
	if (velocityX > 0) { dir = 0; } // Right
	if (velocityX < 0) { dir = 2; } // Left
	if (velocityY > 0) { dir = 3; } // Down
	if (velocityY < 0) { dir = 1; } // Up
	
	// Since player is not stationary, makes sure the state is walking.
	myState = playerState.walking;
}

// Gets the camera location.
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);

// Gets the textbox location.
text_x = cam_x + (cam_width / 2); // Center textbox in camera.
text_y = cam_y + cam_height - 65; // Offset 65 pixels above the bottom edge of the camera.

// All checks for nearby objects.
nearbyTpBlock = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, obj_par_tpBlock, false, true);
nearbyLever = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, obj_par_lever, false, true);
nearbyPlate = collision_rectangle(x-lookRangeSmall, y-lookRangeSmall, x+lookRangeSmall, y+lookRangeSmall, obj_par_pplate, false, true); // Small look range.
nearbyInteract = collision_rectangle(x-lookRange, y-lookRange, x+lookRange, y+lookRange, obj_par_interact, false, true);
nearbyObtain = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_obtainable,false,true);
nearbyNPC = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_par_npc,false,true);
nearbySign = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_sign,false,true);
nearbyRock = collision_rectangle(x-lookRangeSmall,y-lookRangeSmall,x+lookRangeSmall,y+lookRangeSmall,obj_rock,false,true); // Small look range.
nearbyHswitch = collision_rectangle(x-lookRange,y-lookRange,x+lookRange,y+lookRange,obj_switchHidden,false,true);

// Handles all ways to request a teleport.
if (collision_point(x+velocityX, y, obj_par_tpBlock, true, true) ||
	collision_point(x, y+velocityY, obj_par_tpBlock, true, true) || 
	lever_flag)
{	// Starts the fade sequence and disables player control.
	global.playerControl = false;
	// Alarm 1 teleports.
	alarm[1] = 40;
	// Alarm 2 is fade sequence.
	alarm[2] = 1;
}

// Checks for a nearby lever.
if (nearbyLever)
{
	// Do nothing yet.
}

// Checks for a nearby pressure plates.
if (nearbyPlate)
{
	// Plate interaction.
	if (nearbyPlate.activated = false)
	{
		nearbyPlate.activated = true; // Sets the pressure plate as activated.
		scr_plates(nearbyPlate); // Run the script
	}
}

// With() iterates over all pressure plates and resets them if the player is no longer colliding
with (obj_par_pplate) {
    if (!place_meeting(x, y, obj_player)) {
        activated = false; // Reset activation if the player has left.
    }
}

// Check for interactables.
if (nearbyInteract)
{
	// Do nothing yet.
}

// Check for obtainable.
if (nearbyObtain)
{
	// Do nothing yet.
}

// Check for npc.
if (nearbyNPC)
{
	// Do nothing yet.
}

// Check for sign.
if (nearbySign)
{
	// Do nothing yet.
}

// Check for hidden switch.
if (nearbyHswitch)
{
	// Do nothing yet.
}

// Check for movable rock.
// Rock interaction.
/* Screw the rocks.
if (nearbyRock)
{
	show_debug_message("------------");
	show_debug_message("rockDestinationX = " + string(nearbyRock.rockDestinationX));
	show_debug_message("rockDestinationY = " + string(nearbyRock.rockDestinationY));
	show_debug_message("rockStartingX = " + string(nearbyRock.xstart));
	show_debug_message("rockStartingY = " + string(nearbyRock.ystart));
	show_debug_message("rockX at begining of step = " + string(nearbyRock.xprevious));
	show_debug_message("rockY at begining of step = " + string(nearbyRock.yprevious));
	show_debug_message("rockX = " + string(nearbyRock.x));
	show_debug_message("rockY = " + string(nearbyRock.y));
	show_debug_message("------------");
	nearbyRock.isMoving = true;
	nearbyRock.x += -60;
	nearbyRock.y += 0;
	// rockPushedFlag = true;
	// rockLastPushed = nearbyRock;
}
*/

// Resets plates.
if (pp_flag)
{
	if pp_reset_timer == 60
	{
		with (obj_par_pplate) {
			sprite_index = spr_plateUp;
			pressed = false;
		}
		pp_reset_timer = 0;
		pp_flag = false;
	} else {
		pp_reset_timer += 1;
	}
}

//moves rock if pushed ****THIS WHOLE THING SUCKS*****
//if (rockPushedFlag == true) && (rockLastPushed.inSpot == false) //NEED TO MAKE SURE ROCK DOESNT LEAVE AN AREA. CHECK IF PATH CLEAR, THEN MOVE
/*
{
	newRockX = x + move_x;
	newRockY = y + move_y;
	// Only move if the new position isnt colliding with obj_barrier
	if (!place_meeting(newRockX, newRockY, obj_rockBlock)) {
	    x = rockX;
	    y = rockY;
	}*/

	/*if rock_num == 64
	{
		show_debug_message(rockLastPushed.x);
		show_debug_message(rockLastPushed.y);
		show_debug_message(rock_num);
		global.playerControl = true;
		rock_num = 0;
		rockPushedFlag = false;
	}
	else
	{
			if rock_num = 0
			{
				rockStartingSpotX = rockLastPushed.x;
				rockStartingSpotY = rockLastPushed.y;
			}
			global.playerControl = false;
			//move rock in direction player is facing
			//show_debug_message(rockLastPushed.x);
			//show_debug_message(rockLastPushed.y);
			//show_debug_message(rock_num);
			switch sprite_index
			{
				case spr_runRight: {
					newRockX = rockLastPushed.bbox_right + 1; // the 1 is becouse the collision mask is 1 pixels less than the canvas size
					newRockY = rockLastPushed.bbox_top;
					show_debug_message("NEW" + string(newRockX));
					show_debug_message("NEW" + string(newRockY));
					// Only move if the new position isnt colliding with obj_barrier
					if (!place_meeting(newRockX, newRockY, obj_rockBlock)) {
					    rockLastPushed.x += .5;
					}
				} break;
				case spr_idleRight: {
					newRockX = rockLastPushed.bbox_right + 1; // the 1 is becouse the collision mask is 1 pixels less than the canvas size
					newRockY = rockLastPushed.bbox_top;
					show_debug_message("NEW" + string(newRockX));
					show_debug_message("NEW" + string(newRockY));
					// Only move if the new position isnt colliding with obj_barrier
					if (!place_meeting(newRockX, newRockY, obj_rockBlock)) {
					    rockLastPushed.x += .5;
					}
				} break;
				case spr_runLeft: {
					//newRockX = rockStartingSpotX - 3;
					//newRockY = rockStartingSpotY + 3;
					newRockX = rockLastPushed.bbox_left - 3; // the 3 is becouse the collision mask is 3 pixels less than the canvas size
					newRockY = rockLastPushed.bbox_top;
					show_debug_message("NEW" + string(newRockX));
					show_debug_message("NEW" + string(newRockY));
					// Only move if the new position isnt colliding with obj_barrier
					if (!place_meeting(newRockX, newRockY, obj_rockBlock)) {
					    rockLastPushed.x -= .5;
					}
				} break;
				case spr_idleLeft: {
					//newRockX = rockStartingSpotX - 3;
					//newRockY = rockStartingSpotY + 3;
					newRockX = rockLastPushed.bbox_left - 3; // Check if the full rock can move
					newRockY = rockLastPushed.bbox_top;
					show_debug_message("NEW" + string(newRockX));
					show_debug_message("NEW" + string(newRockY));
					// Only move if the new position isnt colliding with obj_barrier
					if (!place_meeting(newRockX, newRockY, obj_rockBlock)) {
					    rockLastPushed.x -= .5;
					}
				} break;
				case spr_runUp: {
					newRockX = rockLastPushed.bbox_left; // Check if the full rock can move
					newRockY = rockLastPushed.bbox_top - 32;
					show_debug_message("NEW" + string(newRockX));
					show_debug_message("NEW" + string(newRockY));
					// Only move if the new position isnt colliding with obj_barrier
					if (!place_meeting(newRockX, newRockY, obj_rockBlock)) {
						rockLastPushed.y -= .5;
					}
				} break;
				case spr_idleUp: {
					newRockX = rockLastPushed.bbox_left; // Check if the full rock can move
					newRockY = rockLastPushed.bbox_top - 32;
					show_debug_message("NEW" + string(newRockX));
					show_debug_message("NEW" + string(newRockY));
					// Only move if the new position isnt colliding with obj_barrier
					if (!place_meeting(newRockX, newRockY, obj_rockBlock)) {
						rockLastPushed.y -= .5;
					}
				} break;
				case spr_runDown: {
					newRockX = rockLastPushed.bbox_left; // Check if the full rock can move
					newRockY = rockLastPushed.bbox_bottom + 1;
					show_debug_message("NEW" + string(newRockX));
					show_debug_message("NEW" + string(newRockY));
					// Only move if the new position isnt colliding with obj_barrier
					if (!place_meeting(newRockX, newRockY, obj_rockBlock)) {
						rockLastPushed.y += .5;
					}
				} break;
				case spr_idleDown: {
					newRockX = rockLastPushed.bbox_left; // Check if the full rock can move
					newRockY = rockLastPushed.bbox_bottom + 1;
					show_debug_message("NEW" + string(newRockX));
					show_debug_message("NEW" + string(newRockY));
					// Only move if the new position isnt colliding with obj_barrier
					if (!place_meeting(newRockX, newRockY, obj_rockBlock)) {
						rockLastPushed.y += .5;
					}
				} break;
			}
		rock_num += 1;
	}
	show_debug_message(rockLastPushed.rockSpotX);
	//check if rock is in (or maybe within some pixels of) its spot and somewhere
	if (rockLastPushed.x == rockLastPushed.rockSpotX) && (rockLastPushed.y == rockLastPushed.rockSpotY)
	{
		rockLastPushed.inSpot = true;
		show_debug_message("Rock is in spot.");
	}
	//check if all rocks are in spot
	with (obj_rock)
	{
		show_debug_message(inSpot);
	    if(!inSpot)
	        obj_player.rocksInSpot = false;
	}
	if (rocksInSpot == true)
	{
	    global.rockSuccess = true;
		show_debug_message("rocks in spots");
	}
	rocksInSpot = true;
}
else{
	rockPushedFlag = false;
	//global.playerControl = true;
}
*/

//move audio listener with player
audio_listener_set_position(0,x,y,0);

//Depth sorting
depth =- y;

//choose sprite
sprite_index = playerSpr[myState][dir];