/// @description Enemy AI


// Run enemy AI states
state_behavior()

// Movement logic
if(can_move == true)
{

	#region Changing Modifiers Based On Platform Element
	
		// Detects platform ID below player
		var plat_id = instance_place(x, y + 1, obj_platform_parent)
		if(plat_id != noone)
		{
				
			if(plat_id.oil_level > 0)
			{
				// Rest any changes
				scr_reset_move_modifiers();
				
				// Change move speed to match
				plat_spd_mod = plat_spd_oil;
			
				// Change acceleration/deceleration
				h_acel = h_acel_default * plat_spd_mod;
				h_decel = h_decel_default * plat_spd_mod;
				// Change max move speed
				move_spd_max = move_spd_max_default * plat_spd_mod;
			
			
			}else
					
			if(plat_id.is_ice == true)
			{
				// Rest any changes
				scr_reset_move_modifiers();
				
				// Change acceleration/deceleration
				h_acel = h_acel_default * plat_spd_acel_ice;
				h_decel = h_decel_default * plat_spd_decel_ice;
				
				
			}else
					
			if(plat_id.water_level > 0)
			{
				// Rest any changes
				scr_reset_move_modifiers();
						
				// If the character is standing on a charged water platform
				if(plat_id.is_charged)
				{
	
					// Determines if the character can be stunned
					if(can_be_stunned == true)
					{
						// Declares the player platform stunned, starting timer until no longer stunned
						plat_stunned = true
					}
							
				}
			}else scr_reset_move_modifiers() // Rest any changes when on the ground
					
				
		}else scr_reset_move_modifiers() // Rest any changes when not on the ground
			

		
	#endregion Changing Modifiers Based On Platform Element
	
	
	#region Move Object

		// Cause enemy to fall if hitting head on ceiling
		if(place_meeting(x, y - 2, obj_collision_parent) && scr_is_solid(x, y - 2) && !scr_check_semi_solid(x, y - 2))
		{
			if(move_spd_v > 0) move_spd_v = 0
		}

		// Set max horizontal movement speed
		move_spd_h = clamp(move_spd_h, -move_spd_max, move_spd_max)
		// Set and apply terminal velocity
		if(move_spd_v < term_vel) move_spd_v = term_vel;
		

		#region Slopes
			
			// Used for sub pixel collisions to ensure accuracy
			var sub_pixel = 0.5
			
			// Check for horizontal collision
			if(place_meeting(x + move_spd_h, y, obj_platform_parent))
			{
				// Check for slope to go up
				if(!place_meeting(x + move_spd_h, y - abs(move_spd_h) - 1, obj_collision_parent))
				{
					// Go up slope
					while(place_meeting(x + move_spd_h, y, obj_collision_parent))
					{
						y -=  sub_pixel
					}
				}else
				{	
					// Preventing getting stuck with collision objects horizontaly
					move_spd_h = 0
				}
			}
			
			// Check for slope to go down
			if(move_spd_v >= 0 && !place_meeting(x + move_spd_h, y + 1, obj_collision_parent) && place_meeting(x + move_spd_h, y + abs(move_spd_h) + 1, obj_collision_parent))
			{
				// Go down slope
				while(!place_meeting(x + move_spd_h, y + sub_pixel, obj_collision_parent))
				{
						y += sub_pixel
				}
			}
				
		#endregion Slopes
		
		// Declare movement direction
		if(move_spd_h > 0)
		{
			move_dir = 1
		}else
		if(move_spd_h < 0)
		{
			move_dir = -1
		}
		
		// Short jump over adjacent platform
		scr_step_over_platform()
		
		var check_dist = (global.cell_size) * move_dir
		
		// ledge detected
//		var ledge = !place_meeting(x + check_dist, y + global.cell_size, obj_platform_parent)
		// Detects if ledge would be a low fall
//		var low_fall = place_meeting(x + check_dist,y + global.cell_size*2, obj_platform_parent)
				
		
		// Cause enemy to fall off player head if landing on player
		if(place_meeting(x, y + 2, obj_player_parent))
		{
			if(rand_shift_dir == -1) rand_shift_dir = irandom(1)
			
			// Shift left
			if(rand_shift_dir == 0)
			{
				move_spd_h -= 2
			}else
			
			// Shift right
			if(rand_shift_dir == 1)
			{
				move_spd_h += 2
			}
		}else rand_shift_dir = -1
		
		#region Distance to Player Check
			// Enemy stops movement if within the width of the player sprite to the player
			if(point_distance(x, y, obj_player_parent.x, obj_player_parent.y) < sprite_get_width(spr_player)
			&& !place_meeting(x, y + 2, obj_player_parent))
			{
				move_spd_h = 0
			}
		#endregion Distance to Player Check
		
		#region Semi-Solid Passthrough
			// If target is below enemy, activate semi solid to pass through platforms
			if(target_y > y)
			{
				semi_solid = true;
			}else
			{
				semi_solid = false;
			}
		#endregion Semi-Solid Passthrough	

		// Move object horizontally
		x += move_spd_h
		// Move object vertically
		y -= move_spd_v

	
	#endregion Move Object
	
	
	#region Gravity
	
		if(!flies)
		{
			if(!scr_on_ground())
			{
				move_spd_v -= global.grav;

				// Gravity Debug
				//show_debug_message("Gravity On")
			}else
			{
				// Reset y speed if on the ground
				move_spd_v = 0
				
				// Gravity Debug
				//show_debug_message("Gravity Off")
			}
		}
	
	#endregion Gravity
	
	
	#region Flipping Sprite
	
		// Flip sprite when moving	
		if(move_dir = 1)
		{
			image_xscale = 1
		}else 
		
		if(move_dir = -1)
		{
			image_xscale = -1
		}

		
	#endregion Flipping Sprite
			
	
	#region Collisions
	
		// Force objects outside of other objects if stuck or overlaping
		if(place_meeting(x, y, obj_collision_parent) && scr_is_solid(x,y) && !scr_check_semi_solid(x, y))
		{
			for(var i = 0; i < 1000; i++)
			{
				// Right
				if(!place_meeting(x + i, y, obj_collision_parent) || !scr_is_solid(x + i , y))
				{
					x += i;
					break;	
				}

				// Left
				if(!place_meeting(x - i, y, obj_collision_parent) || !scr_is_solid(x - i , y))
				{
					x -= i;
					break;	
				}
		
				// Up
				if(!place_meeting(x, y + i, obj_collision_parent) || !scr_is_solid(x , y + i))
				{
					y += i;
					break;	
				}
		
				// Down
				if(!place_meeting(x, y - i, obj_collision_parent) || !scr_is_solid(x , y - i))
				{
					y -= i;
					break;	
				}
		
				// Top Right
				if(!place_meeting(x + i, y + i, obj_collision_parent) || !scr_is_solid(x + i , y + i))
				{
					x += i;
					y += i;
					break;	
				}
			
				// Top Left
				if(!place_meeting(x - i, y + i, obj_collision_parent) || !scr_is_solid(x - i , y + i))
				{
					x -= i;
					y += i;
					break;	
				}
			
				// Bottom Right
				if(!place_meeting(x + i, y - i, obj_collision_parent) || !scr_is_solid(x + i ,y - i))
				{
					x += i;
					y -= i;
					break;	
				}
			
				// Bottom Left
				if(!place_meeting(x - i, y - i, obj_collision_parent) || !scr_is_solid(x - i , y - i))
				{
					x -= i;
					y -= i;
					break;	
				}
			}
		}
		
	#endregion Collisions
	
}


