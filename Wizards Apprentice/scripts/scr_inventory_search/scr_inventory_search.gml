function scr_inventory_search(inventory, inventory_slots, item = -1)
{
	// Return first available spot
	

	for(var i = 0; i < inventory_slots; i++)
	{
		if(inventory[i] == -1)
		{	
			return i
		}
	}
}
	