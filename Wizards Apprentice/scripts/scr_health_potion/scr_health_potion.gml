function scr_health_potion()
{
	
	// Heals the player
	
	var _item = item;
	var _inventory = inventory;
	
	instance_activate_object(obj_player_parent)
	with(obj_player_parent)
	{
		scr_heal(_inventory[_item].main_var)
	}
	instance_deactivate_object(obj_player_parent)
}