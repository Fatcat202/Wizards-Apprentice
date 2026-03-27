

#region Global Variables

	#region Variables
	
	
	// Sets how many pixel away objects must be from another object to collide 
	// (x2 if both move towards each other)
	global.collision_distance = 2

	
	#endregion Variables

	#region Controls
	
		// Movement
		global.cont_left = "A";
		global.cont_right = "D";
		global.cont_jump = vk_space;
		
		//Misc
		global.cont_attack = mouse_check_button(mb_left)
		global.cont_block = mouse_check_button(mb_right)
		global.cont_menu = "ESC";
	
	#endregion Controls


#endregion Global Variables