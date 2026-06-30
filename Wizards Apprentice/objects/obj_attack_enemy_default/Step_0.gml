/// @description Enact Stats

event_inherited()

#region Alarm 0 Timer

	// If duration is not -1, use duration variable for time before destruction. Else use animation frames
	if(duration != -1)
	{
		if(!alarm_get(0)) alarm_set(0, game_get_speed(gamespeed_fps)*duration)
	}else
	{
		// Set alarm for destruction based on number of sprite animation frames
		if(!alarm_get(0)) alarm_set(0, sprite_get_number(sprite_index))
	}
	
#endregion Alarm 0 Timer

#region Projectile Determination

	if(move_spd != -1)
	{
		// Allow attack to move at set speed, becoming a projectile
	
		speed = move_spd;
		
		
		if(place_meeting(x, y, obj_platform_solid_parent) || place_meeting(x, y, obj_player_parent) || place_meeting(x, y, obj_platform_void))
		{
			instance_destroy()
		}
		
	}else
	{
		// Keep attack in place relative to enemy that created it
	
		x = enemy_object.x;
		y = enemy_object.y;
	}
	
#endregion Projectile Determination
