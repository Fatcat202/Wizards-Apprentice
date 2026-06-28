/// @description Insert description here
// You can write your code in this editor


#region Spell Slots
	// Draw inventory image
	draw_sprite_stretched
	(
		spr_inventory,
		0,
		mem_spell_x - spacer,
		mem_spell_y - spacer,
		mem_spell_width,
		mem_spell_height
	);
			
			
	// Draw inventory slots
	for(var i = 1; i < array_length(global.active_spells); i++)
	{
		var xx = mem_spell_x + (i-1) * 48;
		var yy = mem_spell_y;
		var hover = (obj_mouse.inventory_hover == id) && (obj_mouse.slot_hover == i)
		draw_sprite(spr_inventory_slot_small, hover, xx, yy)
		if(global.active_spells[i] != -1 && i != 0)
		{
			var alpha = 1;
			if(obj_mouse.inventory_drag == id && obj_mouse.slot_drag == i) alpha = 0.5;
			draw_set_alpha(alpha)
					draw_sprite(global.active_spells[i].spr, 2, xx, yy);
			draw_set_alpha(1)
		}
	}
			
			
		
#endregion Spell Slots