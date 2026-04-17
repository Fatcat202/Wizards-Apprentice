/// @description Elemental Conditions	


var height = sprite_get_height(sprite_index)
var half_height = height / 2;

var width = sprite_get_width(sprite_index)
var half_width = width / 2;
var quarter_width = width / 4;

#region Flaming

	if(is_flaming == true && flames_spawned == false)
	{
	
		// Spawn left flame
		flame_0 = instance_create_layer(x - quarter_width, y - half_height, "Spells", obj_element_flaming,
		{
			platform_id : id
		});
			

		// Spawn right flame
		flame_1 = instance_create_layer(x + quarter_width, y - half_height, "Spells", obj_element_flaming,
		{
			platform_id : id
		});
	
		// State flames are now spawned to prevent duplication
		flames_spawned = true;

	}
	
	// Oil is removed once flames are put out
	if(flames_spawned == true)
	{
		if(!instance_exists(flame_0) && !instance_exists(flame_1))
		{
			scr_element_reset_variables()
			element = "None"
		}
	}
	
	

#region Flaming

#region Steaming
	
	if(is_steaming == true && steam_spawned == false)
	{
		steam = instance_create_layer(x, y - half_height, "Spells", obj_element_steam)
		steam_spawned = true;
		
		
		// Reset conditions when steam dissapates
		if(instance_exists(steam) == false)
		{
			is_steaming = false
			steam_spawned = false
		}
	}
	
#endregion Steaming

#region Charged
	
	if(element != "Water")
	{
		is_charged = false
		
	}
	
#endregion Charged

#region Inter Platform Element Interactions

	// Check in each direction for touching platforms. Run interelement script for each direction

	var other_id = noone
	
	// Distance to check
	var check_distance = 1
	
	// Check right
	if(place_meeting(x + check_distance, y, obj_platform_parent))
	{
		other_id = instance_place(x + check_distance, y, obj_platform_parent)
		scr_element_inter_platform_interactions(id, other_id)
	}
	
	// Check left
	if(place_meeting(x - check_distance, y, obj_platform_parent))
	{
		other_id = instance_place(x - check_distance, y, obj_platform_parent)
		scr_element_inter_platform_interactions(id, other_id)
	}
	
	// Check top
	if(place_meeting(x, y + check_distance, obj_platform_parent)) 
	{
		other_id = instance_place(x, y + check_distance, obj_platform_parent)
		scr_element_inter_platform_interactions(id, other_id)
	}
	
	// Check bottom
	if(place_meeting(x, y - check_distance, obj_platform_parent))
	{
		other_id = instance_place(x, y - check_distance, obj_platform_parent)
		scr_element_inter_platform_interactions(id, other_id)
	}
	


	
#endregion Inter Platform Element Interactions
