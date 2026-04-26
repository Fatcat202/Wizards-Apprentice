

// Used to determine shape of square auto assigning platforms

function scr_platform_shape()
{
	
	var search = 1
	
	var left = place_meeting(x - search, y, obj_platform_parent)
	var right = place_meeting(x + search, y, obj_platform_parent)
	var above = place_meeting(x, y - search, obj_platform_parent)
	var below = place_meeting(x, y + search, obj_platform_parent)
	
	
	// Variations of platform types for image_index
	enum PLAT_TYPE
	{
		DEFAULT = 0,
		RIGHT_ROUND = 1,
		LEFT_ROUND = 2,
		ROUNDED = 3,
		TOP_ROUND = 4,
	}
	
	
	// Default platform type with platform above
	if(above == true)
	{
		subimage = PLAT_TYPE.DEFAULT;
		
	}else
	
	// Right and Left side are rounded
	if(right == false && left == false && below == false)
	{
		subimage = PLAT_TYPE.ROUNDED;
	}else
	
	// Top Right and Left side are rounded
	if(right == false && left == false && below == true)
	{
		subimage = PLAT_TYPE.TOP_ROUND;
	}else
	
	// Right side is rounded
	if(right == false)
	{
		subimage = PLAT_TYPE.RIGHT_ROUND;
	}else
	
	// Left side is rounded
	if(left == false)
	{
		subimage = PLAT_TYPE.LEFT_ROUND;
	}else
	{
		// Used for platform between others, without a platform above
		subimage = PLAT_TYPE.DEFAULT;
	}
	
}