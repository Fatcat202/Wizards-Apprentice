/// @description On Click


if(stat == 0)
{
	if(menu_id.temp_vit-1 >= global.vitality) menu_id.temp_vit--
}else

if(stat == 1)
{
	if(menu_id.temp_dex-1 >= global.dexterity) menu_id.temp_dex--
}else

if(stat == 2)
{
	if(menu_id.temp_int-1 >= global.intelligence) menu_id.temp_int--
}else

if(stat == 3)
{
	if(menu_id.temp_mem-1 >= global.memory) menu_id.temp_mem--
}else

if(stat == 4)
{
	if(menu_id.temp_cha-1 >= global.charisma) menu_id.temp_cha--
}

menu_id.temp_free_level++;