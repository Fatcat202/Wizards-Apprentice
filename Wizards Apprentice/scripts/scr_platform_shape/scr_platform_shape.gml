

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
		SQUARE = 0,
		ROUNDED = 1,
		
		RIGHT_ROUND = 2,
		LEFT_ROUND = 3,
		
		TOP_ROUND = 4,
		BOTTOM_ROUND = 5,
		
		
	}
	
	
	if(above == true && right == true && left == true)
	{
		subimage = PLAT_TYPE.SQUARE
	}else
	
	if(left == true && right == false)
	{
		subimage = PLAT_TYPE.RIGHT_ROUND
	}else
	
	if(left == false && right == true)
	{
		subimage = PLAT_TYPE.LEFT_ROUND
	}else
	
	if(left == false && right == false && above == false && below == false)
	{
		subimage = PLAT_TYPE.ROUNDED
	}else
	
	if(above == false && below == true)
	{
		subimage = PLAT_TYPE.TOP_ROUND
	}else
	
	if(below == false && above == true)
	{
		subimage = PLAT_TYPE.BOTTOM_ROUND
	}
	
}