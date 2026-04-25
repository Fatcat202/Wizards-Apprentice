/// @description Insert description here
// You can write your code in this editor
/// @description Destroy on impact

// Do not destroy if coming in contact with semi solid object
//if(scr_is_solid(x, y) && !place_meeting(x, y, obj_platform_semi_solid_parent))
{
	
	scr_element_platform_interactions(id, other.id)
	
	// Change sprite to explosion on impact
	sprite_index = spr_spell_fireball_explosion;
	speed = 0;
	
	// Destruction on explosion animation end
	triggered = true;

}