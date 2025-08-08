// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_levers(){
	var _lever1On, _lever2On, _lever3On;
	_lever1On = false;
	_lever2On = false;
	_lever3On = false;
	
	if (obj_purpleLever1.myState == leverState.right && obj_purpleLever1.altLeverState == 1)
	{
		_lever1On = true;
		show_debug_message("test lever1");
	}
	else
	{
		obj_purpleLever1.altLeverState = 0;
	}
	
	if (obj_greyLever2.myState == leverState.right && _lever1On == true && obj_greyLever2.altLeverState == 1)
	{
		_lever2On = true;
		show_debug_message("test lever2");
	}
	else
	{
		obj_greyLever2.altLeverState = 0;
	}
	
	if (obj_blueLever3.myState == leverState.right && _lever1On == true && _lever2On == true && obj_blueLever3.altLeverState == 1)
	{
		_lever3On = true;
		show_debug_message("test lever3");
	}
	else
	{
		obj_blueLever3.altLeverState = 0;
		show_debug_message("reset");
	}

	
	if (_lever1On == true && _lever2On == true && _lever3On == true)
	{
		// Do stuff
		global.leverSuccess = true;
		obj_player.lever_flag = true
		audio_play_sound(snd_success,1,0);
		show_debug_message("Lever sequence success.");
	}
}