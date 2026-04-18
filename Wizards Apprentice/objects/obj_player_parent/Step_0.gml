/// @description Controls

event_inherited()

// Check for and tick most player timers
scr_player_timers()

// Used for testing health and mana functionality
scr_health_and_mana_test()

// Used to provide debug outputs for health, mana, and drain
//scr_health_and_mana_debug()


#region Controls

	#region Movement
	
		// Set move state to idle if located on the ground
		if(scr_on_ground())
		{
			state_move = state_idle
		}
	
		#region Changing Modifiers Based On Platform Element
	
			// Detects platform ID below player
			var plat_id = instance_place(x, y + 1, obj_collision_parent)
			if(plat_id != noone)
			{
				if(object_is_ancestor(plat_id.object_index, obj_character) == false)
				{
				
					// Gathers platform element
					var plat_element = plat_id.element
					if(plat_element == "Oil")
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
			
			
					}else if(plat_element == "Ice")
					{
						// Rest any changes
						scr_reset_move_modifiers();
				
						// Change acceleration/deceleration
						h_acel = h_acel_default * plat_spd_acel_ice;
						h_decel = h_decel_default * plat_spd_decel_ice;
				
				
					}else if(plat_element == "Water")
					{
						
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
					
				}
			}else scr_reset_move_modifiers() // Rest any changes when not on the ground
			

		
		#endregion Changing Modifiers Based On Platform Element


		#region Jumping

			
			function func_jump()
			{
				// Set the jump hold timer
				jump_hold_timer = jump_hold_frames;
				
				// Reset coyote time to prevent double jump
				coyote_time_timer = 0;
				
				// Reset jump buffer to prevent double jump
				jump_key_buffered = 0;
				jump_buffer_timer = 0;
				
				// Set vertical move speed to jump speed
				move_spd_v = jump_speed
				
				// Set state to jumping
				state_move = state_jumping;
				
				// Decrease jumps left
				jumps_left = jumps_left - 1;
				
				// Jumps left debug
				//show_debug_message("jumps_left: " + string(jumps_left))
			}
			
			// Check if the character is stunned
			if(is_stunned == false)
			{
			
				// Jump if on a surface and the button to jump is pressed
				if(coyote_time_timer > 0 && (jump_key_buffered || global.cont_jump_pressed ) && jumps_left > 0)
				{
					func_jump()
				
					// Allow double jumping when off the ground with more than 1 max jump
				}else if(!scr_on_ground() && global.cont_jump_pressed && jumps_left > 0)
				{
					func_jump()
				// End jump spell if all jumps are used
				}else if(jumps_left == 0 && spell_jump_active == true) spell_jump_duration = 0;
			
			
				// End jump held timer if no longer held, or hitting collision object above
				if(!global.cont_jump_held or (place_meeting(x, y - 1, obj_collision_parent) && scr_is_solid(x, y - 1) && !scr_check_semi_solid(x, y -1))) jump_hold_timer = 0;
			
				// Count down jump held timer
				if(jump_hold_timer > 0 && global.cont_jump_held)
				{
					// Keep vertical move speed as jump speed when active, negative gravity
					move_spd_v = jump_speed
				
					// Tick timer
					jump_hold_timer--;
				}
			}
			
			
		#endregion Jumping
		
		#region Crouching
			
			if(global.cont_crouch)
			{
				
				//Cancel held jump
				jump_hold_timer = 0;
				
				// Increase gravity (located below in gravity section)
				
				state_move = state_crouch
			}
			
		#endregion Crouching
		
		#region Semi Solid
			// Used to determine if character should be solid or semi solid
			
			if(state_move == state_crouch || state_move == state_jumping)
			{
				semi_solid = true
			}else semi_solid = false
			
		#endregion Semi Solid
			
		#region Moving Sprite
			
			// Assign input variable defaults
			var _left = 0;
			var _right = 0;

			// Determine movement direction based on key presses, prevent self from touching solid objects
			_left = global.cont_left;
			_right = global.cont_right;

			// Define if the player is walking
			if(_right || _left > 0)
			{
				is_walking = true;
			}else is_walking = false;

			// Calculate horizontal directional being moved in
			var h_dir = _right - _left
			
			// Apply horizontal acceleration
			move_spd_h += h_dir * h_acel
			
			// Apply horizontal deceleration
			if(h_dir == 0){
				move_spd_h *= h_decel
			}
			
			// Set max horizontal movement speed
			move_spd_h = clamp(move_spd_h, -move_spd_max, move_spd_max)
			// Set and apply terminal velocity
			if(move_spd_v < term_vel) move_spd_v = term_vel;
			
			// Used for sub pixel collisions to ensure accuracy
			var sub_pixel = 0.5
			var search = sub_pixel
	
			// Moving up slope
			// Detect if a slope is present
			if(!place_meeting(x + move_spd_h, y - abs(move_spd_h) - search, obj_platform_parent) && !scr_is_solid(x + move_spd_h, y - abs(move_spd_h) - search) && !scr_check_semi_solid(x + move_spd_h, y - abs(move_spd_h) - search))
			{
				// Move up slope if present
				while(place_meeting(x + move_spd_h, y, obj_platform_parent) && scr_is_solid(x + move_spd_h, y) && !scr_check_semi_solid(x + move_spd_h, y)) y -= sub_pixel
			}else
			{
				// Preventing getting stuck with collision objects horizontaly
				if(place_meeting(x + move_spd_h, y, obj_platform_parent) && scr_is_solid(x + move_spd_h, y) && !scr_check_semi_solid(x + move_spd_h, y)) move_spd_h = 0
			}
			
			// Moving down slope
			// Detect if a slope is present
			if((!place_meeting(x + move_spd_h, y + search, obj_platform_parent) && !scr_is_solid(x + move_spd_h, y + search) && !scr_check_semi_solid(x + move_spd_h, y + search)) && (place_meeting(x + move_spd_h, y + abs(move_spd_h), obj_platform_parent) && scr_is_solid(x + move_spd_h, y + abs(move_spd_h)) && !scr_check_semi_solid(x + move_spd_h, y + abs(move_spd_h))))
			{
				// Move down slope if present
				while(!place_meeting(x + move_spd_h, y + sub_pixel, obj_platform_parent) && !scr_is_solid(x + move_spd_h, y) && !scr_check_semi_solid(x + move_spd_h, y + sub_pixel))
				{
					y += sub_pixel
				}
			}
			
			// Fall when hitting head on ceiling
			if(state_move == state_jumping && place_meeting(x, y - 2, obj_platform_parent) && scr_is_solid(x, y - 2) && !scr_check_semi_solid(x, y - 2)) move_spd_v = -grav
			
			
			// Move object horizontally
			x += move_spd_h
			// Move object vertically
			y -= move_spd_v
			
			
			// Flip sprite when moving
			if(move_spd_h < 0)
			{
				image_xscale = -1;
			}else if(move_spd_h > 0) image_xscale = 1;
			
			// State machine for jumping and falling
			state_move();


			// Gravity
			if(!scr_on_ground())
			{
				// Increment gravity based on if crouching or not
				// Fall at double speed when crouching
				if(state_move == state_crouch)
				{
					move_spd_v -= grav * 2;
				}else
				{
					move_spd_v -= grav;
				}

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
			
			
			
			// Test curent movement speeds
			//show_debug_message("move_spd_h = " + string(move_spd_h))
			//show_debug_message("move_spd_v = " + string(move_spd_v))


			// Declare the player is falling after reaching apex of jump
			if(move_spd_v < 0 && state_move != state_falling)
			{
				// Decrease jumps left to prevent excess jumps when falling off platform
				// Also prevent losing double jump when falling after jumping
				if(state_move == state_idle) jumps_left -= 1
			
				// Set jump state to falling
				state_move = state_falling
			}
				
		#endregion Moving Sprite
	
		
		#region Preventing getting stuck inside collision objects
			
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
		#endregion Preventing getting stuck inside collision objects

	#endregion Movement
	
	#region Swap Spells
	
		var spell_selected = active_spell
		if(global.cont_spell_1) spell_selected = 1
		if(global.cont_spell_2) spell_selected = 2
		if(global.cont_spell_3) spell_selected = 3
		if(global.cont_spell_4) spell_selected = 4
		if(global.cont_spell_5) spell_selected = 5
		if(global.cont_spell_6) spell_selected = 6
		if(global.cont_spell_7) spell_selected = 7
		if(global.cont_spell_8) spell_selected = 8
		if(global.cont_spell_9) spell_selected = 9
		if(global.cont_spell_10) spell_selected = 10
			
		// Adds scrolling selection for active spells
		if(mouse_wheel_up())
		{
			spell_selected++;
		} else if(mouse_wheel_down())
		{
			spell_selected--;
		}
		
		// Loop mouse scroll if going beyond bound of spells
		if(spell_selected < 1) spell_selected = total_spells;
		else if(spell_selected > total_spells) spell_selected = 1;
		
		// Assign new active spell, provided it is a spell that exists
		active_spell = spell_selected;
		
		
	#endregion Swap Spells
	
	#region Use Spell
		
		if(global.cont_attack && can_attack && is_stunned == false)
		{ 
			switch(active_spell)
			{
				case 1:
				
					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/

					// Execute spell script if off cooldown
					if(spell_cooldown_1 == false) script_execute(arr_active_spells[active_spell].scr);

				break;

				case 2:
				
					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/
					
					// Execute spell script if off cooldown
					if(spell_cooldown_2 == false) script_execute(arr_active_spells[active_spell].scr);
					
				break;

				case 3:
				
					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/
					
					// Execute spell script if off cooldown
					if(spell_cooldown_3 == false) script_execute(arr_active_spells[active_spell].scr);
					
				break;
				
				case 4:
				
					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/
					// Execute spell script if off cooldown
					if(spell_cooldown_4 == false) script_execute(arr_active_spells[active_spell].scr);
					
				break;
				
				case 5:

					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/
					
					// Execute spell script if off cooldown
					if(spell_cooldown_5 == false) script_execute(arr_active_spells[active_spell].scr);
					
				break;
				
				case 6:

					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/
					
					// Execute spell script if off cooldown
					if(spell_cooldown_6 == false) script_execute(arr_active_spells[active_spell].scr);
					
				break;
				
				case 7:
				
					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/
					
					// Execute spell script if off cooldown
					if(spell_cooldown_7 == false) script_execute(arr_active_spells[active_spell].scr);
					
				break;
				
				case 8:

					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/
					
					// Execute spell script if off cooldown
					if(spell_cooldown_8 == false) script_execute(arr_active_spells[active_spell].scr);
					
				break;

				case 9:

					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/
					
					// Execute spell script if off cooldown
					if(spell_cooldown_9 == false) script_execute(arr_active_spells[active_spell].scr);
					
				break;
				
				case 10:

					//Debug
					/*
					show_debug_message("Script: " + string(global.spell_stats[active_spell].scr))
					show_debug_message("active_spell: " + string(active_spell))
					show_debug_message("Spell: " + string(global.spell_stats[active_spell]))
					*/
					
					// Execute spell script if off cooldown
					if(spell_cooldown_10 == false) script_execute(arr_active_spells[active_spell].scr);
					
				break;
			}
			
			// Debug
			//show_debug_message("global.spell_stats[active_spell].scr: " + string(global.spell_stats[active_spell].scr))
			//show_debug_message("active_spell: " + string(active_spell))
		}
		
		
	#endregion Use Spell


#endregion Controls

