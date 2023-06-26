extends Resource
class_name Data

@export var DataType = "DEFAULT"
@export var DataColor : Color

var value = 0.0


func get_value():
	return value


func add_value(amount):
	value += amount


func spend(amount):
	value -= amount
