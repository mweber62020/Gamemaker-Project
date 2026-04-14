/// @description Pressure plate collision check
// This is only used for checking if im still colliding with a plate (see step event with (obj_par_pplate))
if (other.activated = false) {
    other.activated = true; // Mark the pressure plate as activated (other = obj_par_pplate)
    //scr_plates(nearbyPlate); // Run the script
	show_debug_message(nearbyPlate);
}


