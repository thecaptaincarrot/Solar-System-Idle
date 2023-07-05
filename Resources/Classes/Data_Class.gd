extends Resource
class_name Data

@export var type = "DEFAULT"
@export var color : Color

var value = 0.0


func get_value():
	return value


func add_value(amount):
	value += amount


func spend(amount):
	value -= amount
