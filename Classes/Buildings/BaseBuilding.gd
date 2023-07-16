@tool
extends Resource
class_name Building

@export var name = "BUILDINGNAME"
@export_multiline var description : String

var level = 0 #number of buildings built
var unlocked = false

@export var ResearchPrereqs : Array[ResearchTopic]
@export var BuildingPrereqs : Dictionary #Building Class : int number needed to unlock


#Placeholder for cost curves
@export var cost_curves : Array[CostCurve]

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
