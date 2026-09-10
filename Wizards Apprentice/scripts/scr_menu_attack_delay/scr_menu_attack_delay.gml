// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_menu_attack_delay()
{
	// Used at the end of resume scripts to start a timer on the player to deactivate the "attack" button
	// For the purposes of preventing attacks from taking place when clicking a button to leave a menu
	
	if(instance_exists(obj_player_parent))
	{
		with(obj_player_parent)
		{
			menu_attack_delay = true;
		}
	}
}