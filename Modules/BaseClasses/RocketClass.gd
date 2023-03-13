extends Resource
class_name Rocket

@export var name = "Rocket"
@export var modules = []


func print_modules():
	print(name)
	for module in modules:
		print(module.name)
