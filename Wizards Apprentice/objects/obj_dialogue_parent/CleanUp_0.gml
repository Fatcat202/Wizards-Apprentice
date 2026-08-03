/// @description On Destruction


// Resume Game
scr_dialogue_resume()


// Set shown messages as "shown" if all messages with matching order have been shown

// Check end of all dialogue has not been reached
if(position != dialogue_index_length)
{
	// Check if next entry in dialogue does not have the same order
	if(arr_dialogue[position+1].order != order)
	{
		// Loop through dialogue data looking for entries with a matching order, set all as shown
		for(var i = 1; i < dialogue_index_length; i++)
		{
			if(arr_dialogue[i].order == order)
			{
				arr_dialogue[i].shown = true;
			}
		}
	}
}else

// If end of dialogue order has been reached, set as shown
if(position == dialogue_index_length)
{
	// Loop through dialogue data looking for entries with a matching order, set all as shown
	for(var i = 1; i < dialogue_index_length; i++)
	{
		if(arr_dialogue[i].order == order)
		{
			arr_dialogue[i].shown = true;
		}
	}
}



// Remove buttons
if(instance_exists(obj_button_dialogue_leave)) instance_destroy(obj_button_dialogue_leave)
if(instance_exists(obj_button_dialogue_next)) instance_destroy(obj_button_dialogue_next)
if(instance_exists(obj_button_dialogue_remind)) instance_destroy(obj_button_dialogue_remind)