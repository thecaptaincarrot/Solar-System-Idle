extends Node

var all_rockets = []


func save_rocket(rocket_name, module_list):
	var new_rocket = Rocket.new()
	
	new_rocket.name = rocket_name
	new_rocket.modules = module_list
	
	all_rockets.append(new_rocket)
	print_rockets()


func print_rockets():
	for rocket in all_rockets:
		rocket.print_modules()


func get_rockets():
	return all_rockets
