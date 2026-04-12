/// @description Destroy on impact

// Do not destroy if coming in contact with player or semi solid object
if(place_meeting(x, y, obj_collision_parent)
	&& scr_is_solid(x, y)
	&& !place_meeting(x, y, obj_platform_semi_solid_parent) 
	&& !place_meeting(x, y, obj_player_parent))
	{

		// Change sprite to explosion on impact
		sprite_index = spr_spell_fireball_explosion;
		speed = 0;
		
		// Decrease size of default explosion sprite
		var image_scale = 0.75
		image_xscale = image_scale
		image_yscale = image_scale

		// Destruction on explosion animation end
		triggered = true;
	}
	
// If fireball hits something, start destruction timer
// Destruction timer set to how long explosion animation is
if(triggered == true)
{
	if(destruction_timer >= sprite_get_number(spr_spell_fireball_explosion))
	{
		instance_destroy()
	}
	destruction_timer++;
}