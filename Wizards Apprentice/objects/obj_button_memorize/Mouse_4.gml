/// @description On Click

// Total of memory used and memory of spell being memorized
var memory_to_use = global.memory_used + spell.memory;
						
// Check if the selected spell has already been memorized
var duplicate = false;
for(var i = 1; i < global.max_spell_slots+1; i++)
{
	if(spell == global.active_spells[0, i])
	{
		duplicate = true;
	}
}
						
// Search for first available position
if(memory_to_use <= global.memory && duplicate == false)
{					
	for(var i = 1; i < inventory_hover.spell_slots+1; i++)
	{
		if(global.active_spells[0, i] == -1)
		{
			// Transfer to active spells
			global.active_spells[0, i] = spell
			break;
		}
	}
}									


// Destroy self and menu
instance_destroy(obj_item_control_menu)
instance_destroy()