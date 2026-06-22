/// @description Destroy self if chest does not exist

// Destroy self if chest does not exist or gold less than 0
if(instance_exists(obj_inventory_chest) || chest_gold <= 0) instance_destroy()