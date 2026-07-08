/// @description Draw Button

draw_sprite_stretched
(
	spr_inventory,
	0,
	x - width/2,
	y - height/2,
	width,
	height
);

// Set Font
draw_set_font(fnt_help_screen)

// Set Location for text
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draw Text
draw_text(x, y, help_text);


scr_text_reset()