/// @description

// Default Positions
default_xpos = 499
default_ypos = 191

default_width = 250
default_height = 300

xpos = default_xpos;
ypos = default_ypos;

x = xpos
y = ypos

// State used for detemining what menu options to show in step
state = "none"


// Menu positions for placing buttons
width = default_width
height = default_height

middle = xpos;

x_left = xpos - (width / 2);
x_right = xpos + (width / 2);
y_top = ypos - (height / 2);
y_bottom = ypos + (height / 2);

save_slot_gap = 50
save_slot_x = middle - 70
save_slot_y_title = y_top + 25
save_slot_y = y_top + 10
slot_text_gap = 80


// Position of credits title
credits_title_x = x;
credits_title_y = y - 100;
// Position of credits text
credits_text_x = x;
credits_text_y = y;
credits_text = "Made By: Ethan Bayley"



#region New Game





		temp_vit = global.vitality;
		temp_dex = global.dexterity;
		temp_int = global.intelligence;
		temp_mem = global.memory;
		temp_cha = global.charisma;


		global.starting_levels = 15
		temp_free_level = global.starting_levels;

		// Buttons
		add_vit = noone;
		sub_vit = noone;
		add_dex = noone;
		sub_dex = noone;
		add_int = noone;
		sub_int = noone;
		add_mem = noone;
		sub_mem = noone;
		add_cha = noone;
		sub_cha = noone;
	
	#endregion Stats
	
	#region Spell Selection
	
		// Array holding possible spells
		arr_starter_spells = []
		
		var pos = 0;
		arr_starter_spells[pos] = global.spell_stats[scr_find_spell_index("firebolt")]; pos++;
		arr_starter_spells[pos] = global.spell_stats[scr_find_spell_index("icicle")]; pos++;
		arr_starter_spells[pos] = global.spell_stats[scr_find_spell_index("jolt")]; pos++;
		arr_starter_spells[pos] = global.spell_stats[scr_find_spell_index("water splash")]; pos++;
		arr_starter_spells[pos] = global.spell_stats[scr_find_spell_index("oil splash")]; pos++;
		
		// Spell selected by player to be first spell
		starting_spell = -1
		
	
	#endregion Spell Selection


#endregion New Game

