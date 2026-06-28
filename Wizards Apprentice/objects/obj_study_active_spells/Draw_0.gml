/// @description Spell Slots

// Draw inventory image
draw_sprite_stretched
(
	spr_inventory,
	0,
	mem_spell_x - spacer,
	mem_spell_y - spacer,
	inv_width,
	inv_height
);
			
			
// Draw inventory slots
for(var i = 1; i < spell_slots+1; i++)
{
	var xx = mem_spell_x + (i-1) * 48;
	var yy = mem_spell_y;
	var hover = (obj_mouse.inventory_hover == id) && (obj_mouse.slot_hover == i)
	draw_sprite(spr_inventory_slot_small, hover, xx, yy)
	if(global.active_spells[0, i] != -1 && i != 0)
	{
		var alpha = 1;
		if(obj_mouse.inventory_drag == id && obj_mouse.slot_drag == i) alpha = 0.5;
		draw_set_alpha(alpha)
				draw_sprite(global.active_spells[0, i].spr, 2, xx, yy);
		draw_set_alpha(1)
	}
}
