
function scr_attack_melee_default(attack_name)
{
	
	// Pass through name of attack as string to pull stats
	
	// Pull relevant stats
	scr_gather_enemy_attack_stats(attack_name)
		
	// Check if cooldown is active
	if(atk_melee_default_cooldown = true) exit;
	
	var distance_to_target = point_distance(x, y, target_x, target_y)

	if(can_attack == true && distance_to_target <= atk_range)
	{
		// Create attack object
		var melee = instance_create_layer(x, y, "Spells", obj_melee_enemy_default);
		
			// Set variables
			melee.direction = point_direction(x, y, target_x, target_y);
			melee.image_angle = melee.direction;
			melee.image_xscale = distance_to_target / sprite_get_width(sprite);
			melee.element = element;
			melee.sprite = sprite;
			melee.sprite_index = sprite;
			melee.damage = damage;
			melee.level = level;
			melee.enemy_object = object_index;
			melee.visible = is_visible;
			
		// Set timer
		atk_melee_default_cooldown = true;
		atk_melee_default_time = game_get_speed(gamespeed_fps) * atk_spd;
		atk_melee_default_timer = 0;
	}
}