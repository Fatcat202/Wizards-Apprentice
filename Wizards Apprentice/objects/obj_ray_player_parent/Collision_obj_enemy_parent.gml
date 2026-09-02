/// @description Damage

// Prevent Stacking
if(!array_contains(arr_enemies_hurt, other.id))
{
	scr_damage(damage)
	array_push(arr_enemies_hurt, other.id)
}