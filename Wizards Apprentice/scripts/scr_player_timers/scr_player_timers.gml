
// Timers used by the player

function scr_player_timers()
{
	
	#region Jump Buffer
	
		// Ticks down counter for jump buffering
		
		// Reset timer whenever jump button is pressed
		if(global.cont_jump_pressed) jump_buffer_timer = jump_buffer_length
	
		// Tick down timer if active
		if(jump_buffer_timer > 0)
		{
			jump_key_buffered = true;
			jump_buffer_timer--
		}else jump_key_buffered = false;
		
	#endregion Jump Buffer
	
	#region Coyote Time
	
		// Ticks down counter for coyote time

		// Tick down timer if timer is active
		if(coyote_time_timer > 0) coyote_time_timer--;
	
		// Reset timer if on the ground
		if(scr_on_ground()) coyote_time_timer = coyote_time_length;

	#endregion Coyote Time
	
	#region Attack Timers
		
		// Check if cooldown ticking
		if(spell_cooldown_1 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_1++;
			if(spell_cooldown_timer_1 >= spell_cooldown_time_1) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_1 = false;
				spell_cooldown_timer_1 = 0;
			}
		}
	
		// Check if cooldown ticking
		if(spell_cooldown_2 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_2++;
			if(spell_cooldown_timer_2 >= spell_cooldown_time_2) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_2 = false;
				spell_cooldown_timer_2 = 0;
			}
		}
	
		// Check if cooldown ticking
		if(spell_cooldown_3 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_3++;
			if(spell_cooldown_timer_3 >= spell_cooldown_time_3) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_3 = false;
				spell_cooldown_timer_3 = 0;
			}
		}
	
		// Check if cooldown ticking
		if(spell_cooldown_4 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_4++;
			if(spell_cooldown_timer_4 >= spell_cooldown_time_4) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_4 = false;
				spell_cooldown_timer_4 = 0;
			}
		}
	
		// Check if cooldown ticking
		if(spell_cooldown_5 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_5++;
			if(spell_cooldown_timer_5 >= spell_cooldown_time_5) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_5 = false;
				spell_cooldown_timer_5 = 0;
			}
		}
	
		// Check if cooldown ticking
		if(spell_cooldown_6 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_6++;
			if(spell_cooldown_timer_6 >= spell_cooldown_time_6) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_6 = false;
				spell_cooldown_timer_6 = 0;
			}
		}
	
		// Check if cooldown ticking
		if(spell_cooldown_7 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_7++;
			if(spell_cooldown_timer_7 >= spell_cooldown_time_7) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_7 = false;
				spell_cooldown_timer_7 = 0;
			}
		}
	
		// Check if cooldown ticking
		if(spell_cooldown_8 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_8++;
			if(spell_cooldown_timer_8 >= spell_cooldown_time_8) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_8 = false;
				spell_cooldown_timer_8 = 0;
			}
		}
	
		// Check if cooldown ticking
		if(spell_cooldown_9 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_9++;
			if(spell_cooldown_timer_9 >= spell_cooldown_time_9) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_9 = false;
				spell_cooldown_timer_9 = 0;
			}
		}
	
		// Check if cooldown ticking
		if(spell_cooldown_10 == true)
		{
			// Increment cooldown each frame
			spell_cooldown_timer_10++;
			if(spell_cooldown_timer_10 >= spell_cooldown_time_10) 
			{
				// Reset cooldown once time has been reached
				spell_cooldown_10 = false;
				spell_cooldown_timer_10 = 0;
			}
		}
		
	#endregion Attack Timers
	
	#region Effect Timers
		
		// Check if cooldown ticking
		if(spell_jump_active == true)
		{
			// Increment cooldown each frame
			spell_jump_timer++;
			if(spell_jump_timer >= spell_jump_duration) 
			{
				// Reset cooldown once time has been reached
				spell_jump_active = false;
				spell_jump_timer = 0;
				
				// Reset max jumps
				max_jumps -= global.spell_stats[scr_find_spell_index("jump")].uses
				// Ensure jumps left is not greater than max jumps
				if(jumps_left > max_jumps) jumps_left = max_jumps;
			}
		}
		
		
	#endregion Effect Timers
	

}