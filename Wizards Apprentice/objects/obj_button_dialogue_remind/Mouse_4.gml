/// @description When Pressed

with(obj_dialogue_parent)
{
	// Loop through dialogue array looking for most recently unlocked dialogue tree
	for(var i = 1; i < dialogue_index_length; i++)
	{
		if(arr_dialogue[i].unlocked == true)
		{	
			// Set most recently unlocked as "order"
			order = arr_dialogue[i].order
		}
	}
	
	var _pos = -1;
	// Loop through dialogue array looking for matching order as previously set
	for(var i = 0; i < dialogue_index_length; i++)
	{
		if(arr_dialogue[i].order == order)
		{
			// Set all with matching order as "not shown"
			arr_dialogue[i].shown = false
			
			// Gather position of first piece of dialogue in matching order
			if(_pos == -1) _pos = i;
		}
	}
	
	position = _pos;
	
	// Reset text string
	text_display = ""
	typewriter_timer = 0
	str_pos = 1
	
	
}
