extends Resource
class_name Upgrade

@export var name = "DEFAULT"
@export_multiline var description : String

@export var ResearchPrereqs : Array[ResearchTopic]
@export var BuildingPrereqs : Dictionary #Building Class : int number needed to unlock

@export var cost = {"Money" : 0, "Ore" : 0, "Alloy" : 0 , "Volatiles" : 0, "Fuel" : 0}

var unlocked = false
var bought = false

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


func get_bought():
	return bought


func buy():
	bought = true
