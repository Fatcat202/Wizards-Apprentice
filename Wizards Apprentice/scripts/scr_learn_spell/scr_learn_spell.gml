// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_learn_spell(spell)
{

	// Add spell to first available slot in spellbook
	// Must pass through name of spell as a string
	
	// Find index of spell
	var index = scr_find_spell_index(string(spell))
	
	// Find data of spell to be added
	var spell_data = global.spell_stats[index]


	var slots_per_page = global.spellbook_row_length * global.spellbook_row_number;

	// Hold position of first empty slot
	var empty_slot_page = -1
	var empty_slot = -1
	
	// Hold if spell is already in spellbook
	var spell_already_added = false;
	
	// Loop through pages
	for(var page = 1; page < global.spellbook_total_pages; page++)
	{	// Loop through slots
		for(var slot = 0; slot < slots_per_page; slot++)
		{
			// Check if spell has already been added to spell list
			if(global.spellbook[page, slot] == spell_data)
			{
//				show_debug_message("Spell Already Added")
				spell_already_added = true;
				break;
			}
			
			// Save slot and page of first empty slot
			if(global.spellbook[page, slot] == -1)
			{	// Check empty slot not already found
				if(empty_slot_page == -1 && empty_slot == -1)
				{
					empty_slot_page = page;
					empty_slot = slot;

//					show_debug_message("Empty Slot Saved")
//					show_debug_message("empty_slot_page: " + string(empty_slot_page))
//					show_debug_message("empty_slot: " + string(empty_slot))
				}
			}
		}
	}
	
	// Add spell to spellbook if empty slot is found and spell does not already exist
	if(empty_slot_page != -1 && empty_slot != -1 && spell_already_added == false)
	{
		global.spellbook[empty_slot_page, empty_slot] = spell_data
		
//		show_debug_message("Spell Added")
	}
	
}
