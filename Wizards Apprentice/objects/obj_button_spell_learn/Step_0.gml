/// @description Insert description here
// You can write your code in this editor

if(selected_level != -1)
{
	room_name = global.level_stats[selected_level].room_name
}

// No level selected
if(selected_level == -1)
{
	button_text = "Select Level"
}else

if(global.level_stats[selected_level].level_completed == false)
{
	button_text = "Start Level"
}else

if(global.level_stats[selected_level].level_completed == true)
{
	button_text = "Replay Level"
}