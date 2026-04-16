// Creates a struct with directions and coord changes.
global.pushDirections = [
    { x:  64, y:   0 }, // 0 = RIGHT
    { x:   0, y: -64 }, // 1 = UP
    { x: -64, y:   0 }, // 2 = LEFT
    { x:   0, y:  64 }  // 3 = DOWN
];


rockStartX = noone;
rockStartY = noone;
rockStepX = noone;
rockStepY = noone;
rockStepDestX = noone;
rockStepDestY = noone;

/* 
Referenced as such:
var dir = global.pushDirections.LEFT;
x += dir.x;
y += dir.y;
*/