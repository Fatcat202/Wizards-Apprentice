// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_timers()
{

	#region Attacks
	
		#region Melee Default
		
			if(atk_melee_default_timer >= atk_melee_default_time)
			{
				atk_melee_default_cooldown = false;
				atk_melee_default_timer = 0;	
			}else atk_melee_default_timer++;
		
		#endregion Melee Default
	
	
	#endregion Attacks


	#region Target Cooldown
		
		// Ticks up counter until next target node may be created
	
		if(target_cooldown_timer >= target_cooldown_length)
		{
			// Declare the enemy may set a new target
			can_target = true;
			
			// Reset timer
			target_cooldown_timer = 0;

		}else target_cooldown_timer++
		
	#endregion Target Cooldown


	#region Can Jump Cooldown
		
		// Ticks up counter until next enemy can jump again
	
		if(can_jump_cooldown_timer >= can_jump_cooldown_length)
		{
			// Declare the enemy may set a new can_jump
			can_jump = true;
			
			// Reset timer
			can_jump_cooldown_timer = 0;

		}else can_jump_cooldown_timer++
		
	#endregion Can Jump Cooldown
	
	
	#region Gravity Delay Cooldown
		
		// Ticks counter to determine if enemy gravity on or off when jumping
	
		if(grav_delay_cooldown_timer >= grav_delay_cooldown_length)
		{
			// Declare enemy gravity delay to be off
			grav_delay = false;
			
			// Reset timer
			grav_delay_cooldown_timer = 0;

		}else grav_delay_cooldown_timer++
		
	#endregion Gravity Delay Cooldown
	
	
	#region Pathing Free Cooldown
		
		// Ticks counter until enemy may create a new path for pathfinding
	
		if(pathing_free_cooldown_timer >= pathing_free_cooldown_length)
		{
			// Declare enemy can set a new path
			pathing_free = true;
			
			// Reset timer
			pathing_free_cooldown_timer = 0;

		}else pathing_free_cooldown_timer++
		
	#endregion Pathing Free Cooldown

}