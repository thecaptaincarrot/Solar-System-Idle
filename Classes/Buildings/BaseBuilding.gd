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
@export var cost_curves : Array[CostCurve]

@export var multiplier = 1.0
@export var exponent_base = 1.0
@export var base_cost = 1.0

@export var base_resource_output = 0.0
var resource_output_multiplier = 1.0
var resourrce_output_adder = 0.0

var cost_multiplier = 1.0

signal OnBuild

func initialize():
	OnBuild.connect(on_build)


func on_tick():
	pass

func get_unlocked():
	if unlocked:
		return unlocked
	
	for research in ResearchPrereqs:
		if !research.get_researched():
			return false
	
	for building_key in BuildingPrereqs:
		var number = building_key.get_level()
		if number < BuildingPrereqs[building_key]:
			return false
	print(name, " unlcoked")
	unlocked = true
	return unlocked


func get_level():
	return level


func get_resource_output():
	return level * (base_resource_output + resourrce_output_adder) * resource_output_multiplier


func get_cost(buy_quantity): #returns a dictionary of resource keys per the cost curve
	var cost_dict = {}
	for curve in cost_curves:
		cost_dict[curve.resource] = curve.get_cost(level,buy_quantity)
	return cost_dict


func get_cost_curves():
	return cost_curves



func build(multiplier):
	level += multiplier
	emit_signal("OnBuild")


func on_build():
	pass


func upgrade(upgrade_dict):
	print(upgrade_dict)
	resource_output_multiplier += upgrade_dict["Multiplier"]
	resourrce_output_adder += upgrade_dict["Adder"]
	
	cost_multiplier *= upgrade_dict["CostMultiplier"]
	
	print(name,upgrade_dict, resource_output_multiplier, resourrce_output_adder, cost_multiplier)
