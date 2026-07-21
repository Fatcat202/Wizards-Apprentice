// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_draw_set_text(halign, valign, font, colour)
{
	// Pass through variables to set draw settings for text
	
	draw_set_halign(halign)
	draw_set_valign(valign)
	draw_set_font(font)
	draw_set_colour(colour)
}