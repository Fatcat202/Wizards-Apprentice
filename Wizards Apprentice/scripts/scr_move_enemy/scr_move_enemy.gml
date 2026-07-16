// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_move_enemy()
{
	if(can_move == true)
	{
		// Move object horizontally
		x += move_spd_h
		// Move object vertically
		y -= move_spd_v
	}
}