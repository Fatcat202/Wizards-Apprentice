// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_inventory_remove(inventory, inventory_slots, item_pos = -1)
{
	// Remove item from inventory

	if(item_pos != -1)
	{
		
		inventory[item_pos] = -1;
					
		return;
			
	}else
	{
		
		// If no item selected, remove last item in inventory
		for(var i = inventory_slots - 1; i != -1; i--)
		{
			if(inventory[i] != -1)
			{
				
				if(i < inventory_slots) inventory[i] = -1;
					
				return;
			}
		}
	}

}