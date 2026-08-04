/// @description When Pressed

with(obj_dialogue_parent)
{
	// Set dialogue being displayed as shown
	arr_dialogue[position].shown = true;
	
	// Increment position
	position++
	
	// Reset text string
	text_display = ""
	typewriter_timer = 0
	str_pos = 1
	
	
	// Check end of all dialogue has not been reached
	if(position+1 <= dialogue_index_length)
	{
		// Check if next entry in dialogue does not have the same order
		if(arr_dialogue[position+1].order != order)
		{
			instance_destroy(obj_button_dialogue_next)
		}
	}else
	{
		instance_destroy(obj_button_dialogue_next)
	}
}
