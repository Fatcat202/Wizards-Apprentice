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

#region Flaming

#region Inter Platform Element Interactions
	var other_id = noone
	
	var check_distance = 1
	
	if(place_meeting(x + check_distance, y, obj_platform_parent)) other_id = instance_place(x + check_distance, y, obj_platform_parent)
	
	if(place_meeting(x - check_distance, y, obj_platform_parent)) other_id = instance_place(x - check_distance, y, obj_platform_parent)
	
	if(place_meeting(x, y + check_distance, obj_platform_parent)) other_id = instance_place(x, y + check_distance, obj_platform_parent)
	
	if(place_meeting(x, y - check_distance, obj_platform_parent)) other_id = instance_place(x, y - check_distance, obj_platform_parent)
	

	if(other_id != noone) scr_element_inter_platform_interactions(id, other_id)


	
#endregion Inter Platform Element Interactions
