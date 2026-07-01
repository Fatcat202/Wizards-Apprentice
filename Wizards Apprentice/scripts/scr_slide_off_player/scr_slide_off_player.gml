// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_slide_off_player()
{
	// Cause enemy to fall off player head if landing on player
	if(place_meeting(x, y + 2, obj_player_parent))
	{
		if(rand_shift_dir == -1) rand_shift_dir = irandom(1)
			
		// Shift left
		if(rand_shift_dir == 0)
		{
			move_spd_h -= 2
		}else
			
		// Shift right
		if(rand_shift_dir == 1)
		{
			move_spd_h += 2
		}
	}else rand_shift_dir = -1
}