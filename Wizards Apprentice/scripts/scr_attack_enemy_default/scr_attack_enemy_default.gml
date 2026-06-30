
function scr_attack_enemy_default(attack_name)
{
	
	// Pass through name of attack as string to pull stats
	
	// Pull relevant stats
	scr_gather_enemy_attack_stats(attack_name)
		
	// Check if cooldown is active
	if(atk_melee_default_cooldown = true) exit;
	
	var atk_target_x = obj_player_parent.x
	var atk_target_y = obj_player_parent.y
	
	// Do not allow attack if player is not directly visible
	if(player_visible == false) exit;
	var distance_to_target = point_distance(x, y, atk_target_x, atk_target_y)

	if(can_attack == true && distance_to_target <= atk_range)
	{
		// Create attack object
		var melee = instance_create_layer(x, y, "Spells", obj_attack_enemy_default);
		
			// Set variables
			melee.direction = point_direction(x, y, atk_target_x, atk_target_y);
			melee.image_angle = melee.direction;
			
			
			scr_send_enemy_attack_stats(melee)
			
			
		// Set timer
		atk_melee_default_cooldown = true;
		atk_melee_default_time = game_get_speed(gamespeed_fps) * atk_spd;
		atk_melee_default_timer = 0;
	}
}