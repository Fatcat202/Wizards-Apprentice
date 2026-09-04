/// @description Button Text

button_text = "Wizard Tower"

// Check if first level is completed
first_level_complete = global.level_stats[global.level_offset+0].level_completed;

if(first_level_complete == false)
{
	button_text = "Restart"
}
