// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_dialogue_read(dialogue, order)
{
	// Used to check if dialogue has been read
	// Pass through dialogue and order to check
	
	
	for(var i = 0; i < array_length(dialogue); i++)
	{
		if(dialogue[i].order = order)
		{
			if(dialogue[i].shown = true)
			{
				return true;
			}else return false;
		}
	}
}