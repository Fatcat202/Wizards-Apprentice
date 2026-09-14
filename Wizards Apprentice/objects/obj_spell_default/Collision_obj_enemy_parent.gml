/// @description Damage


scr_damage(damage)

// If projectile, destroy on contact
if(move_spd > 0)
{
	scr_spell_alert_enemy(other.id)
	instance_destroy()
}

var _can_stun = can_stun
if(can_stun != -1)
{
	with(other)
	{
		scr_stun(_can_stun)
	}
}

