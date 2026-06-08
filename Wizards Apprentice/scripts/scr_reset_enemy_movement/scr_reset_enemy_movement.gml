// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_reset_enemy_movement()
{
	// End path
	if(path_index != -1)
	{
		path_end()
	}
		
	move_spd_h = 0;
	move_spd_v = 0;
}