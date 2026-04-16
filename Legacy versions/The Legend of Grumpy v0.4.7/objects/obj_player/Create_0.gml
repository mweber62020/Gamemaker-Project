/// @description Variables and States

// Movement Variables
velocityX = 0;
velocityY = 0;
dir = 3;
moveRight = 0;
moveLeft = 0;
moveUp = 0;
moveDown = 0;
slownessMultiplier = 1;

// Nearby Object Variables
nearbyLever = noone;
nearbyPlate = noone;
nearbyTpBlock = noone;
nearbyInteract = noone;
nearbyObtain = noone;
nearbyNPC = noone;
nearbySign = noone;
nearbyHswitch = noone;
nearbyRock = noone;
nearbyLock = noone;
lookRangeSmall = 3.5;
lookRange = 10;

// Room Switching
roomName = noone;
fadeStep = 0;

// Textbox
addText = false;
noteText = false;
keyText = false;
secretNoteText = false;
noteContents = noone;

// Levers
lever_flag = false;
lever_flag_two = false;

// Chests
chestSprite = noone;

// Pressure Plates
pp_flag = false;
pp_reset_timer = 0;

// Rocks
rockLastPushed = noone;
rock_num = 0;
rockStartingSpotX = 0;
rockStartingSpotY = 0;
newRockX = 0;
newRockY = 0;

// Camera variables
cam_x = camera_get_view_x(view_camera[0]);
cam_y = camera_get_view_y(view_camera[0]);
cam_width = camera_get_view_width(view_camera[0]);
cam_height = camera_get_view_height(view_camera[0]);

// For textbox location only
text_x = 0;
text_y = 0;

// Create listener
audio_listener_set_position(0,x,y,0);
audio_listener_set_orientation(0,0,1,0,0,0,1);

// Player sprite array [myState][dir]
myState = playerState.idle;

// Idle
playerSpr[playerState.idle][0] = spr_idleRight;
playerSpr[playerState.idle][1] = spr_idleUp;
playerSpr[playerState.idle][2] = spr_idleLeft;
playerSpr[playerState.idle][3] = spr_idleDown;

// Walking
playerSpr[playerState.walking][0] = spr_runRight;
playerSpr[playerState.walking][1] = spr_runUp;
playerSpr[playerState.walking][2] = spr_runLeft;
playerSpr[playerState.walking][3] = spr_runDown;

mask_index = spr_player_collision;