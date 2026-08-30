/// @description Shield Interaction


// Check self for own element type, then use switch to reach interaction
// Check other character for element shield type, removing shield if matching

switch(object_index)
{
	case obj_element_flaming:
		if(other.element_shield == "Fire") other.element_shield = "Empty";	
	break;
	
	case obj_element_steam_platform:
		if(other.element_shield == "Steam") other.element_shield = "Empty";	
	break;
	
	case obj_element_steam_air:
		if(other.element_shield == "Steam") other.element_shield = "Empty";	
	break;
	
	case obj_element_water_droplet:
		if(other.element_shield == "Water") other.element_shield = "Empty";	
	break;
	
	case obj_element_icicle:
		if(other.element_shield == "Ice") other.element_shield = "Empty";	
	break;
}