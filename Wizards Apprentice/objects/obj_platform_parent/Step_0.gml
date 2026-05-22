/// @description Elemental Conditions	


var height = sprite_get_height(sprite_index)
var half_height = height / 2;
var quarter_height = height / 4;

var width = sprite_get_width(sprite_index)
var half_width = width / 2;
var quarter_width = width / 4;


#region Surface
	// Recreate surface if destroyed
	if(!surface_exists(surf))
	{
		surf = surface_create(sprite_width, sprite_height); 
	}
#endregion Surface

#region Flaming

	if(is_flaming == true && flames_spawned == false)
	{
	
		// Spawn left flame
		flame_0 = instance_create_layer(x - quarter_width, y - half_height, "Spells", obj_element_flaming,
		{
			platform_id : id
		});
			
		// Spawn right flame
		flame_1 = instance_create_layer(x + quarter_width, y - half_height, "Spells", obj_element_flaming,
		{
			platform_id : id
		});
	
		// State flames are now spawned to prevent duplication
		flames_spawned = true;
		
		// Rotate and shift flame sprites to match slope angle
		if(object_index == obj_platform_aa_slope_left)
		{
			flame_0.image_angle = 45
			flame_0.y += half_height + quarter_height
			
			flame_1.image_angle = 45
			flame_1.y += quarter_height
		}
		if(object_index == obj_platform_aa_slope_right)
		{
			flame_0.image_angle = 315
			flame_0.y += quarter_height
			
			flame_1.image_angle = 315
			flame_1.y += half_height + quarter_height
		}

	}
	
	// Oil is removed once flames are put out
	if(flames_spawned == true)
	{
		if(!instance_exists(flame_0) && !instance_exists(flame_1))
		{
			scr_element_reset_variables()
			element = "None"
		}
	}
	
	

#endregion Flaming

#region Steaming
	
	if(is_steaming == true && steam_spawned == false)
	{
		steam = instance_create_layer(x, y - half_height, "Spells", obj_element_steam_platform,
		{
			platform_id : id
		})
		steam_spawned = true;

		
		// Rotate and shift steam sprites to match slope angle
		if(object_index == obj_platform_aa_slope_left)
		{
			steam.image_angle = 45
			steam.y += half_height
		}
		if(object_index == obj_platform_aa_slope_right)
		{
			steam.image_angle = 315
			steam.y += half_height
		}
	}
	
#endregion Steaming

#region Charged
	
	if(element != "Water")
	{
		is_charged = false
		
	}
	
#endregion Charged

#region Water Level
	
	// Reset water level if not water based element
	if(element == "Fire" || element == "Oil")
	{
		water_level = 0;
	}
	
	// Lock water level at a minimum of 0
	if(water_level < 0) water_level = 0;
	
#endregion Water Level

#region Oil Level
	
	// Reset water level if not oil
	if(element != "Oil")
	{
		oil_level = 0;
	}
	
	// Lock oil level at a minimum of 0
	if(oil_level < 0) oil_level = 0;
	
#endregion Oil Level


#region Inter Platform Element Interactions

	// Check in each direction for touching platforms. Run inter-element script for each direction
	
	// Generate random int to select cardinal direction to interact with
	var rand_dir = irandom(1)
	
	//show_debug_message("rand_dir = " + string(rand_dir))
	
	
	// Continue ongoing interaction
	if(interacting == true)
	{
		scr_element_inter_platform_interactions(id, other_id)
	}else
	
	if(interacting == false)
	{
	  other_id = -1
	}
	
	
	#region Water transfer
	

	
		#region Slopes
		
		
			// Water sliding down slopes
			if(element == "Water" && (object_index == obj_platform_aa_slope_left || object_index == obj_platform_aa_slope_right))
			{
				if(object_index == obj_platform_aa_slope_left)
				{
					if(bottom_left_free == false)
					{
						other_id = instance_place(x - sprite_width, y + sprite_height, obj_platform_parent)
						
						// Freeze water on slopes if in contact with ice
						if(element == "Water" && other_id.element == "Ice")
						{
							element = "Ice"
						}else scr_element_inter_platform_interactions(id, other_id)
					}else
					{	// Create droplet going off slope
						
						// Create droplet to left side
						func_create_water_droplet(1)
					}
				}else
				
				if(object_index == obj_platform_aa_slope_right)
				{
					if(bottom_right_free == false)
					{
						other_id = instance_place(x + sprite_width, y + sprite_height, obj_platform_parent)

						// Freeze water on slopes if in contact with ice
						if(element == "Water" && other_id.element == "Ice")
						{
							element = "Ice"
						}else scr_element_inter_platform_interactions(id, other_id)
					}else
					{	// Create droplet going off slope
						
						// Create droplet to right side
						func_create_water_droplet(0)
					}
				}
			
			}else
		
		#endregion Slopes
	
	
		// If water, check water levels of platform to left and right, transfer to lowest level
		if(element == "Water" && water_level > 0)
		{
			// Platform id to right and left
			var right_id = instance_place(x + check_distance, y, obj_platform_parent)
			var left_id = instance_place(x - check_distance, y, obj_platform_parent)
		
			if(right_id != noone && left_id != noone)
			{
				// Used to store instance id with higher water level
				var higher_id = noone
		
				// Used to select random direction with equal water levels
				var rand_water_dir = -1
				
				// If water recently transferred from another platform
				if(transferred_from != noone)
				{
					// If timer length has not been reached
					if(transfer_timer < transfer_timer_length)
					{
						// Continue to transfer in the opposite direction the water came from
						if(right_id == transferred_from) transfer_id = left_id
						else 
						if(left_id == transferred_from) transfer_id = right_id
						
						// Increment timer
						transfer_timer++
					}else 
					{
						// End of timer
						 
						// Reset transferred_from
						transferred_from = noone;
						
						// Reset timer
						transfer_timer = 0;
					}
					
					
				}else
				
				// If water has not recently transferred from another platform
				if(transferred_from == noone)
				{
					// Check if water level of right is higher than left
					if(right_id.water_level > left_id.water_level)
					{
						higher_id = right_id
			
					// Check if water level of right is higher than left
					}else if(right_id.water_level < left_id.water_level)
					{
						higher_id = left_id
					}else
					{
						// If both directions are equal, randomise direction
						rand_water_dir = irandom(1)
			
						// 0 is right
						if(rand_water_dir == 0)
						{
							higher_id = instance_place(x + 1, y, obj_platform_parent)
				
						// 1 is left
						}else
						{
							higher_id = instance_place(x - 1, y, obj_platform_parent)
						}
					}
					
					// Set transfer_id to higher_id
					transfer_id = higher_id;
				}
				
				

				// If own platforms water level is higher than the water level of highest to the left or right
				// then transfer water level between, else continue to other checks
				if(transfer_id != noone)
				{
					if(water_level > transfer_id.water_level && (transfer_id.element == "Water" || transfer_id.element == "Empty"))
					{
						// Activate interaction to transfer water level
						scr_element_inter_platform_interactions(id, transfer_id)
						
						// Send to other platform the direction to transfer to
						transfer_id.transferred_from = id
						
//						show_debug_message("Transferring to: " + string(transfer_id))
			
					}
				}
				
				
				// Clear transfer_id to prevent incorrectly stored variable
				transfer_id = noone
			}

		}else
	
	#endregion Water transfer
	
	#region Oil transfer

		#region Slopes
		
		
			// Oil sliding down slopes
			if(element == "Oil" && (object_index == obj_platform_aa_slope_left || object_index == obj_platform_aa_slope_right))
			{
				if(object_index == obj_platform_aa_slope_left)
				{
					if(bottom_left_free == false)
					{
						other_id = instance_place(x - sprite_width, y + sprite_height, obj_platform_parent)
						scr_element_inter_platform_interactions(id, other_id)
					}else
					{	// Create droplet going off slope
						
						// Create droplet to left side
						func_create_oil_droplet(1)
					}
				}else
				
				if(object_index == obj_platform_aa_slope_right)
				{
					if(bottom_right_free == false)
					{
						other_id = instance_place(x + sprite_width, y + sprite_height, obj_platform_parent)
						scr_element_inter_platform_interactions(id, other_id)
					}else
					{	// Create droplet going off slope
						
						// Create droplet to right side
						func_create_oil_droplet(0)
					}
				}
			
			}else
		
		#endregion Slopes
	
	
		// If oil, check oil levels of platform to left and right, transfer to lowest level
		if(element == "Oil" && oil_level > 0)
		{
			// Platform id to right and left
			var right_id = instance_place(x + check_distance, y, obj_platform_parent)
			var left_id = instance_place(x - check_distance, y, obj_platform_parent)
		
			if(right_id != noone && left_id != noone)
			{
				// Used to store instance id with higher oil level
				var higher_id = noone
		
				// Used to select random direction with equal oil levels
				var rand_oil_dir = -1
				
				// If oil recently transferred from another platform
				if(transferred_from != noone)
				{
					// If timer length has not been reached
					if(transfer_timer < transfer_timer_length)
					{
						// Continue to transfer in the opposite direction the oil came from
						if(right_id == transferred_from) transfer_id = left_id
						else 
						if(left_id == transferred_from) transfer_id = right_id
						
						// Increment timer
						transfer_timer++
					}else 
					{
						// End of timer
						 
						// Reset transferred_from
						transferred_from = noone;
						
						// Reset timer
						transfer_timer = 0;
					}
					
					
				}else
				
				// If oil has not recently transferred from another platform
				if(transferred_from == noone)
				{
					// Check if oil level of right is higher than left
					if(right_id.oil_level > left_id.oil_level)
					{
						higher_id = right_id
			
					// Check if oil level of right is higher than left
					}else if(right_id.oil_level < left_id.oil_level)
					{
						higher_id = left_id
					}else
					{
						// If both directions are equal, randomise direction
						rand_oil_dir = irandom(1)
			
						// 0 is right
						if(rand_oil_dir == 0)
						{
							higher_id = instance_place(x + 1, y, obj_platform_parent)
				
						// 1 is left
						}else
						{
							higher_id = instance_place(x - 1, y, obj_platform_parent)
						}
					}
					
					// Set transfer_id to higher_id
					transfer_id = higher_id;
				}
				
				

				// If own platforms oil level is higher than the oil level of highest to the left or right
				// then transfer oil level between, else continue to other checks
				if(transfer_id != noone)
				{
					if(oil_level > transfer_id.oil_level && (transfer_id.element == "Oil" || transfer_id.element == "Empty"))
					{
						// Activate interaction to transfer oil level
						scr_element_inter_platform_interactions(id, transfer_id)
						
						// Send to other platform the direction to transfer to
						transfer_id.transferred_from = id
						
//						show_debug_message("Transferring to: " + string(transfer_id))
			
					}
				}
				
				
				// Clear transfer_id to prevent incorrectly stored variable
				transfer_id = noone
			}

		}else
	
	#endregion Oil transfer
	
	
	#region Check Directions
	
		// Check right
		if(place_meeting(x + check_distance, y, obj_platform_parent) && interacting == false && rand_dir == 0)
		{
			other_id = instance_place(x + check_distance, y, obj_platform_parent)
		
			// Prevent water from spreading to platform located under another platform
			if(other_id.above_free == true)
			{
				scr_element_inter_platform_interactions(id, other_id)
			}
		
		}else
	
		// Check left
		if(place_meeting(x - check_distance, y, obj_platform_parent) && interacting == false && rand_dir == 1)
		{
			other_id = instance_place(x - check_distance, y, obj_platform_parent)
		
			// Prevent water from spreading to platform located under another platform
			if(other_id.above_free == true)
			{
				scr_element_inter_platform_interactions(id, other_id)
			}
		}
	
	#endregion Check Directions
	
	#region Water Droplets
	
		if(element == "Water" && water_level > 0 && interacting == false && above_free == true)
		{
			// Used to detect if water dropping function is used in this step
			var dropping = false
			
			// Preventing issue if platform in top left is a slope
			if(top_left_free == false)
			{
				if(instance_place(x - sprite_width, y - sprite_height, obj_platform_aa_slope_parent))
				{
					func_create_water_droplet(0)
					
					// State water dropping function has been used in step
					dropping = true;
				}
			}else
			
			// Preventing issue if platform in top right is a slope
			if(top_right_free == false)
			{
				if(instance_place(x + sprite_width, y - sprite_height, obj_platform_aa_slope_parent))
				{
					func_create_water_droplet(1)
					
					// State water dropping function has been used in step
					dropping = true;
				}
			}
			
			// If the water droplet function has not been used this step
			if(dropping == false)
			{
				// Create random direction
				var rand_dir = irandom(1)
				
				// Drop to left side
				if(top_left_free && rand_dir = 1) func_create_water_droplet(1)
				
				// Drop to right side
				if(top_right_free && rand_dir = 0) func_create_water_droplet(0)
				
				
			}
			
		}
		
	#endregion Water Droplets
	
	#region Oil Droplets
	
			if(element == "Oil" && oil_level > 0 && interacting == false && above_free == true)
			{
				// Used to detect if oil dropping function is used in this step
				var dropping = false
			
				// Preventing issue if platform in top left is a slope
				if(top_left_free == false)
				{
					if(instance_place(x - sprite_width, y - sprite_height, obj_platform_aa_slope_parent))
					{
						func_create_oil_droplet(0)
					
						// State oil dropping function has been used in step
						dropping = true;
					}
				}else
			
				// Preventing issue if platform in top right is a slope
				if(top_right_free == false)
				{
					if(instance_place(x + sprite_width, y - sprite_height, obj_platform_aa_slope_parent))
					{
						func_create_oil_droplet(1)
					
						// State oil dropping function has been used in step
						dropping = true;
					}
				}
			
				// If the oil droplet function has not been used this step
				if(dropping == false)
				{
					// Create random direction
					var rand_dir = irandom(1)
				
					// Drop to left side
					if(top_left_free && rand_dir = 1) func_create_oil_droplet(1)
				
					// Drop to right side
					if(top_right_free && rand_dir = 0) func_create_oil_droplet(0)
				
				
				}
			
			}
		
		#endregion Oil Droplets
	

#endregion Inter Platform Element Interactions


