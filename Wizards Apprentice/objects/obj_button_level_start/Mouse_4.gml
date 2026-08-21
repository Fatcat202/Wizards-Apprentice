/// @description Level Start


scr_save_game()

if(selected_level != -1)
{
	// Prevent playing locked level
	if(global.level_stats[selected_level].level_unlocked == true)
	{
		// Transfer to selected level
		scr_transfer_to_room(room_name)
	}
}
