// Test if object is located on the ground, return True or False
// May optionally pass through external object, default is testing self
function scr_on_ground(obj = self)
{
	if(place_meeting(obj.x, obj.y + 1, obj_collision_parent))
	{
		return true
	}else return false

}