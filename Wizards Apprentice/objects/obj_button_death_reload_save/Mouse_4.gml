/// @description When Pressed


// If first level is complete, reload normally
if(first_level_complete == true)
{
	scr_load_game(global.file_num)
}else
// If first level is not completed, restart at start of first level
if(first_level_complete == false)
{
	scr_load_game(global.file_num, rm_level_00)
}
