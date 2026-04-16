/// @description appearance

// Change appearance with state
 switch (myState)
 {
	 case leverState.left: {
		 if (sprite_index != leftSprite)
		 {
			 sprite_index = leftSprite;
		 }	
	 } break;
	 case leverState.right: {
		 if (sprite_index != rightSprite)
		 {
			 sprite_index = rightSprite;
		 }
	} break;
 }