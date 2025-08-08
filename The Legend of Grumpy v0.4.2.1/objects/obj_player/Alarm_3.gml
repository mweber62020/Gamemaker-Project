/// @description Decrement

// Object is gone when image_alpha is 0.
obj_fade.image_alpha -= .025;
// show_debug_message(obj_fade.image_alpha);

// If image is gone, return player control.
if (fadeStep == 0) {
	global.playerControl = true;
}

// If image is still present, continue to decrease alpha.
if (fadeStep > 0) {
	fadeStep -= 1;
	alarm[3] = 1;
}