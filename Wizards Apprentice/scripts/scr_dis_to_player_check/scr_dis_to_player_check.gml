// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dis_to_player_check()
{
	// Stop movement toward player when within a set range, and when in line of sight
						
	if(min_range == -1) min_range = sprite_get_width(spr_player)
						
	// Enemy stops movement if within the width of the player sprite to the player
	if(point_distance(x, y, obj_player_parent.x, obj_player_parent.y) < min_range
	&& !place_meeting(x, y + 2, obj_player_parent)
	&& player_visible == true)
	{
		move_spd_h = 0
	}
}