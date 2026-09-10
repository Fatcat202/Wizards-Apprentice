/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();



#region Player Sprite

	if(is_crouching == true)
	{
		sprite_index = spr_player_crouching
	}else

	if(is_crouching == false)
	{
		sprite_index = spr_player_standing
	}
	
#region Player Sprite