// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_enemy_timers()
{

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

}