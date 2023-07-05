@tool
extends Resource
class_name Upgrade

#Building Definitions
@export var name = "DEFAULT"
@export_multiline var description : String

@export var ResearchPrereqs : Array[ResearchTopic]
@export var BuildingPrereqs : Dictionary #Building Class : int number needed to unlock

@export var cost = {"ore" : 0,
					"alloy" : 0,
					"volatiles" : 0,
					"fuel" : 0,
					
					}

var unlocked = false
var bought = false


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
	unlocked = true
	return unlocked


func get_bought():
	return bought


func buy():
	bought = true
