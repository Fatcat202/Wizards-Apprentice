function scr_part_systems_set_auto_update()
{
	
	// Pauses all particle effects while paused
	
	var i = 0;
	while(i < 20)
	{
		if(part_system_exists(i))
		{
			part_system_automatic_update(i, !global.game_paused);
			part_system_automatic_update(i, !global.game_esc_paused);
			part_system_automatic_update(i, !global.game_death_paused);
			part_system_automatic_update(i, !global.show_inventory);
		}
		i++
	}
}