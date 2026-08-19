// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_circ_healthbar(xx, yy, value, _max, color, radius, alpha)
{
	// If not set to 1
	if(value > 0)
	{
		var i, len, tx ,ty, val;
		var num_of_sections = 60;
		var size_of_section = 360 / num_of_sections;
		
		val = (value / _max) * num_of_sections;
		
		if(val > 1) 
		{
			// Set color and alpha
			draw_set_color(color);
			draw_set_alpha(alpha);
			
			draw_primitive_begin(pr_trianglefan);
			// Location
			draw_vertex(xx, yy);
			
			// Create a solid circle
			for(i = 0; i < val; i++)
			{
				len = (i * size_of_section) + 90;
				tx = lengthdir_x(radius, len);
				ty = lengthdir_y(radius, len);
				draw_vertex(xx + tx, yy + ty);
			}
			// Stop drawing
			draw_primitive_end();
		}
		// Reset draw settings
		draw_set_alpha(1);
		draw_set_color(c_white);
	}
}