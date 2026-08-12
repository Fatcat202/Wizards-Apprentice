// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_learn_spell_scroll()
{
	
	// Level of scroll being used to learn spell
	var scroll_level = obj_spell_learn_slot.inventory[0].main_var
//	show_debug_message("scroll_level: " + string(scroll_level))
	
	// Holds indexes of spells
	arr_spells = []
	
	// Used to determine if a valid spell to learn has been found
	spell_found = false
	
	// Used to check through spell database for spells of a particular level which the player does not know
	function func_gather_spells(_scroll_level)
	{
		arr_spells = []
	
		// Used to determine if spell being checked has already been learned
		var novel_spell = true
	
		// Loop through all spells in database
		for(var i = 1; i <= global.spell_index_length; i++)
		{
			// Search for spells of correct spell level
			if(global.spell_stats[i].level == _scroll_level)
			{
				// Reset novel_spell
				novel_spell = true
			
				// Check through spellbook for matching spell
				for(var page = 0; page < global.spellbook_total_pages; page++)
				{
					for(var slot = 0; slot < global.spellbook_row_length*global.spellbook_row_number; slot++)
					{	
						if(global.spell_stats[i] == global.spellbook[page, slot])
						{
							// Declare spell has been learned before and exit
							novel_spell = false
							break;
						}
					}
				}
			
				// If spell is of the correct level and has not been learned before, add to potential spells
				if(novel_spell == true)
				{
					spell_found = true;
					array_push(arr_spells, i)
				}
			}
		}
		
	}
	
	// Increment backwards through spell levels, starting at scroll_level, to find valid random spells to learn
	for(var i = scroll_level; i != 0; i--)
	{
		
		func_gather_spells(i)
//		show_debug_message("arr_spells: " + string(arr_spells))
		
		if(spell_found) break;
	}
	
	
	// Check if any spell can be learned
	if(array_length(arr_spells) != 0)
	{
		// Generate random number within length of array
		var rand = irandom(array_length(arr_spells) - 1)
//		show_debug_message("rand: " + string(rand))
	
		// Gather index of spell to learn
		var index_to_learn = arr_spells[rand];
		
		// Use index to gather spell data
		var spell = string(global.arr_spell_index_name[index_to_learn])
		
		// Add spell to spellbook
		scr_learn_spell(spell)
		
		
		// Send data for spell learned to other objects to display info to player
		obj_spell_learn_slot.spell_learned = global.spell_stats[index_to_learn];
		obj_menu_spell_learning.spell_learned = global.spell_stats[index_to_learn];
	
//		show_debug_message("spell: " + string(spell))
	}else
	{
		// TODO: Give the player a bonus for learning all spells within a set of levels
		// Perhaps XP or gold gain based on level of scroll
		
	}
	
	
	
	// Delete scroll once used
	obj_spell_learn_slot.inventory[0] = -1
	
}