

#region Variables

	// Top of screen
	top = global.cam_y
	// Bottom of screen
	bottom = top + global.cam_h
	// Left of screen
	left = global.cam_x
	// Right of screen
	right = left + global.cam_w
	// Middle of screen off x axis
	middle_x = left + (global.cam_w / 2)
	// Middle of screen off y axis
	middle_y = top + (global.cam_h / 2)
	
	
	// Number of frames to use for delay between actions
	time_delay = game_get_speed(gamespeed_fps) * 0.75
	
	
	room_number = global.active_level_num
	
	// Rewards to be granted for level completed
	level_xp = global.arr_levels[room_number].reward_xp
	level_gold = global.arr_levels[room_number].reward_gold
	global.arr_levels[room_number].level_completed = true;
	
	
	// Bonus gold and xp for display
	bonus_xp = 0;
	bonus_gold = 0;
	

	// Per frame xp/gold transfer
	increment = 6;
	
	
	// Sets functions to active in step event
	give_rewards_active = false;
	give_bonus_xp_active = false;
	give_earned_xp_active = false;
	give_gold_active = false;
	

#endregion Variables


#region Locations

	level_complete_x = middle_x
	level_complete_y = top + 25
	
	player_level_x = middle_x
	player_level_y = level_complete_y + 80
	
	// XP
		xp_gained_x = middle_x - 35
		xp_gained_y = player_level_y + 30
	
		xp_bonus_x = xp_gained_x
		xp_bonus_y = xp_gained_y + 30
	
		xp_total_x = middle_x + 25
		xp_total_y = player_level_y + 30
	
	// Gold
		bonus_gold_x = xp_gained_x
		bonus_gold_y = xp_bonus_y + 50
	
		total_gold_x = xp_total_x
		total_gold_y = bonus_gold_y
	
	
	button_x = middle_x
	button_y = bottom - 50

#endregion Locations


#region Functions


	function func_give_rewards()
	{
		
		// Increment bonus xp and gold based on rewards for level completed
		
		// Check if any level xp remains
		if(level_xp == 0 && level_gold == 0)
		{
			// Declare all bonus XP has been given to earned xp total
			if(!alarm_get(1)) alarm_set(1, time_delay)
			give_rewards_active = false;
		}else
			
		if(level_xp > 0 || level_gold > 0)
		{
			// Give bonus XP and gold as rewards
				
			// Check level xp is not less than increment
			if(level_xp < increment)
			{
				bonus_xp += level_xp
				level_xp = 0;
			}else
			{
				level_xp -= increment;
				bonus_xp += increment;
			}
			
			// Check level gold is not less than increment
			if(level_gold < increment)
			{
				bonus_gold += level_gold
				level_gold = 0;
			}else
			{
				level_gold -= increment;
				bonus_gold += increment;
			}
			
				
		}
		
	}


	function func_give_bonus_xp()
	{
		// Increment bonus xp lower and earned xp higher each frame until bonus xp is used up
		
		// Check if any bonus xp remains
		if(bonus_xp == 0)
		{
			// Declare all bonus XP has been given to earned xp total
			if(!alarm_get(2)) alarm_set(2, time_delay)
			give_bonus_xp_active = false;
		}else
			
		if(bonus_xp > 0)
		{
			// Give bonus XP to earned XP
				
			// Check bonus xp is not less than increment
			if(bonus_xp < increment)
			{
				global.player_earned_xp += bonus_xp
				bonus_xp = 0;
			}else
			{
				bonus_xp -= increment;
				global.player_earned_xp += increment;
			}
				
		}
		
	}
	
	
	function func_give_earned_xp()
	{
		// Increment earned xp lower and player xp higher each frame until earned xp is used up

		// Check if any earned xp remains
		if(global.player_earned_xp == 0)
		{
			// Declare all earned XP has been given to the player
			if(!alarm_get(3)) alarm_set(3, time_delay)
			give_earned_xp_active = false;
		}else
			
		if(global.player_earned_xp > 0)
		{
			// Give earned XP to player XP
				
				
			// Check earned xp is not less than increment
			if(global.player_earned_xp < increment)
			{
				global.player_xp += global.player_earned_xp;
				global.player_earned_xp = 0;
			}else
			{
				global.player_earned_xp -= increment;
				global.player_xp += increment;
			}
			
			// Check each increment for player level up, granting free level if true
			scr_player_level_up_check()
				

		}
		
	}
		
		
	function func_give_gold()
	{
		// Increment bonus gold lower and player gold higher each frame until bonus gold is used up
		
		// Check if any bonus gold remains
		if(bonus_gold == 0)
		{
			// Declare all bonus gold has been given to earned gold total
			if(!alarm_get(4)) alarm_set(4, time_delay)
			give_gold_active = false;
		}else
			
		if(bonus_gold > 0)
		{
			// Give bonus gold to earned gold
				
			// Check bonus gold is not less than increment
			if(bonus_gold < increment)
			{
				global.player_gold += bonus_gold
				bonus_gold = 0;
			}else
			{
				bonus_gold -= increment;
				global.player_gold += increment;
			}
				
		}
	}


#endregion Functions


