/// @description Increment

// Object is solid when image_alpha is 1.
obj_fade.image_alpha += .025;
// show_debug_message(obj_fade.image_alpha);

// If image is entirely solid, start to decrease alpha.
if (fadeStep == 40) {
	alarm[3] = 1; // Starts Decrement
}

// If image is not yet entirely solid, continue to increase alpha.
if (fadeStep < 40) {
	fadeStep += 1;
	alarm[2] = 1;
}