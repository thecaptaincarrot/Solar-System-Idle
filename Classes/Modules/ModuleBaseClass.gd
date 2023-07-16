extends Resource
class_name BaseModule

@export var name = "DEFAULT NAME"
@export var description = "DEFAULT DESCRIPTION"

@export var research_prereqs : Array[ResearchTopic]

@export var costs = {
					"ore" : 0,
					"alloy" : 0,
					"hydrocarbons" : 0,
					"fuel" : 0,
					"electronics" : 0
				}

@export var mass = 0.0 #kg
@export var aux_slots = 0

@export var texture : Texture2D
