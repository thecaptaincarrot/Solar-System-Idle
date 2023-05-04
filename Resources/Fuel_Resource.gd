extends Global_Resource

@export var RefineryResource : Building

func initialize():
	value = 100000.0


func get_base_per_tick():
	per_tick = RefineryResource.get_resource_output()
	
	return per_tick
