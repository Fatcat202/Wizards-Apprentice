
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
	

}