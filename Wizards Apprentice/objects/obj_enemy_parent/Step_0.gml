/// @description


// Run enemy AI states
state_behavior()

// Increment enemy timers
scr_enemy_timers()

#region Collisions
	
	// Force objects outside of other objects if stuck or overlaping
	if(place_meeting(x, y, obj_collision_parent) && scr_is_solid(x,y) && !scr_check_semi_solid(x, y))
	{
		for(var i = 0; i < 1000; i++)
		{
			// Right
			if(!place_meeting(x + i, y, obj_collision_parent) || !scr_is_solid(x + i , y))
			{
				x += i;
				break;	
			}

			// Left
			if(!place_meeting(x - i, y, obj_collision_parent) || !scr_is_solid(x - i , y))
			{
				x -= i;
				break;	
			}
		
			// Up
			if(!place_meeting(x, y + i, obj_collision_parent) || !scr_is_solid(x , y + i))
			{
				y += i;
				break;	
			}
		
			// Down
			if(!place_meeting(x, y - i, obj_collision_parent) || !scr_is_solid(x , y - i))
			{
				y -= i;
				break;	
			}
		
			// Top Right
			if(!place_meeting(x + i, y + i, obj_collision_parent) || !scr_is_solid(x + i , y + i))
			{
				x += i;
				y += i;
				break;	
			}
			
			// Top Left
			if(!place_meeting(x - i, y + i, obj_collision_parent) || !scr_is_solid(x - i , y + i))
			{
				x -= i;
				y += i;
				break;	
			}
			
			// Bottom Right
			if(!place_meeting(x + i, y - i, obj_collision_parent) || !scr_is_solid(x + i ,y - i))
			{
				x += i;
				y -= i;
				break;	
			}
			
			// Bottom Left
			if(!place_meeting(x - i, y - i, obj_collision_parent) || !scr_is_solid(x - i , y - i))
			{
				x -= i;
				y -= i;
				break;	
			}
		}
	}
		
#endregion Collisions



