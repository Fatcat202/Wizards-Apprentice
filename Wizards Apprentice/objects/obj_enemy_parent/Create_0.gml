

// Inherit the parent event
event_inherited();


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

#endregion

#region Enemy AI States


	state_free = function()
	{
		
		state = state_free
		
	}
	
	state_patrol = function()
	{
		
		

	}
	
	state_attack = function()
	{
		
		

	}
	
	state_retreat = function()
	{
		
		

	}

	state_behavior = state_free;

#endregion Enemy AI States






