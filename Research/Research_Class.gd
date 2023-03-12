extends Resource
class_name Research

@export var Title : String
@export var Description : String

@export var research_cost = 100.0
var current_research = 0.0 #Unused

@export var money_cost = 0.0

var researched = false

func research():
	researched = true
