extends Global_Resource

@export var TelescopeResource : Building

func get_base_per_tick():
	var per_tick = TelescopeResource.get_level() * 1
	
	return per_tick
