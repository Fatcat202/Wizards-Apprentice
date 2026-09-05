/// @description Display


// Draw Pause Image
draw_sprite(global.pause_image, 0, global.cam_x, global.cam_y)


// Draw background image
draw_sprite_stretched
(
	spr_message,
	0,
	x_pos,
	y_pos,
	width,
	height
);

// Draw body text
scr_draw_set_text(fa_top, fa_left, fnt_menu_small, c_white)
	draw_text_ext(body_x, body_y, text_display, body_line_sep, body_line_width)
scr_text_reset()