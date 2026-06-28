/// @description Spellbook

// Draw inventory image
draw_sprite_stretched
(
	spr_inventory,
	0,
	x_pos - spacer,
	y_pos - spacer,
	spellbook_width,
	spellbook_height
);

// Inventory text
draw_set_font(fnt_menu)
	draw_set_halign(fa_left)
		draw_set_valign(fa_top)
			draw_text(x_pos + 5, y_pos, "SPELLBOOK")
scr_text_reset()

// Memory counter
draw_set_font(fnt_menu_small)
	draw_set_halign(fa_right)
		draw_set_valign(fa_top)
			draw_text(x_pos + spellbook_width - 25, y_pos + 10, "MEMORY: " + string(global.memory_used) + " / " + string(global.memory))
scr_text_reset()
			
			
			
// Pages
for(var i = 0; i < pages; i++)
{
	if(!instance_exists(global.arr_page_buttons[i]))
	{
		var y_buffer = (i+0.5) * 48
		instance_create_layer(spellbook_x, spellbook_y + y_buffer, "Menu_Buttons", global.arr_page_buttons[i],
		{
			menu_id : id
		})
	}
}
			
			

// Draw inventory slots
for(var i = 0; i < global.spells_per_page; i++)
{
	var xx = x_pos + (i mod global.spellbook_row_length) * 48;
	var yy = y_pos + (i div global.spellbook_row_length) * 48 + 40;
	var hover = (obj_mouse.inventory_hover == id) && (obj_mouse.slot_hover == i)
	draw_sprite(spr_inventory_slot_small, hover, xx, yy)
	if(global.spellbook[active_page, i] != -1)
	{
		var alpha = 1;
		if(obj_mouse.inventory_drag == id && obj_mouse.slot_drag == i) alpha = 0.5;
		draw_set_alpha(alpha)
			draw_sprite(global.spellbook[active_page, i].spr, 2, xx, yy);
		draw_set_alpha(1)
	}
}
		
