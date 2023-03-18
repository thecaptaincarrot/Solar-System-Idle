extends Global_Resource

@export var SmelterResource : Building

func initialize():
	value = 100000.0


func get_base_per_tick():
	per_tick = SmelterResource.get_level() * 1
	
	return per_tick
