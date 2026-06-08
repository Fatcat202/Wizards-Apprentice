function scr_player_search()
{
	var player_x = obj_player_parent.x
	var player_y = obj_player_parent.y
		
	// Player is within range
	if(point_distance(x, y, player_x, player_y) <= vision_range)
	{
		// Check there are no platforms or steam blocking vision
		if(!collision_line(x, y, player_x, player_y, obj_platform_solid_parent, true, false)
			&& !collision_line(x, y, player_x, player_y, obj_element_steam_parent, true, false))
		{
			
			// Declare player as visible
			player_visible = true;
			
			// Refresh target coords
			target_x = player_x;
			target_y = player_y;
			
			// Reset idle state alarm
			alarm_set(0, -1)
		}else
		{
			player_visible = false;
		}
	}else
	{
		player_visible = false;
	}
}