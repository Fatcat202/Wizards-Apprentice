
function scr_health_drain(drain)
{
	// Drain health from max health pool, or return drained health
	// Positive number to add to drain, negative number to subtract from drain
	
	// Increment health drain
	health_drain += drain
	
	// Set new max health
	max_health = base_max_health - drain;

}