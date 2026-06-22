/// @description On Click

// Transfer gold to player
global.player_gold = chest_gold;

// Reset chest gold
chest_gold = 0;
chest_id.chest_gold = 0;

instance_destroy()