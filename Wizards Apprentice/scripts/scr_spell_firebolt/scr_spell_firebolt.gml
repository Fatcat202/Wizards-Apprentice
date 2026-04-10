
// Cantrip firing bolt of fire doing damage

function scr_spell_firebolt(target_x = mouse_x, target_y = mouse_y)
{
	scr_pull_spell_data("firebolt")

	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit


	firebolt = instance_create_layer(x, y, "Projectiles", obj_spell_firebolt,
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