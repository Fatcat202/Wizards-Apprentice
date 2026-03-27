/// @description Controls

event_inherited()

// Tick coyote time each cycle
func_coyote_time()
// Check for jump buffering
func_jump_buffer()


	#region Controls


	#region Movement


		#region Jump States
			// Set jump state to idle if located on the ground
			if(scr_on_ground())
			{
				state_jump = state_idle
			}
			
			// Jump if on a surface and the button to jump is pressed
			if(coyote_time_timer > 0 && (jump_key_buffered || global.cont_jump_pressed ))
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
				state_jump = state_jumping;
			}
			
			// End jump held timer if no longer held, or hitting collision object above
			if(!global.cont_jump_held or place_meeting(x, y - 1, obj_collision_parent)) jump_hold_timer = 0;
			
			// Count down jump held timer
			if(jump_hold_timer > 0 && global.cont_jump_held)
			{
				// Keep vertical move speed as jump speed when active, negative gravity
				move_spd_v = jump_speed
				
				// Tick timer
				jump_hold_timer--;
			}
			
			
		#endregion Jump States
		
			
		#region Moving Sprite
			
			// Assign input variable defaults
			var _left = 0;
			var _right = 0;

			// Determine movement direction based on key presses, prevent self from touching solid objects
			if(place_free (x - collision_speed, y)) _left = global.cont_left;

			if(place_free (x + collision_speed, y)) _right = global.cont_right;

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
			state_jump();
			
			// Increment gravity
			if(!scr_on_ground())
			{
				move_spd_v -= grav;
			}else if(scr_on_ground()) move_spd_v = 0
			
			
			// Test curent movement speeds
			//show_debug_message("move_spd_h = " + string(move_spd_h))
			//show_debug_message("move_spd_v = " + string(move_spd_v))
				
		#endregion Moving Sprite
			
		// Declare the player is falling after reaching apex of jump
		if(move_spd_v < 0 && state_jumping)
		{
			state_jump = state_falling
		}
	
		
		#region Preventing getting stuck inside collision objects
			
			// Force objects outside of other objects if stuck or overlaping
			if(place_meeting(x, y, obj_collision_parent) || place_meeting(x, y, obj_enemy_parent))
			{
				for(var i = 0; i < 1000; i++)
				{
					// Right
					if(!place_meeting(x + i, y, obj_collision_parent) && !place_meeting(x + i, y, obj_enemy_parent))
					{
						x += i;
						break;	
					}

					// Left
					if(!place_meeting(x - i, y, obj_collision_parent) && !place_meeting(x - i, y, obj_enemy_parent))
					{
						x -= i;
						break;	
					}
		
					// Up
					if(!place_meeting(x, y + i, obj_collision_parent) && !place_meeting(x, y + i, obj_enemy_parent))
					{
						y += i;
						break;	
					}
		
					// Down
					if(!place_meeting(x, y - i, obj_collision_parent) && !place_meeting(x, y - i, obj_enemy_parent))
					{
						y -= i;
						break;	
					}
		
					// Top Right
					if(!place_meeting(x + i, y + i, obj_collision_parent) && !place_meeting(x + i, y + i, obj_enemy_parent))
					{
						x += i;
						y += i;
						break;	
					}
			
					// Top Left
					if(!place_meeting(x - i, y + i, obj_collision_parent) && !place_meeting(x - i, y + i, obj_enemy_parent))
					{
						x -= i;
						y += i;
						break;	
					}
			
					// Bottom Right
					if(!place_meeting(x + i, y - i, obj_collision_parent) && !place_meeting(x + i, y - i, obj_enemy_parent))
					{
						x += i;
						y -= i;
						break;	
					}
			
					// Bottom Left
					if(!place_meeting(x - i, y - i, obj_collision_parent) && !place_meeting(x - i, y - i, obj_enemy_parent))
					{
						x -= i;
						y -= i;
						break;	
					}
				}
			}
		#endregion Preventing getting stuck inside collision objects

	#endregion Movement



	#endregion Controls

