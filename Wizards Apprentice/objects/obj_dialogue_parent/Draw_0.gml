/// @description 


// Draw Pause Image
draw_sprite(global.pause_image, 0, global.cam_x, global.cam_y)


// Draw inventory image
draw_sprite_stretched
(
	spr_inventory,
	0,
	x_pos,
	y_pos,
	width,
	height
);


#region Portrait

	scr_draw_set_text(fa_middle, fa_center, fnt_default, c_white)

		// Display NPC Name
		draw_text(npc_name_x, npc_name_y, npc_name)

	scr_text_reset()

#endregion Portrait

#region Message Text

	// If unlocked and not shown, show set dialogue text. Otherwise show default message
	if(arr_dialogue[position].unlocked == true && arr_dialogue[position].shown == false)
	{
	
		scr_draw_set_text(fa_middle, fa_center, fnt_default, c_white)
			// Display Text
			draw_text(text_x, text_y, text_display)
		scr_text_reset()

	}else 
	{
		// Set to default position
		
		// Gather together all default dialogue options
		var arr_default_options = [];
		for(var i = 0; i < array_length(arr_dialogue); i++)
		{
			if(arr_dialogue[i].order == 0)
			{
				array_push(arr_default_options, arr_dialogue[i].text)
			}
		}
		
		// Randomly select default option, then set as position
		var default_length = array_length(arr_default_options)
		if(default_length != 0)
		{
			var rand = arr_default_options[irandom(default_length-1)]
			
			for(var i = 0; i < array_length(arr_dialogue); i++)
			{
				if(rand == arr_dialogue[i].text)
				{
					position = i;
				}
			}
		}else position = 0;

	}

#endregion Message Text