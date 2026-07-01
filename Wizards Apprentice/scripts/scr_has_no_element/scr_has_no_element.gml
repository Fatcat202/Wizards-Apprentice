
function scr_has_no_element(_id)
{
	// Pass through ID of object to check if it has any element
	
	if(_id.water_level == 0
	&& _id.oil_level == 0
	&& _id.is_ice == false
	&& _id.is_flaming == false
	&& _id.is_steaming == false
	&& _id.is_charged == false)
	{
		return true;
	}else
	{
		return false;
	}
}