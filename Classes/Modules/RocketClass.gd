extends Resource
class_name Rocket

@export var name = "Rocket"
@export var modules = []


func print_modules():
	print(name)
	for module in modules:
		print(module.name)


func get_modules():
	return modules


func get_mass():
	var sum = 0.0
	for module in modules:
		sum += module.mass
	
	return sum


func get_money_cost():
	var sum = 0.0
	for module in modules:
		sum += module.money_cost
	
	return sum


func get_ore_cost():
	var sum = 0.0
	for module in modules:
		sum += module.ore_cost
	
	return sum


func get_thrust():
	var sum = 0.0

	return sum


func get_fuel_consumption():
	var sum = 0.0
	return sum


func get_money_per_day():
	var sum = 0.0

	return sum
