/// @description Controls

event_inherited()

if(can_control == true)
{

	// State machine for jumping and falling
	state_jump();

	// Gravity
	grav = 0.275

	#region Controls


	#region Movement

		// Checks if the player is controllable
		if(can_control == true)
		{
			// Increment gravity
			if(!place_meeting(x, y + 1, obj_collision_parent))
			{
				y_speed += grav;
			}else if(place_meeting(x, y + 1, obj_collision_parent) && !keyboard_check_pressed(global.cont_jump)) y_speed = 0
			
			// Set and apply terminal velocity
			if(y_speed > term_vel) y_speed = term_vel;
			
			// Set jump state to idle if located on the ground
			if(place_meeting(x, y + 1, obj_collision_parent))
			{
				state_jump = state_idle
			}
			
			// Jump if on a surface and the button to jump is pressed
			if(place_meeting(x, y + 1, obj_collision_parent) && keyboard_check_pressed(global.cont_jump))
			{
				y_speed = jump_speed
				
				// Set state to jumping
				state_jump = state_jumping;
			}
			
			// Fall if head hits surface
			if(place_meeting(x, y - 1, obj_collision_parent))
			{
				y_speed = 0
				
				// Set state to falling
				state_jump = state_falling
			}
			
			#region Moving Sprite
			
				// Assign input variable defaults
				var _left = 0;
				var _right = 0;

				// Determine movement direction based on key presses, prevent self from touching solid objects
				if(place_free (x - collision_speed, y)) _left = keyboard_check(ord(global.cont_left));

				if(place_free (x + collision_speed, y)) _right = keyboard_check(ord(global.cont_right));

				// Define if the player is walking
				if(_right || _left > 0)
				{
					is_walking = true;
				}else is_walking = false;
			
			
				// Calculate overall directional being moved in
				var _hspd = _right - _left;
				var _vspd = 0;
				if(y_speed >= 0)
				{
					_vspd = 1
				}else _vspd = -1
	
				// Move player
				if(_hspd !=0 || _vspd != 0)
				{
					var _spd = move_spd;
					var _dir = point_direction(0, 0, _hspd, _vspd);
					var _xadd = lengthdir_x(_spd, _dir);
					var _yadd = lengthdir_y(_spd, _dir);
		
					x = x + _xadd;
					y = y + _yadd;

					// Flip image when moving
					if(_hspd < 0)
					{
						image_xscale = -1;
					}else image_xscale = 1;
				}
				
			#endregion Moving Sprite
			
			// Declare the player is falling after reaching apex of jump
			if(y_speed > 0 && state_jumping)
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
		}

	#endregion Movement

	/*
	#region Change Attacks

		if(keyboard_check_pressed(ord(global.cont_attack_1)))
		{
			active_power = 1;
			obj_button_attack_parent.image_index = 0;
			obj_button_atk_1.image_index = 1;
		}
		if(keyboard_check_pressed(ord(global.cont_attack_2)))
		{
			active_power = 2;
			obj_button_attack_parent.image_index = 0;
			obj_button_atk_2.image_index = 1;
		}
		if(keyboard_check_pressed(ord(global.cont_attack_3)))
		{
			active_power = 3;
			obj_button_attack_parent.image_index = 0;
			obj_button_atk_3.image_index = 1;
		}
		if(keyboard_check_pressed(ord(global.cont_attack_4)))
		{
			active_power = 4;
			obj_button_attack_parent.image_index = 0;
			obj_button_atk_4.image_index = 1;
		}

	#endregion Change Attacks

	#endregion Controls
	*/
}
