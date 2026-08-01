/// @description Pause Image


// Draw Pause Image
draw_sprite(global.pause_image, 0, global.cam_x, global.cam_y)


// Draw inventory image
draw_sprite_stretched
(
	spr_inventory,
	0,
	x_pos,
	y_pos,
	width,
	height
);


// If unlocked, show text
if(arr_dialogue[position].unlocked == true)
{
	
	scr_draw_set_text(fa_middle, fa_center, fnt_default, c_white)
	
	// Display Text
	draw_text(text_x, text_y, arr_dialogue[position].text)
	
	scr_text_reset()


}