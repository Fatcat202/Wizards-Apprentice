// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_flipping_sprite()
{
	// Flip sprite when moving	
	if(move_dir = 1)
	{
		image_xscale = 1
	}else 
		
	if(move_dir = -1)
	{
		image_xscale = -1
	}
}