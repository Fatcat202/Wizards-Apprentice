/// @description On Destruction

// Destroy flame object if flaming
if(is_flaming == true)
{
	if(instance_exists(flame_0)) instance_destroy(flame_0)
}

