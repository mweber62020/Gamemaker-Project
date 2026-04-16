/// @description deal with music and stuff
 
 //play music based on room
 audio_stop_all()
 switch room
 {
	 case rm_hub: {
		 audio_play_sound(snd_hub,1,1);
	 } break;
	 case rm_cave: {
		 audio_play_sound(snd_cave,1,1);
	 } break;
	 case rm_hub_house_1: {
		 audio_play_sound(snd_house,1,1);
	 } break;
	 case rm_hub_house_2: {
		 audio_play_sound(snd_house,1,1);
	 } break;
 }
 
 //mark sequences layer
 if(layer_exists("Sequences"))
 {
	 var curSeqLayer = "Sequences";
 }
 else {
	 var curSeqLayer = "Instances";
 }
 