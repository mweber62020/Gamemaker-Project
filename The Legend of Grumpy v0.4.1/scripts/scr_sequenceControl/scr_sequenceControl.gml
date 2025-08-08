// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playSequence(_scqToPlay){
	// Create sequence if appropriate
	if (_scqToPlay != noone) {
	
		// Set sequence to center camera view
		var _camX = camera_get_view_x(view_camera[0])+floor(camera_get_view_width(view_camera[0])*0.5)
		var _camY = camera_get_view_y(view_camera[0])+floor(camera_get_view_height(view_camera[0])*0.5)
	
		// Make sure our sequence doesn't already exist
		if (instance_exists(obj_gameControl) && !layer_sequence_exists(obj_gameControl.curSeqLayer, _scqToPlay)) {
			if (layer_exists(obj_gameControl.curSeqLayer)) {
				// Create/Play the sequence
				layer_sequence_create(obj_gameControl.curSeqLayer,_camX, _camY, _scqToPlay);
				// Make sure Cutscenes layer is above the action
				layer_depth(obj_gameControl.curSeqLayer, -10000);
			}
		}
	}
}