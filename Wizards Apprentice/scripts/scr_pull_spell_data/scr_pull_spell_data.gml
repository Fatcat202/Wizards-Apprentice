
function scr_pull_spell_data(spell_name)
{
	
	// Find index in array using name of spell
	spell_index = scr_find_spell_index(string(spell_name))
	
	// Pull relevant details for easier to use variables
	_level = global.spell_stats[spell_index].level
	_damage = global.spell_stats[spell_index].damage
	_atk_speed = global.spell_stats[spell_index].atk_speed
	_cooldown = global.spell_stats[spell_index].cooldown
	_mana = global.spell_stats[spell_index].mana
	_memory = global.spell_stats[spell_index].memory
	_uses = global.spell_stats[spell_index].uses
	_duration = global.spell_stats[spell_index].duration
	_element = global.spell_stats[spell_index].element
	_title = global.spell_stats[spell_index].title
	_desc = global.spell_stats[spell_index].desc
	_spr = global.spell_stats[spell_index].spr
	_scr = global.spell_stats[spell_index].scr
	
}