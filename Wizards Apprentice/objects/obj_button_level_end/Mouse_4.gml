/// @description When Pressed


scr_save_game()


// If level 00 is completed for first time, send player to tower top
if(global.level_stats[global.level_offset].level_completed && !global.level_stats[global.level_offset+1].level_completed)
{
	scr_transfer_to_room(rm_wizard_tower_top)
}else
{
	// Send player to wizard tower
	scr_transfer_to_room(rm_wizard_tower)
}