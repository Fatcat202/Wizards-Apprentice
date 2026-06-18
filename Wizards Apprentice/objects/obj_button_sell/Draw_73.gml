/// @description Insert description here
// You can write your code in this editor


// Set Font
draw_set_font(fnt_menu)

// Set Location
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Draw Text
if(global.inventory[item] != -1)
{
	var text = "SELL  " + string(floor(global.inventory[item].price / 2))
	draw_text(x, y, text);
}

// Reset Location
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Reset Font
draw_set_font(fnt_default);