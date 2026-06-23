// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_transfer_to_room(_next_room, _target_x = -1, _target_y = -1)
{
	// Create transition object
	if(!instance_exists(obj_transition))
	{
		
		var transition = instance_create_layer(x, y, "Game_Manager", obj_transition,
		{
			next_room : _next_room,
			state : 1,
			target_x : _target_x,
			target_y : _target_y
		});
	}
}