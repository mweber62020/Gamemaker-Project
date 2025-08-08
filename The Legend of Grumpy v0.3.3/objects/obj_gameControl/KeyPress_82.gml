/// @description Inventory
if (room != rm_title)
{
	if (instance_exists(obj_inventory))
	{
		instance_destroy(obj_inventory)
		global.playerControl = true;
	}
	else
	{
		//make a new textbox that shows inventory here
		if ((!instance_exists(obj_textbox)) && (!instance_exists(obj_inventory)))
		{
			var iii = instance_create_depth(inv_x, inv_y, -10000, obj_inventory);
			global.playerControl = false;
		}
	}
}