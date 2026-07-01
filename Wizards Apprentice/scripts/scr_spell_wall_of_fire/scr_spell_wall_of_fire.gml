
function scr_spell_wall_of_fire()
{
	scr_pull_spell_data("wall of fire")
	
	#region Wall Logic
	
	// Detect if the mouse is close enough to ground to use
	// Lock to the top of ground objects
	// Scale wall to size if ceiling is within range
	
		// Set max height of wall
		var max_wall_height = 2
		var wall_height = max_wall_height	
		// Set x cords
		var location_x = mouse_x
		
		var x_offset =  0
		var y_offset =  0
		
		
		// Used to set image angle of wall sprite for purposes of slopes
		var wall_angle = image_angle
	
		// Sprite height of spr_wall_of_fire
		var spr_height = sprite_get_height(spr)
		//show_debug_message("spr_height = " + string(spr_height))
	

		// Search for closest ground object within a distance. Gather id, otherwise cancel spell
		var obj_id = -1;
		for(var i = 0; i <= (spr_height); i++)
		{
			if(place_meeting(location_x, mouse_y + i, obj_platform_parent))
			{
				obj_id = instance_place(location_x, mouse_y + i, obj_collision_parent);
				break;
			}
		}
	
		// Prevent snapping onto ground objects above the mouse
		if(obj_id.y < mouse_y) exit
	
		// Cancel spell if no ground object found
		if(obj_id == -1) exit
	
		// Height of sprite of ground object found
		var s_height = sprite_get_height(obj_id.sprite_index)
		//show_debug_message("s_height = " + string(s_height));
	
	
		// Lock y cord onto top of located ground object
		var location_y = obj_id.y - (s_height / 2)
		
		
	/* // Unfinished testing for allowing walls to function properly on slopes
	
	
		// If the located platform is a slope
		if(object_is_ancestor(obj_id.object_index, obj_platform_aa_slope_parent) == true)
		{
			// Left slope
			if(obj_id.object_index == obj_platform_aa_slope_left || (obj_id.object_index == obj_platform_aa_slope_top_left && obj_id.above_free == false))
			{scr_test()
				// Check every pixel above for solid or semi solid ground
				for(var i = 0; i < spr_height * max_wall_height; i++)
				{
					// If finding ground, get image_yscale. Ignore ground object the wall is created on
					if((place_meeting(location_x - i, location_y - i, obj_platform_parent)) && !place_meeting(location_x - i, location_y - i, obj_id))
					{scr_test()
						// Set image_yscale by comparing distance to obj above
						wall_height =  i / spr_height
						
						//x_offset =  sprite_get_width(spr_plat_aa_square) / 2
						y_offset =  sprite_get_height(spr_plat_aa_square) / 2

						// Set image angle
						wall_angle = 45;

						// Debug
						//show_debug_message("wall_height = " + string(wall_height))
						//show_debug_message("i = " + string(i))
			
						// Cap scaling at max defined
						if(wall_height > max_wall_height) wall_height = max_wall_height;
			
						break;
					}//else show_debug_message("NO GROUND FOUND ABOVE")
		
					// Check corrected wall_height
					//show_debug_message("wall_height = " + string(wall_height))
				}
			}else
			
			// Right slope
			if(obj_id.object_index == obj_platform_aa_slope_right || (obj_id.object_index == obj_platform_aa_slope_top_right && obj_id.above_free == false))
			{
				// Check every pixel above for solid or semi solid ground
				for(var i = 0; i < spr_height * max_wall_height; i++)
				{
					// If finding ground, get image_yscale. Ignore ground object the wall is created on
					if((place_meeting(location_x + i, location_y - i, obj_platform_parent)) && !place_meeting(location_x + i, location_y - i, obj_id))
					{
						// Set image_yscale by comparing distance to obj above
						wall_height =  i / spr_height
						
					//	x_offset =  sprite_get_width(spr_plat_aa_square) / 2
						y_offset =  sprite_get_height(spr_plat_aa_square) / 2
						
						// Set image angle
						wall_angle = 315;
						
						// Debug
						//show_debug_message("wall_height = " + string(wall_height))
						//show_debug_message("i = " + string(i))
			
						// Cap scaling at max defined
						if(wall_height > max_wall_height) wall_height = max_wall_height;
			
						break;
					}//else show_debug_message("NO GROUND FOUND ABOVE")
		
					// Check corrected wall_height
					//show_debug_message("wall_height = " + string(wall_height))
				}
			}
			
		}else*/ // If platform is not a slope
		{
			// Check every pixel above for solid or semi solid ground
			for(var i = 0; i < spr_height * max_wall_height; i++)
			{
				// If finding ground, get image_yscale. Ignore ground object the wall is created on
				if((place_meeting(location_x, location_y - i, obj_platform_parent)) && !place_meeting(location_x, location_y - i, obj_id))
				{
					// Set image_yscale by comparing distance to obj above
					wall_height =  i / spr_height
			
					// Debug
					//show_debug_message("wall_height = " + string(wall_height))
					//show_debug_message("i = " + string(i))
			
					// Cap scaling at max defined
					if(wall_height > max_wall_height) wall_height = max_wall_height;
			
					break;
				}//else show_debug_message("NO GROUND FOUND ABOVE")
		
				// Check corrected wall_height
				//show_debug_message("wall_height = " + string(wall_height))
			}
		}
		
	#endregion Wall Logic

	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(mana) == false) exit

	// Create wall instance
	fire_wall = instance_create_layer(location_x + x_offset, location_y + y_offset, "Spells", obj_spell_wall_of_fire)
		scr_push_spell_data(fire_wall)
		
		fire_wall.location_x = location_x
		fire_wall.location_y = location_y
		fire_wall.image_yscale = wall_height
		fire_wall.image_angle = wall_angle

	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(cooldown)
}