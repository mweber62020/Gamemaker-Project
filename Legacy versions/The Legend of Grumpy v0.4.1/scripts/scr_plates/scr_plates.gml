function scr_plates(nearbyPlate)
{
	if (!nearbyPlate.pressed) {
		switch (global.plateIteration) {
			case 0: 
				nearbyPlate.pressed = true;
				nearbyPlate.order = 1;
				nearbyPlate.sprite_index = spr_plateDown;
				global.plateIteration += 1;
				show_debug_message("1");
				break;
			case 1:
				nearbyPlate.pressed = true;
				nearbyPlate.order = 2;
				nearbyPlate.sprite_index = spr_plateDown;
				global.plateIteration += 1;
				show_debug_message("2");
				break;
			case 2:
				nearbyPlate.pressed = true;
				nearbyPlate.order = 3;
				nearbyPlate.sprite_index = spr_plateDown;
				global.plateIteration += 1;
				show_debug_message("3");
				break;
			case 3:
				nearbyPlate.pressed = true;
				nearbyPlate.order = 4;
				nearbyPlate.sprite_index = spr_plateDown;
				global.plateIteration += 1;
				show_debug_message("4");
		}
	}
	if (global.plateIteration == 4)
	{
		if ((obj_pplate1.order == 1) && (obj_pplate2.order == 2) && (obj_pplate3.order == 3) && (obj_pplate4.order == 4)) {
			// And more such as open door (check for what room im in if the pp's do multiple things).
			global.pplateSuccess = true;
		} else {
			obj_player.pp_flag = true;
		}
		global.plateIteration = 0;
	}
	
	// When ?leaving room?, reset everything and then all i have to do for different rooms is rearange them
	// Make a way to get this script to start working again when different room or something.
}