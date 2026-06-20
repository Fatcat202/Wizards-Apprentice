function scr_health_potion()
{
	
	// Heals the player
	
	var _item = item;
	with(obj_player_parent)
	{
		scr_heal(global.inventory[_item].main_var)
	}
}