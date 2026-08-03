// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dialogue_unlock(arr_dialogue, order = -1)
{
	// Unlock and set not shown next piece of dialogue not yet unlocked
	// Or pass through order number to unlock specific dialogue
	
	// Must pass through dialogue data variable
	
	if(order != -1)
	{
		// Unlock specific order of dialogue
		for(var i = 1; i < array_length(arr_dialogue); i++)
		{
			if(arr_dialogue[i].order = order)
			{
				arr_dialogue.unlocked = true
				arr_dialogue.shown = false
			}
		}
		
	}else
	
	if(order == -1)
	{
		// Unlock next piece of dialogue not yet unlocked
		
		var _order = -1
		
		// Find next dialogue entry in order not yet unlocked
		for(var i = 1; i < array_length(arr_dialogue); i++)
		{
			if(arr_dialogue[i].unlocked == false)
			{
				_order = arr_dialogue[i].order
				break;
			}
		}
		
		if(_order != -1)
		{
			// Search through dialogue for matching order, then set as unlocked
			for(var i = 1; i < array_length(arr_dialogue); i++)
			{
				if(arr_dialogue[i].order == _order)
				{
					arr_dialogue[i].unlocked = true
					arr_dialogue[i].shown = false
					
					order = arr_dialogue[i].order;
				}
			}
		}else
		
		// Throw error if no matching order found
		if(_order == -1)
		{
			show_error("Error: Next Dialogue to Unlock Not Found", true);
		}
	}
	
	// Set new order based on dialogue variable passed through
	if(arr_dialogue == global.arr_dialogue_wizard)
	{
		global.dialogue_wizard_order = order
	}else
	
	if(arr_dialogue == global.arr_dialogue_shop)
	{
		global.dialogue_shop_order = order
	}
	
}