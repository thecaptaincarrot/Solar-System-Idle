extends Resource
class_name Global_Resource

@export var name = "TEST"

var value = 0.0
var per_tick = 0.0

var limited = false
var per_tick_limit = 0.0

var global = true

@export var sink : Resource

func initialize():
	value = 0.0


func tick_update():
	value += get_per_tick()


func get_value():
	return value


func get_per_tick():
	var per_tick = get_base_per_tick()
	
	if limited:
		per_tick = per_tick_limit
		return per_tick
	
	if sink: #Another resource is draining this resource's value
		per_tick -= sink.get_base_per_tick()
		if per_tick < 0: #Sink per tick > Source base_per_tick
			if value + per_tick < 0:
				per_tick = -value
				sink.limit_per_tick(get_base_per_tick() + value)
			else:
				sink.unlimit_per_tick()
		else:
			sink.unlimit_per_tick()
	return per_tick


func get_base_per_tick():
	return 0.0


func limit_per_tick(amount):
	limited = true
	per_tick_limit = amount


func unlimit_per_tick():
	limited = false


func spend(amount):
	if value >= amount:
		value -= amount
		return true
	else:
		return false
