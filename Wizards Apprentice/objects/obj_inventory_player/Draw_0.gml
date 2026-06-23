/// @description Display Inventory


if(global.show_inventory == true)
{

	// Draw inventory image
	draw_sprite_stretched
	(
		spr_inventory,
		0,
		x_pos - spacer,
		y_pos - spacer,
		inv_width,
		inv_height
	);

	// Inventory text
	draw_set_font(fnt_menu)
		draw_set_halign(fa_left)
			draw_set_valign(fa_top)
				draw_text(x_pos + 5, y_pos, "INVENTORY")
			draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
	draw_set_font(fnt_default)

	// Gold counter
	draw_set_font(fnt_menu)
		draw_set_halign(fa_right)
			draw_set_valign(fa_top)
				draw_text(x_pos + inv_width - 25, y_pos, "GOLD: " + string(global.player_gold))
			draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
	draw_set_font(fnt_default)

	// Draw inventory slots
	for(var i = 0; i < inventory_slots; i++)
	{
		var xx = x_pos + (i mod inventory_row_length) * 64;
		var yy = y_pos + (i div inventory_row_length) * 64 + 40;
		var hover = (obj_mouse.inventory_hover == id) && (obj_mouse.slot_hover == i)
		draw_sprite(spr_inventory_slot, hover, xx, yy)
		if(inventory[i] != -1)
		{
			var alpha = 1;
			if(obj_mouse.inventory_drag == id && obj_mouse.slot_drag == i) alpha = 0.5;
			draw_set_alpha(alpha)
				draw_sprite(inventory[i].spr, 0, xx, yy);
			draw_set_alpha(1)
		}
	}	

}