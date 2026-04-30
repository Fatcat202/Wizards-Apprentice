

// Inherit the parent event
event_inherited();

#region Determening Enemy for Stats

	// Read name of object and assigns it to object_name
	object_name = object_get_name(object_index);
	// Isolates the character name from object_name
	enemy_name = string_delete(object_name, 0, 4);
	// Initialise this_enemy to track instance data
	index = 0;

	// Determine starting character
	for(var i = 1; i <= global.enemy_index_length; i++)
	{
		if (enemy_name == string(global.arr_enemy_index_name[i]))
		{
			index = i;
		}
	}

#endregion Determening Enemy for Stats


#region Loading instance stats

	// Max Health
	max_health = global.enemy_stats[index].hp
		// Current Health
		active_health = max_health;
		
	// Movement speed
	move_spd = global.enemy_stats[index].move_spd;
	
	// Stores x and y origin points
	home_x = y;
	home_y = x;
	
	// Movement speed when jumping
	jump_speed = 5.5;

	//Terminal Velocity
	term_vel = -(jump_speed + 2)
	
	// Current horizontal move speed, used for acceleraton/deceleration
	move_spd_h = 0;
	// Current vertical move speed, used for acceleraton/deceleration
	move_spd_v = 0;
	
	// Horizontal movement acceleration rate. 0 is instant, 1 is nothing
		// Default modifier
		h_acel_default = 0.5
		// Modifier to be used
		h_acel = h_acel_default
	// Horizontal movement deceleration rate. 0 is instant, 1 is nothing
		// Default modifier
		h_decel_default = 0.4
		// Modifier to be used
		h_decel = h_decel_default
	
	// Used for modifying movement speed when the enemy is on a specific platform element
	
		// Sets default
		plat_spd_default = 1
	
		// Used to modify speeds
		plat_spd_mod = plat_spd_default
	
		// Modifies move speed when on oil
		plat_spd_oil = 0.4
		
		// Modifies acceleration on ice
		plat_spd_acel_ice = 0.6
		// Modifies deceleration on ice
		plat_spd_decel_ice = 2.3
	
	
	
	// Variable to determine if enemy is walking
	is_walking = false;
	
	// Sets initial default for state_move to idle
	state_move_free = noone
	
	// Collision speed, used for collision logic
	collision_speed = global.collision_distance
	
	// Used to determine if the enemy is solid for the purposes of semi solid objects
	semi_solid = false
	
	// Normal max jumps
	base_max_jumps = 0;
	// Adjusted jumps
	max_jumps = 1;
	// Jumps remaining
	jumps_left = max_jumps


#endregion

#region Enemy AI States


	state_free = function()
	{
		
		state = state_free
		
	}
	
	state_patrol = function()
	{
		
		scr_enemy_patrol();

	}
	
	state_attack = function()
	{
		
		

	}
	
	state_retreat = function()
	{
		
		

	}

	state_behavior = state_free;

#endregion Enemy AI States






