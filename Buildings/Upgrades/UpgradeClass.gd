@tool
extends Resource
class_name Upgrade

#Building Definitions

var AffectedBuilding : Building
var AllBuildings = false

@export var name = "DEFAULT"
@export_multiline var description : String

@export var ResearchPrereqs : Array[ResearchTopic]
@export var BuildingPrereqs : Dictionary #Building Class : int number needed to unlock

@export_group("Cost", "cost_")
@export var cost_money = 0
@export var cost_ore = 0
@export var cost_alloy = 0
@export var cost_volatiles = 0
@export var cost_fuel = 0

@export_group("Upgrades")
@export var adder = 0.0
@export var multiplier = 0.0
@export var cost_multiplier = 1.0

var unlocked = false
var bought = false


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
	pass
	bought = true


func get_cost():
	return {"money": cost_money, "ore" : cost_ore, "alloy" : cost_alloy,\
	"volatiles" : cost_volatiles,"fuel" : cost_fuel}
