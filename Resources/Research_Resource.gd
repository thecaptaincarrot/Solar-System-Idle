extends Global_Resource

func initialize():
	value = 0.0


func get_base_per_tick():
	per_tick = Buildings.get_level("labs") * 1
	
	return per_tick

