/// @description Display Inventory


if(global.show_inventory == true)
{
	
	// Draw Pause Image
//	draw_sprite(global.pause_image, 0, global.cam_x, global.cam_y)

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
	
	// Title
	scr_draw_set_text(fa_middle, fa_center, fnt_menu, c_white)
		draw_text(title_x, title_y, title_text)
	scr_text_reset()

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