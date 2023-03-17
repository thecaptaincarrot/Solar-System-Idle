extends Global_Resource

@export var MineResource : Building


func initialize():
	value = 1000000.0


func get_base_per_tick():
	per_tick = MineResource.get_level() * 1
	return per_tick

