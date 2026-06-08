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

				// Reset number of jumps remaining
				jumps_left = max_jumps
				
				// Gravity Debug
				//show_debug_message("jumps_left = " + string(jumps_left))
				//show_debug_message("Gravity Off")
			}
		}
	
	#endregion Gravity
	
	#region Move Object

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
		if(move_spd_h > 0) move_dir = 1
		if(move_spd_h < 0) move_dir = -1
				
		var check_dist = (global.cell_size) * move_dir
		// Prevent falling off ledge
		if(!place_meeting(x + check_dist, y + global.cell_size, obj_platform_parent))
		{
			move_spd_h = 0
		}
				

		// Move object horizontally
		x += move_spd_h
		// Move object vertically
		y -= move_spd_v

	
	#endregion Move Object
	
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


