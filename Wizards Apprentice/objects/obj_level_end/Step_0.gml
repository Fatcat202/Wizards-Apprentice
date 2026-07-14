/// @description 


#region Initial Alarm


	if(!instance_exists(obj_transition))
	{
		// Initial alarm used to trigger first delay
		if(!alarm_get(0)) alarm_set(0, time_delay)
	}


#region Initial Alarm

if(give_rewards_active == true)
{
	func_give_rewards()
}

if(give_bonus_xp_active == true)
{
	func_give_bonus_xp()
}

if(give_earned_xp_active == true)
{
	func_give_earned_xp()
}

if(give_gold_active == true)
{
	func_give_gold()
}