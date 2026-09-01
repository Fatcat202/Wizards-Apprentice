// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_action_teleport_away()
{
	show_debug_message("Action: Teleport_Away")
	
	// When low on health and the player is near, attempt to teleport to a safe platform within line of sight to the player
	
	// Locate all platforms within a range of the player that have the space above them free and is within line of sight to the player
	// Select a platform, teleport caster to it
	
	// Player positions
	var player_x = obj_player_parent.x;
	var player_y = obj_player_parent.y;
	
	// DS list holding all platforms within range
	var ds_near_platforms = ds_list_create();
	var num_near_platforms = collision_circle_list(player_x, player_y, vision_range, obj_platform_parent, false, true, ds_near_platforms, true)
	
	// Array holding all nearby platforms matching criteria
	var arr_free_platforms = [];
	
	// Loop through all near platforms, searching for one matching criteria
	for(var i = 0; i < num_near_platforms; i++)
	{
		// Check if position above platform is empty
		var above_empty = !place_meeting(ds_near_platforms[| i].x, ds_near_platforms[| i].y - global.cell_size, obj_collision_parent);
		// Check for direct line of sight between player and position above platform
		var los = !collision_line(ds_near_platforms[| i].x, ds_near_platforms[| i].y - global.cell_size, player_x, player_y, obj_platform_parent, false, true);
		// Check platform is not a void platform
		var is_void = (ds_near_platforms[| i].object_index == obj_platform_void) || (ds_near_platforms[| i].object_index == obj_platform_void_slope);
		
		// If all criteria match, add to array
		if(above_empty == true && los == true && is_void == false)
		{
			array_push(arr_free_platforms, ds_near_platforms[| i])
		}
	}
	
	// If array is not empty
	if(array_length(arr_free_platforms) > 0)
	{
		// Reverse array to find furthest point
		arr_free_platforms = array_reverse(arr_free_platforms)
		
		// Teleport caster
		id.x = arr_free_platforms[0].x;
		id.y = arr_free_platforms[0].y - global.cell_size;
				
//		show_debug_message("Caster Teleported")
		
	}else
	{
//		show_debug_message("No Platform Found")
	}
	
	// Memory reset
	ds_list_destroy(ds_near_platforms)
}