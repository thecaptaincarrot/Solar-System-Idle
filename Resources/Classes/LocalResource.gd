extends Resource
class_name LocalResource

@export var value = 0.0 #initialize with starting value

func get_value():
	return value


func add_value(amount):
	value += amount


func spend(amount):
	if value >= amount:
		value -= amount
		return true
	else:
		return false
