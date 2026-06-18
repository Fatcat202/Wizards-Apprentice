function scr_inventory_search(inventory, inventory_slots, item = -1)
{
	// Search for item position in inventory. If it does not exist, return first available spot
	
	var found = false;
	
	
	// Used once stacking is implemented
/*	
	// If item is found, return position
	if(item != -1)
	{
		for(var i = 0; i < inventory_slots; i++)
		{
			if(inventory[i] == item)
			{
				found = true;
				return i;
			}
		}
	}
	*/
	
	
	// If item is not found, return first empty position
	if(!found)
	{
		for(var i = 0; i < inventory_slots; i++)
		{
			if(inventory[i] == -1)
			{
				return i
			}
		}
	}
	
}