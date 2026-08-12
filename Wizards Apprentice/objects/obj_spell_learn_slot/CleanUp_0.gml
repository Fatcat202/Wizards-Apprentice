/// @description Return Scroll to Inventory

// Return item to player inventory
for(var i = 0; i < global.inventory_slots; i++)
{
	if(global.inventory[i] == -1)
	{
		global.inventory[i] = inventory[0]
		break;
	}
}

