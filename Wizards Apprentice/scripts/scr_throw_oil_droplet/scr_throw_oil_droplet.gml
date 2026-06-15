// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// Used to create and throw flaming oil droplets when in contact with water based spells
function scr_throw_oil_droplet(_spell_id = spell_id, _platform_id = platform_id)
{
	// Create a number of flaming oil droplets equal to level of water spell
	// splitting remaining fuel in platform between them.
	// Throw oil droplets in random directions
	// with gravity affecting them and facing the direction they fly
			
	// Store level of spell to determine number of oil droplets and steam objects
	var spell_level = _spell_id.level;
			
	// Total fuel after split between each droplet and platform
	var fuel_split = _platform_id.fuel_left / (spell_level + 1)
			
	// Reduce platform fuel
	_platform_id.fuel_left = fuel_split;
			
	for(var i = 0; i < spell_level; i++)
	{
		// Create random speed of droplet
		var rand_spd = random_range(-4, 4)
				
		// Create random deviation in x origin point on platform
		var rand_x = random_range(-10, 10)
				
		// Create oil droplet, throwing it in random direction
		droplet = instance_create_layer(_platform_id.x + rand_x, _platform_id.y - _platform_id.sprite_height - 5, "Spells", obj_element_oil_droplet,
		{
			fuel_left : fuel_split,
			is_flaming : true,
			move_spd_v : 6,
			move_spd_h : rand_spd
					
		})
				
		// Create steam object for each water level in location droplet is spawned
		steam = instance_create_layer(_platform_id.x + rand_x, _platform_id.y - _platform_id.sprite_height - 5, "Spells", obj_element_steam_air)
	}
}