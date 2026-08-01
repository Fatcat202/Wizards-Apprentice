/// @description 


// Pause game upon creation
scr_dialogue_pause()


#region Variables

	// ** MUST CHANGE IN EACH CHILD VARIABLE DEFINITIONS**
	//dialogue_csv_name
	//order

	// Position of dialogue within arr_dialogue
	position = 0;
	// Suborder within dialogue. Increments as dialogue is moved through, showing text in order
	suborder = 0;


	x_middle = global.cam_x + (global.cam_w/2)
	y_middle = global.cam_y + (global.cam_h/2)

	spacer = 12;
	width = 475;
	height = 100;
	x_pos = x_middle - (width/2);
	y_pos = y_middle + 75;


	text_x = x_middle;
	text_y = y_pos + 35;
	
	button_leave_x = x_middle + 175
	button_leave_y = y_pos + 70
	
#endregion Variables


#region Dialogue Data
			
	// Create dialogue_index_length for tracking total number of dialogue entries in csv
	dialogue_index_length = 0;

	// Create dialogue array for tracking stats
	arr_dialogue[0] = 0;

	var ds_dialogue_csv = load_csv(dialogue_csv_name);

	// Ensure the grid is valid
	if (ds_dialogue_csv == -1) {
		show_error("Failed to load CSV file.", true);
		exit;
	}

	// Initialize stats dictionary constructor
	function const_dialogue(_order = -1, _suborder = -1, _unlocked = false, _text = -1) constructor
	{
		order = _order			// Overarching order of text to be shown, eg. before level, after interacting with something, etc...
		suborder = _suborder	// Order of dialogue within text chain, eg. 1st msg, 2nd msg...
		unlocked = _unlocked	// States if dialogue has been unlocked and may be viewed by player. Default as false
		text = _text			// Text to be displayed 
	}

	// Declare length of dialogue index based on adjusted CSV height
	dialogue_index_length = ds_grid_height(ds_dialogue_csv) - 1
			
	// Create dialogue struct array
	for(var i = 0; i <= dialogue_index_length; i++)
	{
		arr_dialogue[i] = new const_dialogue();
	}

	// Assign all values from CSV file into stats database structs
	for(var i = 0; i < dialogue_index_length; i++)
	{
		var yy = i;
		var xx = 0;
				
		arr_dialogue[yy].order = real(ds_grid_get(ds_dialogue_csv, xx, yy+1)); xx++;
		arr_dialogue[yy].suborder = real(ds_grid_get(ds_dialogue_csv, xx, yy+1)); xx++;
		arr_dialogue[yy].unlocked = bool(ds_grid_get(ds_dialogue_csv, xx, yy+1)); xx++;
		arr_dialogue[yy].text = string(ds_grid_get(ds_dialogue_csv, xx, yy+1)); xx++;

	}
			
	
	// Cleanup DS grid
	ds_grid_destroy(ds_dialogue_csv);
			
	// Debug testing
				
//	show_debug_message("dialogue Constructor List: " + string(dialogue))
//	show_debug_message("dialogue_index_length: " + string(dialogue_index_length))


#endregion Dialogue Data


#region Dialogue initial Position

	// Search through arr_dialogue for position of dialogue branch using order
	for(var i = 0; i < dialogue_index_length; i++)
	{
		if(arr_dialogue[i].order == order)
		{
			position = i;
			break;
		}	
	}

#endregion Dialogue Initial Position


#region Buttons


	if(!instance_exists(obj_button_dialogue_leave))
	{
		instance_create_layer(button_leave_x, button_leave_y, "Menu_Buttons", obj_button_dialogue_leave)
	}


#endregion Buttons


