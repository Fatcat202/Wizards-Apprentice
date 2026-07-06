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
	
	// Gold positioning
	var gold_x_pos = x_pos + ((0) mod inventory_row_length) * 64;
	var gold_y_pos = y_pos + ((inventory_slots div inventory_row_length)+0.5) * 64 + 40;
	
	// Take gold button 
	var take_gold_x_pos = x_pos + ((inventory_row_length - 1) mod inventory_row_length) * 64 + 15;
	var take_gold_y_pos = y_pos + ((inventory_slots div inventory_row_length)+0.5) * 64 + 40;
	
	// Gold Text
	draw_set_font(fnt_menu)
		draw_set_halign(fa_left)
			draw_set_valign(fa_center)
				draw_text(gold_x_pos, gold_y_pos, "GOLD:")
				draw_text(gold_x_pos + 75, gold_y_pos, string(chest_gold))
			draw_set_valign(fa_top)
		draw_set_halign(fa_left)
	draw_set_font(fnt_default)
	
	
	// Take Gold Button
	if(!instance_exists(take_gold) && chest_gold > 0)
	{
		take_gold = instance_create_layer(take_gold_x_pos, take_gold_y_pos, "Menu_Buttons", obj_button_take_gold)
		take_gold.chest_gold = chest_gold;
		take_gold.chest_id = chest_id;
		take_gold.inventory_id = id;
	}
}