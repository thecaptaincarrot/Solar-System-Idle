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


func get_cost_dict():
	var cost_dict = {}
	for module in modules:
		for cost_key in module.costs.keys():
			if module.costs[cost_key] > 0:
				if cost_dict.keys().has(cost_key):
					cost_dict[cost_key] += module.costs[cost_key]
				else:
					cost_dict[cost_key] = module.costs[cost_key]
	print(cost_dict)
	return cost_dict


func get_thrust():
	var sum = 0.0

	return sum


func get_fuel_consumption():
	var sum = 0.0
	return sum


func get_money_per_day():
	var sum = 0.0

	return sum
