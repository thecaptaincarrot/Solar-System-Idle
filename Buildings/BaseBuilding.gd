@tool
extends Resource
class_name Building


var level = 0 #number of buildings built
var unlocked = false

@export var ResearchPrereqs : Array[ResearchTopic]
@export var BuildingPrereqs : Dictionary #Building Class : int number needed to unlock

@export var name = "BUILDINGNAME"
@export_multiline var description : String

#Placeholder for cost curves
@export_category("Cost Curve")
@export var multiplier = 1.0
@export var exponent_base = 1.0
@export var base_cost = 1.0

@export var base_resource_output = 0.0
var resource_output_multiplier = 1.0
var resourrce_output_adder = 0.0

var cost_multiplier = 1.0

func _ready():
	get_unlocked()


func get_unlocked():
	if unlocked:
		return unlocked
	
	for research in ResearchPrereqs:
		if !research.get_researched():
			return false
	
	for building_key in BuildingPrereqs:
		var number = building_key.get_number()
		if number < BuildingPrereqs[building_key]:
			return false
	
	unlocked = true
	return unlocked


func get_level():
	return level


func get_resource_output():
	return level * (base_resource_output + resourrce_output_adder) * resource_output_multiplier


func get_cost(multiplier):
	#recalculate cost
	var sum = 0
	
	for i in range(level, level + multiplier):
		sum += multiplier * (pow(exponent_base,i)) + base_cost
	
	var cost = snapped(sum * cost_multiplier,.01)
	
	return cost

func build(multiplier):
	level += multiplier


func upgrade(upgrade_dict):
	print(upgrade_dict)
	resource_output_multiplier += upgrade_dict["Multiplier"]
	resourrce_output_adder += upgrade_dict["Adder"]
	
	cost_multiplier *= upgrade_dict["CostMultiplier"]
	
	print(name,upgrade_dict, resource_output_multiplier, resourrce_output_adder, cost_multiplier)
