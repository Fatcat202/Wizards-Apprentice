// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_damage(dmg)
{
	if(other.can_damage == true)
	{
		other.can_damage = false;
		other.active_health = other.active_health - dmg;
		// Tint sprite red for 15 frames when damaged
		other.image_blend = c_red;
		other.alarm[11] = global.i_frames;
	}
}