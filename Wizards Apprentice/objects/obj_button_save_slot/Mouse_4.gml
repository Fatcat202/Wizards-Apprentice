/// @description



if(file_exists(file_name))
{
	// If first level complete, load normally
	if(first_level_complete == true)
	{
		scr_load_game(save_file_num)
	}else
	
	// If first level not complete, load first level
	if(first_level_complete == false)
	{
		scr_load_game(save_file_num, rm_level_00)
	}
}
