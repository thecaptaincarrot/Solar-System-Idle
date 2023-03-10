extends Resource
class_name ResearchTopic

#Resource resources
var Money = preload("res://Resources/Money.tres")
var Research = preload("res://Resources/Research.tres")

@export var title : String
@export var description : String

@export var research_cost = 100.0
var current_research = 0.0 #Unused

@export var money_cost = 0.0

@export var research_prereqs : Array[ResearchTopic] = [] #Array of Resources that must be unlocked to show this one
@export var money_prereq = 0.0 #Amount of money that must be acquired before this unlocks for research

var researched = false
var unlocked = false

func research():
	if Research.spend(research_cost):
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
