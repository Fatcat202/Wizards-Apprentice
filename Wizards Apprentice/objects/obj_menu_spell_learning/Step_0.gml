/// @description 


if(!instance_exists(obj_spell_learn_slot))
{
	instance_create_layer(spell_slot_x, spell_slot_y, "Menu_Buttons", obj_spell_learn_slot,
	{
		x_pos : spell_slot_x,
		y_pos : spell_slot_y
	});
}

if(!instance_exists(obj_button_spell_learn) && obj_spell_learn_slot.inventory[0] != -1)
{
	instance_create_layer(learn_button_x, learn_button_y, "Menu_Buttons", obj_button_spell_learn)
}

// If spell has been learned, gather data to display
if(spell_learned != -1)
{
	spell_title_text = spell_learned.title

	spell_desc_text = spell_learned.desc
}else


// Display level of scroll selected
if(instance_exists(obj_spell_learn_slot))
{
	if(obj_spell_learn_slot.inventory[0] != -1)
	{
		spell_title_text = "Scroll Level: " + string(obj_spell_learn_slot.inventory[0].main_var)
	}
}else
{
	spell_title_text = "";
	spell_desc_text = "";
}

