
function scr_spell_water_splash(target_x = mouse_x, target_y = mouse_y)
{

	// Pull relevant details for easier to use variables
	scr_pull_spell_data("water splash")
	
	// Prevent use of spell if not enough mana. Expend mana if player has enough
	if(scr_use_mana(_mana) == false) exit
	

	water_splash = instance_create_layer(x, y, "Spells", obj_spell_water_splash,
	{
		level : _level,
		damage : _damage,
		atk_speed : _atk_speed,
		cooldown : _cooldown,
		mana : _mana,
		memory : _memory,
		uses : _uses,
		duration : _duration,
		element : _element,
		title : _title,
		desc : _desc,
		spr : _spr,
		scr : _scr,
		
		speed : 6,
		direction : point_direction(x, y, target_x, target_y),
		image_angle : point_direction(x, y, target_x, target_y),

	});
	
	
	// Set cooldown time depending on spell slot selected
	scr_set_spell_cooldown(_cooldown)
	
	
}