/// @description Camera

#macro CAMERA view_camera[0]

// Check if obj_player_parent exists
if(instance_exists(obj_player_parent))
{
	// Set camera to target obj_player_parent
	global.cam_target_x = obj_player_parent.x - global.cam_w / 2;
	global.cam_target_y = obj_player_parent.y - global.cam_h / 2;
	
}
	
// Prevent camera from leaving map
//global.cam_target_x = clamp(global.cam_target_x, 0, room_height - global.cam_w);
//global.cam_target_y = clamp(global.cam_target_y, 0, room_width - global.cam_h);
	
// Set linear interpolation for camera movement smoothing
global.cam_x = lerp(global.cam_x, global.cam_target_x, global.cam_smoothing);
global.cam_y = lerp(global.cam_y, global.cam_target_y, global.cam_smoothing);


// Set camera position
camera_set_view_pos(CAMERA, global.cam_x, global.cam_y);

// Set camera size
camera_set_view_size(CAMERA, global.cam_w, global.cam_h)



// Store previous
global.mouse_x_previous = device_mouse_x_to_gui(0);
global.mouse_y_previous = device_mouse_y_to_gui(0);
