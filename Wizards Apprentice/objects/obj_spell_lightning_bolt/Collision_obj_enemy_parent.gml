/// @description Insert description here
// You can write your code in this editor

// Prevent Stacking
if(!array_contains(arr_enemies_hurt, other.id))
{
	scr_damage(damage)
	array_push(arr_enemies_hurt, other.id)
	
	if(other.can_be_stunned == true)
	{
		other.plat_stunned = true
	}
	
	
	
}