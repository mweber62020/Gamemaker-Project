/// @description start gameplay

//press enter to play
if (room == rm_title)
{
		audio_stop_all();
		global.gameStart = true;
		room_goto(rm_hub);
}