/// @description Text

var price = scr_get_buy_price(item)

draw_self()
// Set Font
draw_set_font(fnt_menu)

// Set Location
draw_set_halign(fa_center);
draw_set_valign(fa_middle);



//Draw Text
if(inventory[item] != -1)
{
	var text = "BUY  " + string(price)
	draw_text(x, y, text);
}

// Reset Location
draw_set_halign(fa_left);
draw_set_valign(fa_top);

// Reset Font
draw_set_font(fnt_default);