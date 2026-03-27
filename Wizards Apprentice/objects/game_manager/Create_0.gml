

#region Global Variables

	#region Variables
	
	
	// Sets how many pixel away objects must be from another object to collide 
	// (x2 if both move towards each other)
	global.collision_distance = 2
	
	#region Camera
	
		// Storing previous frames mouse location in relation to GUI
		global.mouse_x_previous = device_mouse_x_to_gui(0);
		global.mouse_y_previous = device_mouse_y_to_gui(0);
	
		// Camera smoothing speed
		global.cam_smoothing = 0.3;
		
		// Camera target position
		global.cam_target_x = 0;
		global.cam_target_y = 0;
		
		// Camera origin
		global.cam_x = camera_get_view_x(CAMERA);
		global.cam_y = camera_get_view_y(CAMERA);
		
		// Camera size
		global.cam_w = camera_get_view_width(CAMERA);
		global.cam_h = camera_get_view_height(CAMERA);
	
	
	#endregion Camera

	
	#endregion Variables


#endregion Global Variables

#region Camera

	// Resolution
		// Default resolution
		view_width = 640;
		view_height = 360;
	
		// Used for full screen
		//view_width = 1960;
		//view_height = 1080;

	// Scaling (hardcoded for now)
	window_scale = 1;

	// Set size of window and center it
	window_set_size(view_width * window_scale, view_height * window_scale);
	alarm[0] = 1;

	surface_resize(application_surface, view_width * window_scale, view_height * window_scale);

#endregion Camera