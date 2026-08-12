/// @description Display


draw_self()

if(inventory[0] != -1)
{
	draw_sprite(inventory[0].spr, 0, x, y)
}else

if(spell_learned != -1)
{
	// Apply offset to sprite image
	x_offset = sprite_width - sprite_get_width(spell_learned.spr)
	y_offset = sprite_height - sprite_get_height(spell_learned.spr)
	
	// Draw sprite of spell. Increase size by 2x
	draw_sprite_ext(spell_learned.spr, 2, x - x_offset, y - y_offset, 2, 2, 0, c_white, 1)
}

