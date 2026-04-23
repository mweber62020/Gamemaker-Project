/// @description Interact

// Removes any existing textbox.
if (!nearbyNPC)
{
	if (instance_exists(obj_textbox))
	{
		instance_destroy(obj_textbox)
		global.playerControl = true;
		if (!addText)
		{
			return;
		}
	}
}
// Shows additional textbox if needed (add 'or' for additional potential boxes.)
if (addText)
{
	if (keyText)
	{
		global.playerControl = false;
		var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
		iii.textToShow = "You put the pieces together to make a full key!";
		keyText = false;
		addText = false;
	}
	if (noteText)
	{
		global.playerControl = false;
		var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
		iii.textToShow = noteContents;
		noteText = false;
		// Check if all notes collected (total notes: 3)
		if (global.item_array[5] == 3)
		{
			secretNoteText = true;
		}
		else
		{
			addText = false;
		}
	}
	// Run this the next frame if its the last note
	else if (secretNoteText)
	{
		global.playerControl = false;
		var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
		iii.textToShow = $"You put the notes together. There is something writen across the back!: Purple flowers near the wall.";
		secretNoteText = false;
		addText = false;
	}
}
// Lever control.
if (global.playerControl)
{
	if (!lever_flag)
	{
	// If near lever.
		if (nearbyLever)
		{
			switch (nearbyLever.myState) {
				case 0: {
					//Left to right
					nearbyLever.myState = 1;
					nearbyLever.altLeverState = 1;
					scr_levers(); // Maybe pass nearbyLever?
				} break;
				case 1: {
					//Right to left
					nearbyLever.myState = 0;
					nearbyLever.altLeverState = 0;
					scr_levers();
				} break;
			}
		}
	}
}

// Make a way for this to activate when just walking over it once.
if (nearbyPlate)
{
	scr_plates(nearbyPlate);
}

// If near interactable.
if (nearbyInteract)
{
	if ((!instance_exists(obj_textbox)) && (!instance_exists(obj_inventory)))
	{
		// Check if behind sign.
		if (nearbyInteract.object_index == obj_sign)
		{
			// show_debug_message("player y value is " + string(obj_player.y));
			// show_debug_message("sign y value is 550");
			if (obj_player.y >= nearbyInteract.yValue)
			{
				var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
				iii.textToShow = nearbyInteract.textToShow;
				global.playerControl = false;
				return;
			}
			else{
				var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
				iii.textToShow = "This is the back of a sign. There is nothing written here.";
				global.playerControl = false;
				return;
			}
		}
		global.playerControl = false;
		
		// If interact is a chest, change sprite and get item.
		if ((nearbyInteract.object_index == obj_bigChest) || (nearbyInteract.object_index == obj_smallChest))
		{
			// Sets sprite to change to
			if (nearbyInteract.object_index == obj_bigChest)
				chestSprite = spr_bigChestOpen;
			else
				chestSprite = spr_smallChestOpen;

			// If chest is already open
			if (nearbyInteract.sprite_index == chestSprite)
			{
				global.playerControl = true;
				instance_destroy(obj_textbox);
				return;
			}
			// If it is unlocked or if you have a key/special key.
			if (!nearbyInteract.isLocked || (nearbyInteract.specialChest && global.item_array[4] >= 1) || (!nearbyInteract.specialChest && global.item_array[3] >= 1))
			{
				// If there is nothing in chest
				if (nearbyInteract.itemHeld == noone) {
					var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
					iii.textToShow = "There's nothing here.";
					nearbyInteract.sprite_index = chestSprite;
					if (nearbyInteract.isLocked)
					{
					    nearbyInteract.isLocked = false;
					    // Remove the correct key depending on chest type
					    if (nearbyInteract.specialChest)
					        global.item_array[4] -= 1;
					    else
					        global.item_array[3] -= 1;
					}
					return;
				}
				
				// Compares the element in the array to itemHeld
				var _f = function (_element, _index) {
					return (_element == nearbyInteract.itemHeld)
				}
				// Gets the index of itemHeld in item_names
				var itemIndex = array_find_index(global.item_names, _f);
				
				// Increment and "discover" item
				if (itemIndex == 99) // If item is coins
					global.item_array[itemIndex] += 5;
				else
				{
					global.item_array[itemIndex] += 1;
					global.item_known[itemIndex] = true;
				}
				// Shows sprite and text
				nearbyInteract.sprite_index = chestSprite;
				var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
				if ((itemIndex == 1) || (itemIndex == 99)) // Put all indexes that would require different text here
					iii.textToShow = $"You obtained some {nearbyInteract.itemHeld}"; // Might remove some
				else
					iii.textToShow = $"You obtained a {nearbyInteract.itemHeld}";
				
				if (nearbyInteract.isLocked)
				{
				    nearbyInteract.isLocked = false;
				    // Remove the correct key depending on chest type
				    if (nearbyInteract.specialChest)
				        global.item_array[4] -= 1;
				    else
				        global.item_array[3] -= 1;
				}

			}
			else
			{
				var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
				iii.textToShow = "The chest is locked.";
			}
		}
		
		// If interact is a pedestal
		if (nearbyInteract.object_index == obj_pedestal)
		{
			// Check if already placed item
			if (!nearbyInteract.itemPlaced)
			{
				// Check if required item is in inventory
				if (global.item_array[nearbyInteract.itemNeeded] >= 1)
				{
					// Makes chest appear, Show the textbox, set pedestalSuccess, and remove item from inventory.
					var _chest = instance_create_depth(1024, 800, 0, obj_smallChest);
					_chest.itemHeld = "special key";
					
					var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
					iii.textToShow = nearbyInteract.successMessage;
					
					global.item_array[nearbyInteract.itemNeeded] -= 1;
					nearbyInteract.itemPlaced = true;
					
					global.pedestalSuccess = true;
					show_debug_message("global.pedestalSuccess is true!");
					audio_play_sound(snd_success,1,0);
				}
				else {
					var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
					iii.textToShow = nearbyInteract.itemHint;
				}
			}
			else{
				var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
				iii.textToShow = "You can't do anything else here.";
			}
		}
	}
}

//if near obtainable
if (nearbyObtain)
{
	if ((!instance_exists(obj_textbox)) && (!instance_exists(obj_inventory)))
	{
		var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
		iii.textToShow = nearbyObtain.textToShow;
		// Check if its a note and show additional text
		if (nearbyObtain.object_index == obj_note)
		{
			noteText = true;
			addText = true;
			noteContents = nearbyObtain.contents;
		}
		// Increment and "discover" item
		if (nearbyObtain.object_index == obj_coinPile) // If item is coins
		{
			global.item_array[nearbyObtain.arrayIndex] += 5;
			global.playerControl = false;
		}
		else {
			global.item_array[nearbyObtain.arrayIndex] += 1;
			global.item_known[nearbyObtain.arrayIndex] = true;
			global.playerControl = false;
		}
		//check if its the 3rd piece of a key and set variable to show additional text (near start of event)
		if (nearbyObtain.object_index == obj_keyPiece)
		{
			if (global.item_array[2] = 3)
			{
				global.item_array[2] = 0;
				global.item_array[3] += 1;
				global.item_known[3] = true;
				keyText = true;
				addText = true;
			}
		}
		instance_destroy(nearbyObtain);
	}
}

//if near hidden switch
if (nearbyHswitch) {
	if (nearbyHswitch.isFlipped == false) {
		var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
		iii.textToShow = "You flipped a hidden switch. Something happened nearby.";
		global.playerControl = false;
		nearbyHswitch.isFlipped = true;
		switch nearbyHswitch.myRoom //add more cases for more switches.
		{
			case rm_hub: {
				 audio_play_sound(snd_success,1,0);
				 global.hswitchSuccess = true;
				 show_debug_message("global.hswitchSuccess is true!");
			} break;
		}
		return;
	}
	else{
		var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
		iii.textToShow = "You flipped the switch again. Nothing happened.";
		global.playerControl = false;
		return;
	}
}

// If near npc
if (nearbyNPC) {
	// If item notification is showing, dismiss it
    if (showingItemText && instance_exists(obj_textbox)) {
        instance_destroy(obj_textbox);
        global.playerControl = true;
		showingItemText = false;
        return;
    }
	// If a choice is currently on screen, confirm the selection and branch
	if (instance_exists(obj_textbox) && obj_textbox.isChoice)
	{
		if (obj_textbox.choiceIndex == 0) // Yes
		{
			if (variable_instance_exists(nearbyNPC, "choiceCoinReward") && nearbyNPC.choiceCoinReward > 0)
				global.item_array[99] += nearbyNPC.choiceCoinReward;
			nearbyNPC.myState = nearbyNPC.choiceYesState;
		}
		else // No
		{
			nearbyNPC.myState = nearbyNPC.choiceNoState;
		}
		nearbyNPC.currentLine = 1;
		instance_destroy(obj_textbox);
		scr_npcTextControl(nearbyNPC);
		return;
	}
	scr_npcTextControl(nearbyNPC);
	if ((nearbyNPC.gaveItem == true) && (!nearbyNPC.alreadyGave))
	{
		var iii = instance_create_depth(text_x, text_y, -10000, obj_textbox);
		if ((nearbyNPC.itemToGive == 1) || (nearbyNPC.itemToGive == 99)) // Put all indexes that would require different text here
			if (nearbyNPC.itemToGive == 99)
				iii.textToShow = $"You obtained some coins";
			else
				iii.textToShow = $"You obtained some {global.item_names[nearbyNPC.itemToGive]}"; // Might remove some
		else
			iii.textToShow = $"You obtained a {global.item_names[nearbyNPC.itemToGive]}";
		global.playerControl = false;
		nearbyNPC.alreadyGave = true; 
		showingItemText = true;
	}
	if ((obj_npcBob1.myState == npcState.itemGiven) && (obj_npcBob2.myState == npcState.itemGiven))
	{
		global.npcSuccess = true;
		show_debug_message("global.npcSuccess is true!");
	}
}
