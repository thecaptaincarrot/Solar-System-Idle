extends Building
class_name ConverterBuilding

@export var input_resources = {
								"ore": 0,
								"alloy" : 0,
								"hydrocarbons" : 0,
								"electronics" : 0,
								"fuel" : 0,
								}

@export var output_resources = {
								"ore": 0,
								"alloy" : 0,
								"hydrocarbons" : 0,
								"electronics" : 0,
								"fuel" : 0,
								}

var active_number = 0

signal convert_resource



func on_tick():
	pass
	emit_signal("convert_resource")


func get_active():
	return active_number


func on_build():
	pass
