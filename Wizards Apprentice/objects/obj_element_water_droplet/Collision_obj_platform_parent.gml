/// @description Platform Interactions

// Change platform to water if empty, transfer remaining water level
if(other.element == "Empty")
{
	// Change element to water
	other.element = "Water"
	// Increment water level
	other.water_level += level;
	
}else

// If water, transfer level
if(other.element == "Water")
{
	// Increment water level
	other.water_level += level;
		
}else

// Store water level when Ice to release when thawed
if(other.element == "Ice")
{
	other.water_level += level;
}else

// If flaming, creating flaming oil droplet and steam, like with water spells
if(other.element == "Oil" && other.is_flaming == true)
{		
	// Total fuel after split between each droplet and platform
	var fuel_split = other.fuel_left / (level + 1)
			
	// Reduce platform fuel
	other.fuel_left = fuel_split;
			
	for(var i = 0; i < level; i++)
	{
		// Create random speed of droplet
		var rand_spd = random_range(-4, 4)
				
		// Create random deviation in x origin point on platform
		var rand_x = random_range(-10, 10)
				
		// Create oil droplet, throwing it in random direction
		droplet = instance_create_layer(other.x + rand_x, other.y - other.sprite_height - 5, "Spells", obj_element_oil_droplet,
		{
			fuel_left : fuel_split,
			is_flaming : true,
			move_spd_v : 6,
			move_spd_h : rand_spd
					
		})
				
		// Create steam object for each water level in location droplet is spawned
		steam = instance_create_layer(other.x + rand_x, other.y - other.sprite_height - 5, "Spells", obj_element_steam_air)
	}
}	

// Debug
//show_debug_message("other.water_level: " + string(other.water_level))


// Destroy self upon contact
instance_destroy()