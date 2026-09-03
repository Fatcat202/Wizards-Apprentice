
// Used to assign textures to auto assign platforms based on active room

function scr_texture_auto_assign()
{
	// Stored room name
	var active_room = room_get_name(room)
	
	// Stored room texture, assigned in "Room Textures"
	var room_texture = -1;
	
	
	#region Room Textures
	
		// ASSIGN TEXTURES TO ROOMS HERE
	
	// Check room name against assigned room textures
	switch(active_room)
	{
		case "rm_testing_0":
			
			room_texture = "Stone";
			
		break;
		
		case "rm_testing_1":
		
			room_texture = "Testing";
			
		break;
		
		case "rm_wizard_tower":
		
			room_texture = "Stone";
			
		break;
		
		case "rm_wizard_tower_cellar":
		
			room_texture = "Stone";
			
		break;
		
		case "rm_wizard_tower_top":
		
			room_texture = "Stone";
			
		break;
		
		case "rm_level_00":
		
			room_texture = "Grass";
			
		break;
		
		case "rm_level_10":
		
			room_texture = "Stone";
			
		break;
		
		case "rm_level_11":
		
			room_texture = "Stone";
			
		break;
		
		default: // Default Option
		
		show_error("ERROR: CANNOT FIND PLATFORM TEXTURE", false);
		
		break;
	}
	
	
	#endregion Room Textures
	
	
	#region Assign Textures
	
		if(room_texture == "Testing")
		{
			platform_texture = spr_tex_testing;
			ground_texture = spr_tex_ground_testing;
		}else
	
		if(room_texture == "Stone")
		{
			platform_texture = spr_tex_stone;
			ground_texture = spr_tex_ground_stone;
		}else
		
		if(room_texture == "Grass")
		{
			platform_texture = spr_tex_dirt;
			ground_texture = spr_tex_ground_grass;
		}else
		{
			
			// Apply default texture
			platform_texture = sprite_index
			
			show_error("ERROR: CANNOT FIND PLATFORM TEXTURE", false)
		}
		
	#region Assign Textures
}