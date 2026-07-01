

// Use to activate jump
function scr_enemy_activate_jump()
{
	if(!collision_line(x, y, target_x, target_y, obj_platform_solid_parent, false, false))
	{
		// Trigger the enemy to jump
		scr_enemy_jump()
	}
}

// Run after enemy coord update to declare if jumping
function scr_enemy_set_jumping()
{
	// Reset is_jumping when on the ground
	if(scr_on_ground() == true)
	{
		is_jumping = false;		
	}
}