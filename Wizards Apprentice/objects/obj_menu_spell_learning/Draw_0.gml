/// @description Display



// Draw inventory image
draw_sprite_stretched
(
	spr_inventory,
	0,
	inv_x,
	inv_y,
	inv_width,
	inv_height
);


//	Title
scr_draw_set_text(fa_center, fa_middle, fnt_menu, c_white)
	draw_text(title_x, title_y, title_text)
scr_text_reset()


// Spell Title
scr_draw_set_text(fa_center, fa_middle, fnt_menu_small, c_white)
	draw_text(spell_title_x, spell_title_y, spell_title_text)
scr_text_reset()
// Spell Description
scr_draw_set_text(fa_center, fa_middle, fnt_menu_small, c_white)
	draw_text(spell_desc_x, spell_desc_y, spell_desc_text)
scr_text_reset()