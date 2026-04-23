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
		// If player declined a choice, reset so they can be asked again next conversation
		if (variable_instance_exists(nearbyNPC, "hasChoice") && nearbyNPC.hasChoice
			&& nearbyNPC.myState == nearbyNPC.choiceNoState)
		{
			nearbyNPC.myState = nearbyNPC.choiceState;
		}
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
	
	// If this line has a choice attached, activate choice mode and wait for input
	if (variable_instance_exists(nearbyNPC, "hasChoice")
		&& nearbyNPC.hasChoice
		&& nearbyNPC.myState == nearbyNPC.choiceState
		&& (nearbyNPC.currentLine - 1) == nearbyNPC.choiceLine)
	{
		iii.isChoice = true;
		iii.choiceOptions = nearbyNPC.choiceOptions;
		iii.choiceIndex = 0;
	}
	else
	{
		nearbyNPC.currentLine += 1;
	}
}