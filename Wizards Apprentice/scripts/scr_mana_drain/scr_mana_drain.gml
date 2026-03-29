
function scr_mana_drain(drain)
{
	// Drain mana from max mana pool, or return drained mana
	// Positive number to add to drain, negative number to subtract from drain
	
	// Increment mana drain
	mana_drain += drain
	
	// Set new max mana
	max_mana = base_max_mana - drain;

	// Prevent going over unadjusted max mana when removing drain
	if(max_mana > base_max_mana) max_mana = base_max_mana;
	
	// Prevent going below 0 when adding drain
	if(max_mana < 0) max_mana = 0;
}