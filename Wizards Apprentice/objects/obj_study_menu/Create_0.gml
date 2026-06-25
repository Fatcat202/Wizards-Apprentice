/// @description Insert description here
// You can write your code in this editor


#region Spellbook

	// Gap between slots and edge of spellbook
	spacer = 12;

	// Width and height of inventory
	spellbook_width = 24 + (global.spellbook_row_length + 1.5) * 48;
	spellbook_height = 64 + (((global.spells_per_page - 1) div global.spellbook_row_length) + 1) * 48;

	x_pos = global.cam_target_x + (global.res_w / 2) - (spellbook_width / 2) + (spacer * 2);
	y_pos = global.cam_target_y + (global.res_h / 2) - (spellbook_height / 2) + (spacer * 2) - 60;
	
	// Pages position
	
	spellbook_x = x_pos + (global.spellbook_row_length + 0.75) * 48;
	spellbook_y = y_pos + 46;

	// Spellbook Page being shown
	active_page = 1
	
	// memoery being used by memorised spells
	memory_used = 0
	
	// Total number of pages
	pages = global.spellbook_total_pages


#endregion Spellbook

#region Memorised Spells

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




page_spellbook = function()
{
	
}


page_stats = function()
{
	
}

// Start on stats page
page_state = page_spellbook;