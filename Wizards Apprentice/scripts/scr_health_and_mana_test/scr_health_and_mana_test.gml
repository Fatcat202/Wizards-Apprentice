// Used for checking functionality of health and mana stats for the player

function scr_health_and_mana_test()
{
	if(keyboard_check_pressed(ord("K")))
	{
		active_health--	
	}else if(keyboard_check_pressed(ord("L")))
	{
		active_health++
	}
	if(keyboard_check_pressed(ord("O")))
	{
		active_mana--	
	}else if(keyboard_check_pressed(ord("P")))
	{
		active_mana++
	}
}