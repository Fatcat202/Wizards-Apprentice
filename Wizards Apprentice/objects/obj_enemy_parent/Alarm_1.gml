/// @description Player Not Visible




if(caster == true)
{
	scr_caster_teleport_home()
	
	
}else

if(caster == false)
{
	// If player is not visible for a set time, reset state to idle
	state_behavior = state_idle;
}
