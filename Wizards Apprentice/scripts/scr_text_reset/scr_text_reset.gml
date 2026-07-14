// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_text_reset()
{
	// Quick reset script for text modifiers
	
	draw_set_font(fnt_default)
	draw_set_alpha(1)
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
	draw_set_colour(c_white)
}