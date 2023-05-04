extends Global_Resource

@export var WellResource : Building

func initialize():
	value = 100000.0


func get_base_per_tick():
	per_tick = WellResource.get_resource_output() * 1
	
	return per_tick
