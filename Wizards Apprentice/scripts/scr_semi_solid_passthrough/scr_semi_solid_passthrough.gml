// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_semi_solid_passthrough()
{
	// If target is below enemy, activate semi solid to pass through platforms
	if(target_y - global.cell_size > y || is_jumping == true)
	{
		semi_solid = true;
	}else
	{
		semi_solid = false;
	}
				
//	show_debug_message("semi_solid: " + string(semi_solid))
}