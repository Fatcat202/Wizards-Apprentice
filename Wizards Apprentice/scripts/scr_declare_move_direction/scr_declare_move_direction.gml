// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_declare_move_direction()
{
	// Declare movement direction
	if(move_spd_h > 0)
	{
		move_dir = 1
	}else
	if(move_spd_h < 0)
	{
		move_dir = -1
	}
}