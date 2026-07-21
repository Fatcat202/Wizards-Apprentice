/// @description Insert description here
// You can write your code in this editor


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

// Set text draw settings
scr_draw_set_text(fa_center, fa_middle, fnt_menu, c_black)

// Draw level select text
draw_text(level_select_x, level_select_y, "Level Select")






// Reset all text settings
scr_text_reset()