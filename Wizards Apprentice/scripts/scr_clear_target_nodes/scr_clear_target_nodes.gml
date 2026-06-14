// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_clear_target_nodes()
{
	
	// Iterate through array and delete all objects
	for(var i = 0; i < array_length(target_nodes); i++)
	{
		with(target_nodes[i]) instance_destroy()

	}

	// Clear target nodes array
	target_nodes = []
}