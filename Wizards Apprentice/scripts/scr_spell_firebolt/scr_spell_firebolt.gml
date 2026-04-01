
// Cantrip firing bolt of fire doing damage

function scr_spell_firebolt(target_x = mouse_x, target_y = mouse_y)
{
	// Find index in array using name of spell
	var spell_index = scr_find_spell_index("firebolt")
	
	// Pull relevant details for easier to use variables
	var damage = global.spell_stats[spell_index].damage
	var _cooldown = global.spell_stats[spell_index].cooldown
	var _mana = global.spell_stats[spell_index].mana

	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit


	firebolt = instance_create_layer(x, y, "Projectiles", obj_spell_firebolt)
		firebolt.speed = 6;
		firebolt.direction = point_direction(x, y, target_x, target_y);
		firebolt.image_angle = firebolt.direction;
		firebolt.damage = damage;
	
	
	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(_cooldown)
}