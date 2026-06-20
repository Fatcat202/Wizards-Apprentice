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
		draw_set_halign(fa_center)
			draw_set_valign(fa_top)
				draw_text(x_pos + (inv_width / 2), y_pos, "CHEST")
			draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
	draw_set_font(fnt_default)

	// Draw inventory slots
	for(var i = 0; i < inventory_slots; i++)
	{
		var xx = x_pos + (i mod inventory_row_length) * 64;
		var yy = y_pos + (i div inventory_row_length) * 64 + 40;
		var hover = (inventory_hover == id) && (slot_hover == i)
		draw_sprite(spr_inventory_slot, hover, xx, yy)
		if(arr_inventory_chest[i] != -1)
		{
			var alpha = 1;
			if(inventory_drag == id && slot_drag == i) alpha = 0.5;
			draw_set_alpha(alpha)
				draw_sprite(arr_inventory_chest[i].spr, 0, xx, yy);
			draw_set_alpha(1)
		}
	}
	
	xx = x_pos + ((0) mod inventory_row_length) * 64;
	yy = y_pos + ((inventory_slots+1) div inventory_row_length) * 64 + 40;
	
	
	draw_set_font(fnt_menu)
		draw_set_halign(fa_left)
			draw_set_valign(fa_top)
				draw_text(xx, yy, "GOLD: " + string(chest_gold))
			draw_set_valign(fa_middle)
		draw_set_halign(fa_center)
	draw_set_font(fnt_default)

	// Item Alpha when dragged
	if(slot_drag != -1)
	{
		if(arr_inventory_chest[slot_drag] != -1)
		{
			draw_set_alpha(0.5)
				draw_sprite(arr_inventory_chest[slot_drag].spr, 0, mouse_x, mouse_y)
			draw_set_alpha(1)
		}
	}
	
	

}