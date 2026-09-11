/// @description Damage


scr_damage(damage)

// If projectile, destroy on contact
if(move_spd > 0)
{
	scr_spell_alert_enemy(other.id)
	instance_destroy()
}

