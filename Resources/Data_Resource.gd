extends Global_Resource


func get_base_per_tick():
	var per_tick = Buildings.get_level("telescopes") * 1
	
	return per_tick
