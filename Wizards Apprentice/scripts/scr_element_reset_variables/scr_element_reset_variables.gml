
// Used to reset all element related platform variables when swapping between elements

function scr_element_reset_variables()
{
	interacting = false
	is_charged = false;
	is_steaming = false;
	steam_spawned = false;
	is_flaming = false;
	flames_spawned = false
	water_level = 0;
	oil_level = 0;
	transfer_id = noone;
	transferred_from = noone
	fuel_left = fuel_default;
	fuel_burn_rate = 0;
	transfer_timer = 0;
	freeze_timer = 0
	spreading_fire_timer = 0
	melting_ice_timer = 0
	evaporation_timer = 0
	spreading_water_timer = 0
	water_drop_timer = 0;
	spreading_oil_timer = 0
	oil_drop_timer = 0;
}