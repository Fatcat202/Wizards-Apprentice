/// @description 

inventory = global.active_spells

// Gap between slots and edge of spellbook
spacer = 12;
	
// Total number of spell slots
if(global.memory < 10)
{
//	spell_slots = global.memory
	spell_slots = 10
}else spell_slots = 10
	
inv_width = 24 + (spell_slots) * 48;
inv_height = 48 + (spacer * 2)
	
mem_spell_x = global.cam_target_x + (global.res_w / 2) - (inv_width / 2) + (spacer * 2);
mem_spell_y = global.cam_target_y + (global.res_h / 2) + (inv_height / 2) + (spacer * 2) + 20;
