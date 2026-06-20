/// @description On Click

var index = 0;
for(var i = 0; i < global.item_index_length + 1; i++)
{
	if(inventory[item] == global.item_stats[i])
	{
		index = i;
		break;
	}	
}
// Add item to inventory
scr_inventory_add(index, global.inventory_slots, global.inventory)

// Remove item from chest
inventory[item] = -1

// Destroy self and menu
instance_destroy(obj_item_control_menu)
instance_destroy(obj_button_take)