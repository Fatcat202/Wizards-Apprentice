/// @description Damage

#region Spell Type

	if(type == "RAY")
	{
		// Prevent Stacking
		if(!array_contains(arr_enemies_hurt, other.id))
		{
			scr_damage(damage)
			array_push(arr_enemies_hurt, other.id)	
		}

		scr_spell_alert_enemy(other.id)	
	
	}else

	// If projectile, destroy on contact
	if(type == "PROJECTILE")
	{
		scr_damage(damage)
		scr_spell_alert_enemy(other.id)
		instance_destroy()
	}else
	{
		scr_damage(damage)
	}
	
#endregion Spell Type

#region Status Effects
	var _can_stun = can_stun
	if(can_stun != -1)
	{
		with(other)
		{
			scr_stun(_can_stun)
		}
	}

	var _can_slow = can_slow;
	if(can_slow != -1)
	{
		with(other)
		{
			scr_slow(_can_slow)
		}
	}

	var _can_ignite = can_ignite;
	if(can_ignite != -1)
	{
		with(other)
		{
			scr_ignite(_can_ignite)
		}
	}

	var _can_freeze = can_freeze;
	if(can_freeze != -1)
	{
		with(other)
		{
			scr_freeze(_can_freeze)
		}
	}

	var _knockback = knockback;
	if(knockback != -1)
	{
		with(other)
		{
			scr_knockback(_knockback)
		}
	}

	var _can_poison = can_poison;
	if(can_poison != -1)
	{
		with(other)
		{
			scr_poison(_can_poison)
		}
	}
	
#endregion Status Effects

