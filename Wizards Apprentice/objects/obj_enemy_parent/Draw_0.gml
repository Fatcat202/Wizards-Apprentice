/// @description Target X and Y

// Inherit the parent event
event_inherited();


if(path_exists(attack_path))
{
	draw_path(attack_path, x, y, true)
}

#region Alert Sprite

	// Gap between top of enemy sprite and alert sprite
	var _gap = 10

	if(show_alert = true)
	{
		if(alert_timer > alert_length)
		{
			can_show_alert = false;
			show_alert = false
		}else
		{
			// Draw alert sprite
			draw_sprite(spr_alert, 0, x, y - sprite_height/2 - 10)
			alert_timer++
		}
	}
	
#endregion Alert Sprite
