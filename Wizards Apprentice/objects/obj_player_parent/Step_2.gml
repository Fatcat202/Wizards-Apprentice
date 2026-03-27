/// @description Death

// Checks HP, if 0 or lower then kill player
if(active_health <= 0) scr_player_death()

// Check to make sure active health is not greater than max
if(active_health > max_health) active_health = max_health;

// Check to make sure active mana is not greater than max or lower than 0
if(active_mana > max_mana) active_mana = max_mana;
else if(active_mana < 0) active_mana = 0;