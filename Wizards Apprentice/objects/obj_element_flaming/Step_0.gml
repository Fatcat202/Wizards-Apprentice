/// @description


// Destroy if original platform is not flaming or oil
if(platform_id.is_flaming == false || platform_id.element != "Oil" || instance_exists(platform_id) == false)
{
	instance_destroy()
}