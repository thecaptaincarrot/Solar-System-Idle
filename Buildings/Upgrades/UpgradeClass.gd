@tool
extends Resource
class_name Upgrade

#Building Definitions
var LobbyingOffice = preload("res://Buildings/LobbyingOffice.tres")
var Mine = preload("res://Buildings/Mines.tres")
var OilWell = preload("res://Buildings/OilWell.tres")
var Refinery = preload("res://Buildings/Refinery.tres")
var Smelter = preload("res://Buildings/Smelter.tres")
var Telescope = preload("res://Buildings/Telescope.tres")


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
@export_subgroup("LobbyingOffice")
@export var LobbyingOfficeUpgrades = {"Source": preload("res://Buildings/LobbyingOffice.tres"), "Adder" : 0.0 , "Multiplier" : 0.0, "CostMultiplier" : 1.0}
@export var MineUpgrades = {"Source": preload("res://Buildings/Mines.tres"),"Adder" : 0.0 , "Multiplier" : 0.0, "CostMultiplier" : 1.0}
@export var OilWellUpgrades = {"Source": preload("res://Buildings/OilWell.tres"),"Adder" : 0.0 , "Multiplier" : 0.0, "CostMultiplier" : 1.0}
@export var RefineryUpgrades = {"Source": preload("res://Buildings/Refinery.tres"),"Adder" : 0.0 , "Multiplier" : 0.0, "CostMultiplier" : 1.0}
@export var SmelterUpgrades = {"Source": preload("res://Buildings/Smelter.tres"),"Adder" : 0.0 , "Multiplier" : 0.0, "CostMultiplier" : 1.0}
@export var TelescopeUpgrades = {"Source": preload("res://Buildings/Telescope.tres"),"Adder" : 0.0 , "Multiplier" : 0.0, "CostMultiplier" : 1.0}



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
	var all_upgrades = [LobbyingOfficeUpgrades,MineUpgrades,OilWellUpgrades,\
					RefineryUpgrades,SmelterUpgrades,TelescopeUpgrades]
	bought = true
	for upgrade_dict in all_upgrades:
		var upgrade_building = upgrade_dict["Source"]
		upgrade_building.upgrade(upgrade_dict)
		print(upgrade_building)
	print(LobbyingOfficeUpgrades)
