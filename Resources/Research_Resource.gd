extends Global_Resource

@export var LabResource : Building


func initialize():
	value = 0.0


func get_base_per_tick():
	per_tick = LabResource.get_level() * 1
	
	return per_tick

