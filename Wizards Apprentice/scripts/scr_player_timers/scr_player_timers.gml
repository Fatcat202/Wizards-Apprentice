
// Timers used by the player

function scr_player_timers()
{
	
	#region Stun Cooldown
		
		// Ticks up counter until the character can be stunned again
	
		if(stun_cooldown_timer >= stun_cooldown_length)
		{
			// Declare the character can be stunned
			can_be_stunned = true
			
			// Reset timer
			stun_cooldown_timer = 0;
	
	
		}else stun_cooldown_timer++
	#endregion Stun Cooldown
	
	#region Mana Regen
		
		// Ticks up counter until mana can regen
		
		// Check if mana is less than max mana, allowing regeneration
		if(active_mana < max_mana)
		{
			// Start timer setting delay before mana starts regenerating
			if(mana_regen_delay_timer >= mana_regen_delay_length)
			{
	
				// Timer for regenerating timer without delay
				if(mana_regen_timer >= mana_regen_length)
				{
					// Increment mana
					active_mana++;
			
					// Reset timers
					mana_regen_timer = 0;
	
	
				}else mana_regen_timer++
			}else mana_regen_delay_timer++
		}else
		{
			// If mana is full, reset timers
			mana_regen_timer = 0;
			mana_regen_delay_timer = 0;
		}
	#endregion Stun Cooldown
	
	#region Platform Stun
	
		if(plat_stunned == true)
		{
			// Character cannot move and is stunned
			if(plat_stun_timer > 0)
			{
				// Declare the character is stunned
				is_stunned = true;
				// Set max move speed to 0
				move_spd_max = 0
				// Count down timer until character is no longer stunned
				plat_stun_timer--
			}else
			{
				// Declare the character is not stunned
				is_stunned = false
				// Declare platform stun to be over
				plat_stunned = false
				// Start timer until character can be stunned again
				can_be_stunned = false
				// Reset move speed to default
				move_spd_max = move_spd_max_default
				// Reset timer duration
				plat_stun_timer = plat_stun_length;
								
			}
		}
	
	#endregion Platform Stun
	
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
		
		// Loop through all timers
		for(var i = 1; i < array_length(global.arr_spell_timers); i++)
		{
			// Check if cooldown ticking
			if(global.arr_spell_timers[i].cooldown == true)
			{
				// Increment cooldown each frame
				global.arr_spell_timers[i].timer++;
				if(global.arr_spell_timers[i].timer >= global.arr_spell_timers[i].length) 
				{
					// Reset cooldown once time has been reached
					global.arr_spell_timers[i].cooldown = false;
					global.arr_spell_timers[i].timer = 0;
					
		//			show_debug_message("Timer Reset: " + string(i))
				}
			}
		}
		
	#endregion Attack Timers
	
	#region Effect Timers
		
		// Check if effect active
		if(spell_jump_active == true)
		{
			// Increment duration ticker each frame
			spell_jump_timer++;
			if(spell_jump_timer >= spell_jump_duration) 
			{
				// Reset duration once time has been reached
				spell_jump_active = false;
				spell_jump_timer = 0;
				
				// Set cooldown once duration has completed
				var _cooldown = global.spell_stats[scr_find_spell_index("jump")].cooldown
				scr_set_spell_cooldown(_cooldown, spell_jump_slot);
				
				// Reset max jumps
				max_jumps -= global.spell_stats[scr_find_spell_index("jump")].uses
				// Ensure jumps left is not greater than max jumps
				if(jumps_left > max_jumps) jumps_left = max_jumps;
			}
		}
		
		
	#endregion Effect Timers
	

}