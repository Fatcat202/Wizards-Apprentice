function scr_character_timers()
{
	#region Stun Cooldown
		
		// Ticks up counter until the character can be stunned again
		if(stun_cooldown_timer >= stun_cooldown_length)
		{
			// Declare the character can be stunned
			can_be_stunned = true
			
			// Reset timer
			stun_cooldown_timer = 0;
			
			stun_cooldown_length = stun_cooldown_length_base;
			
	
		}else stun_cooldown_timer++
		
	#endregion Stun Cooldown
	
	#region Freeze Timer
	
		if(freeze_timer >= freeze_length)
		{
			// Reset timer
			is_frozen = false;
			freeze_timer = 0;
			freeze_length = freeze_length_base;
		}freeze_timer++;
	
	#endregion Freeze Timer
	
	#region Poison Timer
		
		// Ticks up until reaching length, then damage player
		if(poison_timer >= poison_length)
		{
			if(poison_ticks <= 0)
			{
				// Reset timer
				is_poisoned = false;
				poison_length = poison_length_base;
				poison_ticks = 0;
				poison_timer = 0;
				
			}else
			{
				// Bypass elemental shields
				scr_damage(1, true)
				poison_ticks--;
			}
		}poison_timer++;
	
	#endregion Poison Timer
	
	#region Stun Timer
	
		if(stun_timer >= stun_length)
		{
			// Reset timer
			is_stunned = false;
			stun_timer = 0;
			stun_length = stun_length_base;
		}stun_timer++;
	
	#endregion Stun Timer
	
	#region Knockback Timer
	
		if(knockback_timer >= knockback_length)
		{
			// Reset timer
			is_knockedback = false;
			knockback_timer = 0;
			knockback_length = knockback_length_base;
		}knockback_timer++;
	
	#endregion Knockback Timer
	
	#region Ignite Timer
	
		if(ignite_timer >= ignite_length)
		{
			if(ignite_ticks <= 0)
			{
				// Reset timer
				is_ignited = false;
				ignite_length = ignite_length_base;
				ignite_ticks = 0;
				ignite_timer = 0;
				
			}else
			{
				// Do not bypass elemental shields
				scr_damage(1, false)
				ignite_ticks--;
			}
		}ignite_timer++;
	
	#endregion Ignite Timer
	
	#region Slow Timer
	
		if(slow_timer >= slow_length)
		{
			// Reset timer
			is_slowed = false;
			slow_timer = 0;
			slow_length = slow_length_base;
		}slow_timer++;
	
	#endregion Slow Timer
	
	#region Shield Timer
	
		if(shield_timer >= shield_length)
		{
			// Reset timer
			is_shielded = false;
			shield_timer = 0;
			shield_length = shield_length_base;
		}shield_timer++;
		
		if(shield_ticks <= 0)
		{
			// Reset timer
			is_shielded = false;
			shield_timer = 0;
			shield_length = shield_length_base;
		}
	
	#endregion Shield Timer
	

	

}