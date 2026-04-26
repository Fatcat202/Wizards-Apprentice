

// Used to assign textures to rooms for use by obj_platform_aa_parent and all child objects

function scr_texture_auto_assign()
{
	// Holds room name
	room_name = room_get_name(room)
	
	// Checks for assignment
	switch (room_name)
	{
		case "rm_testing":
		
			platform_texture = spr_tex_stone
		break;
		
		default:
			
			// Apply default texture
			//platform_texture = sprite_index
			
			//show_debug_message("ERROR: CANNOT FIND PLATFORM TEXTURE")
		
		break;
	}
}