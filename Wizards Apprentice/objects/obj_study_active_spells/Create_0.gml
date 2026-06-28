/// @description Insert description here
// You can write your code in this editor
#region Memorised Spells


	// Gap between slots and edge of spellbook
	spacer = 12;
	
	// Total number of spell slots
	if(global.memory < 10)
	{
//		spell_slots = global.memory
		spell_slots = 10
	}else spell_slots = 10
	
	mem_spell_width = 24 + (spell_slots) * 48;
	mem_spell_height = 48 + (spacer * 2)
	
	mem_spell_x = global.cam_target_x + (global.res_w / 2) - (mem_spell_width / 2) + (spacer * 2);
	mem_spell_y = global.cam_target_y + (global.res_h / 2) + (mem_spell_height / 2) + (spacer * 2) + 20;
	
#endregion Memorised Spells