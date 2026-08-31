// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_caster_teleport_home()
{
	
	// When triggered, casters send back to home coordnates all enemies
	// Reset enemies to idle behavior
	// Ignore enemies that can still see the player
	
	with(obj_enemy_parent)
	{
		// If the player is not visible, send home
		if(player_visible == false)
		{
			x = home_x
			y = home_y
			returned_home = true;
			state_behavior = state_idle;
		}
	}
}