// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_sprite_direction(dir = direction){
	
	if(dcos(direction) < 0)
	{
		image_xscale = -1;	
	}else image_xscale = 1;
}