extends Global_Resource


func initialize():
	value = 10.0


func get_base_per_tick():
	per_tick = Buildings.get_level("lobbying_offices") * 1
	
	return per_tick
