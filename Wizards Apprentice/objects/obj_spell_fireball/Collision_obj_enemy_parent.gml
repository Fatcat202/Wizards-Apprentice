/// @description Hitting Enemy


// Change sprite to explosion on impact
sprite_index = spr_spell_fireball_explosion;
speed = 0;

// Deal damage
if(other.can_damage) scr_damage(damage);
	
// Destruction on explosion animation end
triggered = true;
