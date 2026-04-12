/// @description Elemental Conditions	


var height = sprite_get_height(sprite_index)
var half_height = height / 2;

var width = sprite_get_width(sprite_index)
var half_width = width / 2;
var quarter_width = width / 4;

var flame_0 = noone
var flame_1 = noone

if(is_flaming == true && flames_spawned == false)
{
	
	// Spawn left flame
	flame_0 = instance_create_layer(x - quarter_width, y - half_height, "Spells", obj_element_flaming)

	// Spawn right flame
	flame_1 = instance_create_layer(x + quarter_width, y - half_height, "Spells", obj_element_flaming)
	
	// State flames are now spawned to prevent duplication
	flames_spawned = true;

}
