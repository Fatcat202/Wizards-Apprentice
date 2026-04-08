// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_spell_icicle(target_x = mouse_x, target_y = mouse_y)
{
	// Find index in array using name of spell
	var spell_index = scr_find_spell_index("icicle")
	
	// Pull relevant details for easier to use variables
	var _damage = global.spell_stats[spell_index].damage
	var _cooldown = global.spell_stats[spell_index].cooldown
	var _mana = global.spell_stats[spell_index].mana
	var _duration = global.spell_stats[spell_index].duration

	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit
	

	icicle = instance_create_layer(x, y, "Projectiles", obj_spell_icicle,
	{
		speed : 6,
		direction : point_direction(x, y, target_x, target_y),
		image_angle : point_direction(x, y, target_x, target_y),
		damage : _damage,
		duration : _duration
	});
	
	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(_cooldown)
}