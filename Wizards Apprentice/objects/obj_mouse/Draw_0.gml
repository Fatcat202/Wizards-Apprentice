/// @description Insert description here
// You can write your code in this editor


#region Dragged Item Alpha
	if(instance_exists(obj_inventory_parent))
	{
		// Item Alpha when dragged
		if(slot_drag != -1)
		{
			if(inventory_drag.inventory[slot_drag] != -1)
			{
				draw_set_alpha(0.5)
					draw_sprite(inventory_drag.inventory[slot_drag].spr, 0, mouse_x, mouse_y)
				draw_set_alpha(1)
			}
		}
	}else
	
	if(instance_exists(obj_study_menu))
	{
		// Item Alpha when dragged
		if(slot_drag != -1)
		{
			if(inventory_drag.inventory[page_drag, slot_drag] != -1)
			{
				draw_set_alpha(0.5)
					draw_sprite(inventory_drag.inventory[page_drag, slot_drag].spr, 0, mouse_x, mouse_y)
				draw_set_alpha(1)
			}
		}
		
	}
	
#endregion Dragged Item Alpha