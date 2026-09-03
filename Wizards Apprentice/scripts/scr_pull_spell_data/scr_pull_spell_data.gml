
function scr_pull_spell_data(spell_name)
{
	
	// Find index in array using name of spell
	spell_index = scr_find_spell_index(string(spell_name))
	
	// Pull relevant details for easier to use variables
	level = global.spell_stats[spell_index].level
	water_level = global.spell_stats[spell_index].water_level
	oil_level = global.spell_stats[spell_index].oil_level
	is_ice = global.spell_stats[spell_index].is_ice
	is_flaming = global.spell_stats[spell_index].is_flaming
	is_steaming = global.spell_stats[spell_index].is_steaming
	is_charged = global.spell_stats[spell_index].is_charged
	damage = global.spell_stats[spell_index].damage
	move_spd = global.spell_stats[spell_index].move_spd
	cooldown = global.spell_stats[spell_index].cooldown
	mana = global.spell_stats[spell_index].mana
	memory = global.spell_stats[spell_index].memory
	uses = global.spell_stats[spell_index].uses
	duration = global.spell_stats[spell_index].duration
	title = global.spell_stats[spell_index].title
	desc = global.spell_stats[spell_index].desc
	spr = global.spell_stats[spell_index].spr
	scr = global.spell_stats[spell_index].scr
	attack_spr = global.spell_stats[spell_index].attack_spr
	
}