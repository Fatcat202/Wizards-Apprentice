/// @description State machine

draw_self()


// Set Location
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


	switch (state)
	{
		case "new_game": // Start a new game
		
			draw_text(x, y, "New Game")
			
			// Create start button
			if(!instance_exists(obj_button_start))
			{
				var start = instance_create_layer(x, y + 100, "Popup_Instances", obj_button_start)
			}
		
		break;
	
		case "load_game": // Load a previous game
		
			draw_text(x, y, "Load Game")
		
		break;
	
		case "options": // View and change game settings
		
			draw_text(x, y, "Options")
		
		break;
	
		case "credits": // View credits
		
			draw_text(x, y, "Credits")
		
		break;
	
		case "none": // Initial empty state before assigning other state
		
		break;
	}

// Reset Location
draw_set_halign(fa_left);
draw_set_valign(fa_top);