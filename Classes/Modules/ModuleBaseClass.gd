extends Resource
class_name Module

@export var name = "DEFAULT NAME"
@export var description = "DEFAULT DESCRIPTION"

@export_enum("Basic") var category : String

@export var research_prereqs : Array[ResearchTopic]

@export var costs = { #Add as needed
					"ore" : 0,
					"alloy" : 0,
					"hydrocarbons" : 0,
					"fuel" : 0,
					"electronics" : 0
				}

@export var mass = 0.0 #kg
@export var aux_slots = 0

@export var texture : Texture2D

func get_unlocked():
	var unlocked = true
	for research in research_prereqs:
		if !research.get_researched():
			unlocked = false
	return unlocked
