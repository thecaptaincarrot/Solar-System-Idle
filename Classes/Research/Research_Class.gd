extends Resource
class_name ResearchTopic

#Resource resources
var TerrestrialData : Data = preload("res://Resources/Data/TerrestrialData.tres")
var OrbitalData : Data = preload("res://Resources/Data/OrbitalData.tres")

@export var title : String
@export_multiline var description : String

@export var temp_research_cost = {
							"TerrestrialData" : 0.0,
							"OrbitalData" : 0.0,
							}


var research_cost = {}
var research_spent = {}

@export_category("Prerequisites")
@export var research_prereqs : Array[ResearchTopic] = [] #Array of Resources that must be unlocked to show this one
@export var planet_prereqs : Array[Planet] = []
@export var building_prereqs = {}

var researched = false
var unlocked = false

func initialize():
	for data_type in temp_research_cost.keys():
		var data_key = get(data_type)
		research_cost[data_key] = temp_research_cost[data_type]
		research_spent[data_key] = 0
	print(research_cost)


func research():
	researched = true


func get_researched():
	return researched


func get_unlocked():
	var to_unlock = true
	for prereq in research_prereqs:
		if !prereq.get_researched():
			to_unlock = false
	if to_unlock:
		unlocked = true
	
	return unlocked
