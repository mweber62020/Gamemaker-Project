// NEW:.arrayIndex
function scr_npcTextControl(nearbyNPC)
{
	// Ends conversation if currentLine is greater than amount of lines available.
	if (nearbyNPC.currentLine > array_length(nearbyNPC.npcText[nearbyNPC.myState]))
	{
		instance_destroy(obj_textbox)
		global.inConvo = false;
		global.playerControl = true;
		nearbyNPC.currentLine = 1;
		//give item once convo over
		if (nearbyNPC.myState == npcState.itemGiven && !nearbyNPC.gaveItem && nearbyNPC.itemToGive != -1)
	    {
			show_debug_message("gave item");
			if (nearbyNPC.itemToGive == 99)
				global.item_array[nearbyNPC.itemToGive] += 5;
			else {
		        global.item_array[nearbyNPC.itemToGive] += 1;
		        global.item_known[nearbyNPC.itemToGive] = true;
			}
			nearbyNPC.gaveItem = true;
	    }
		
		//if the npc is the "end game npc" then end the game.
		if ((nearbyNPC.object_index == obj_npcBob3) && (nearbyNPC.myState == npcState.itemGiven))
			game_end();
		return;
	}
	global.inConvo = true;
	// Runs if no textbox exists and inventory isn't shown.
	if ((!instance_exists(obj_textbox)) && (!instance_exists(obj_inventory)))
	{
		// Creates the textbox
		iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
	}
	if (instance_exists(obj_inventory)) return;
	// Sets the textToShow
	iii.textToShow = nearbyNPC.npcText[nearbyNPC.myState][nearbyNPC.currentLine - 1];
	// Increments the currentLine
	nearbyNPC.currentLine += 1;	
}