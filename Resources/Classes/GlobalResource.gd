extends Resource
class_name GlobalResource

@export var name = "TEST"

@export var value = 0.0 #intialize value


func get_value():
	return value


func spend(amount):
	if value >= amount:
		value -= amount
		return true
	else:
		return false
