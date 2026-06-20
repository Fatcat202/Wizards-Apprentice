/// @description On Click

var index = 0;
for(var i = 0; i < global.item_index_length + 1; i++)
{
	if(global.inventory[item] == global.item_stats[i])
	{
		index = i;
		break;
	}	
}

var slot = -1

for(var i = 0; i < inventory_slots; i++)
{
	if(chest_inventory[i] == -1)
	{
		slot = i
		
		break;
	}	
}

// Check if slot was found
if(slot = -1)
{
	show_debug_message("No Slot Available")
	exit;
}

/*
show_debug_message("slot: " + string(slot))
show_debug_message("item: " + string(item))
show_debug_message("index: " + string(index))
*/

// Send item to chest inventory
if(slot < inventory_slots) chest_inventory[slot] = global.item_stats[index];

// Remove item from inventory
global.inventory[item] = -1

// Destroy self and menu
instance_destroy(obj_item_control_menu)
instance_destroy(obj_button_take)