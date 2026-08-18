/// @description Display

// Draw pause sprite
draw_sprite(global.pause_image, 0, global.cam_target_x, global.cam_target_y)

// Darken background
draw_sprite_ext(spr_pixel, 0, global.cam_target_x, global.cam_target_y, global.cam_w, global.cam_h, 0, c_black, 0.5)

// Set fade in alpha
draw_set_alpha(alpha)

	// Draw Menu Image
	draw_sprite_stretched
	(
		spr_inventory,
		0,
		pos_x,
		pos_y,
		width,
		height
	);

	// Death Text
	scr_draw_set_text(fa_center, fa_middle, fnt_menu, c_black)
		draw_text(text_death_x, text_death_y, text_death)
	scr_text_reset()
	
	draw_sprite_ext(spr_death_menu_image, 0, x_pos_death_image, y_pos_death_image, 1, 1, 0, c_white, alpha)

// Reset alpha
draw_set_alpha(1)
// Increment alpha
if(alpha < 1)
{
	alpha += alpha_increment;
}
