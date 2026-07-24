/// @description Leaving Level

scr_set_room_number()

show_debug_message(global.active_level_num)

// Search through all chests in level. If either no chests or all are empty, set room variable to true
var chests_empty = true;
with(obj_interact_chest)
{
	for(var i = 0; i < inventory_slots; i++)
	{
		if(inventory[i] != -1 || chest_gold > 0)
		{
			chests_empty = false
		}
	}
}
global.arr_levels[global.active_level_num].level_chests_empty = chests_empty


// Save gamestate
scr_save_game()


// Transfer to level end room
scr_transfer_to_room(rm_level_end)