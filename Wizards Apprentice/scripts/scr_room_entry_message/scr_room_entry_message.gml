// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_room_entry_message()
{
	// Messages sent to player upon entry to a room
	// Runs in obj_transition.
	
	
	// Introduction message in intro level
	if(room == rm_level_00)
	{
		var _message = instance_create_layer(global.cam_x, global.cam_y, "Inventory", obj_message_parent)
			_message.body_text = "Dear " + string(global.player_name) + "," + "      Congradulations! After thorough consideration, your application to be my apprentice has been accepted! I have placed a portal to my tower not far from your home, just be sure to clear the goblins first. Consider your survival your first test.      -Wizard"
			_message.button_text = "Exit"
	}
	
	

}