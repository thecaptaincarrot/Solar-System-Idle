@tool
extends Panel

#Prereqs
var unlocked = true

@export var UpgradeResource : Upgrade

#Resources
var Money = preload("res://Resources/Money.tres")
var Ore = preload("res://Resources/Ore.tres")
var Alloy = preload("res://Resources/Alloys.tres")
var Volatiles = preload("res://Resources/Volatiles.tres")
var Fuel = preload("res://Resources/Fuel.tres")

var cost = 0.0

var buy_quantity = 1

signal Build

# Called when the node enters the scene tree for the first time.
func _ready():
	$Title.text = UpgradeResource.name
	$Description.text = UpgradeResource.description
	
	if !UpgradeResource.get_unlocked():
		unlocked = false
		hide()
	
	update_cost()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint() and UpgradeResource:
		$Title.text = UpgradeResource.name
		$Description.text = UpgradeResource.description
	else:
		#Prereqs
		if UpgradeResource.get_unlocked():
			unlocked = true
			show()


func update_cost():
	cost = UpgradeResource.get_cost()
	if cost["money"] != 0:
		$VBoxContainer/MoneyCostContainer/Cost.text = str(cost["money"])
	else:
		$VBoxContainer/MoneyCostContainer.hide()
	
	if cost["ore"] != 0:
		$VBoxContainer/OreCostContainer/Cost.text = str(cost["ore"])
	else:
		$VBoxContainer/OreCostContainer.hide()
	
	if cost["alloy"] != 0:
		$VBoxContainer/AlloyCostContainer/Cost.text = str(cost["alloy"])
	else:
		$VBoxContainer/AlloyCostContainer.hide()
	
	if cost["volatiles"] != 0:
		$VBoxContainer/VolatileCostContainer/Cost.text = str(cost["volatiles"])
	else:
		$VBoxContainer/VolatileCostContainer.hide()
	
	if cost["fuel"] != 0:
		$VBoxContainer/FuelCostContainer/Cost.text = str(cost["fuel"])
	else:
		$VBoxContainer/FuelCostContainer.hide()


func update_num():
	$HBoxContainer/Number.text = str(UpgradeResource.level)

func _on_buy_button_pressed():
	#Check Cost
	if cost["money"] <= Money.value and\
		cost["ore"] <= Ore.value and\
		cost["alloy"] <= Alloy.value and \
		cost["volatiles"] <= Volatiles.value and\
		cost["fuel"] <= Fuel.value:
		
		Money.spend(cost["money"])
		Ore.spend(cost["ore"])
		Alloy.spend(cost["alloy"])
		Fuel.spend(cost["fuel"])
		Volatiles.spend(cost["volatiles"])
		
		UpgradeResource.buy()
		
		$BuyButton.disabled = true
		$BuyButton.text = "Bought"
		
		update_cost()
