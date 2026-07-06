/// @description

// Prevent player interaction
if(instance_exists(obj_player_parent))
{
	global.can_control_player = false;
	obj_player_parent.can_damage = false;
	obj_player_parent.can_be_stunned = false;
	obj_player_parent.can_attack = true;
}

// Check if delaying timer is active
if(delaying == false)
{
	// Entering Room
	if(state == 0)
	{
		if(timer >= duration)
		{
			state = 1
			delaying = true
			room_goto(next_room)
		
		}else timer++;
	}else

	// Leaving Room
	if(state == 1)
	{
		if(timer <= 0)
		{
			instance_destroy()
		
		}else timer--;
	}
	
	// Set alpha
	alpha = timer / duration;
	
}else delaying_timer++

// Check if delaying timer is over
if(delaying_timer >= delaying_time) delaying = false

