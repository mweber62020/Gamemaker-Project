// Creates a struct with directions and coord changes.
global.pushDirections = [
    { x:  32, y:   0 }, // 0 = RIGHT
    { x:   0, y: -32 }, // 1 = UP
    { x: -32, y:   0 }, // 2 = LEFT
    { x:   0, y:  32 }  // 3 = DOWN
];

inSpot = false;
isMoving = false;

// Sets the amount of pixels the rocks moves every step.
rockStepX = noone;
rockStepY = noone;

// Sets the destination for the rock at the end of it current trajectory / movement (32 pixels).
rockDestX = noone;
rockDestY = noone;

// This is where the rock will eventually want to be. Values for each rock is found in creation code.
rockFinalDestinationX = 672;
rockFinalDestinationY = 576;

/* 
pushDirections are referenced as such:
var dir = global.pushDirections.LEFT;
x += dir.x;
y += dir.y;
*/