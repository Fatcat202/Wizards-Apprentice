function scr_health_potion()
{
	
	// Heals the player
	
	var _item = item;
	
	instance_activate_object(obj_player_parent)
	with(obj_player_parent)
	{
		scr_heal(global.inventory[_item].main_var)
	}
	instance_deactivate_object(obj_player_parent)
}