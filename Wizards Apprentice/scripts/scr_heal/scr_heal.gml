
function scr_heal(healing)
{
		
	// Heal the character targeted by effect
	active_health = active_health + healing;
	
	// Prevent health exceeding max
	if(active_health > max_health) active_health = max_health;
	
}