/// @description

// Draw Pause Image
draw_sprite(global.pause_image, 0, global.cam_x, global.cam_y)

// Draw inventory image
draw_sprite_stretched
(
	spr_inventory,
	0,
	x_pos - spacer,
	y_pos - spacer,
	width,
	height
);

// Draw level select text
scr_draw_set_text(fa_center, fa_middle, fnt_menu, c_black)
	draw_text(level_select_x, level_select_y, "Portal Gate")
scr_text_reset()