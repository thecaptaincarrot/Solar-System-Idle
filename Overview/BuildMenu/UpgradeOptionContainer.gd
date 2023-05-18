@tool
extends Panel

#Prereqs
var unlocked = true

@export var UpgradeResource : Upgrade

#Resources
var Money = preload("res://Resources/Money.tres")

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
	cost = UpgradeResource.get_cost(buy_quantity)
	$CostContainer/Cost.text = str(cost)


func update_num():
	$HBoxContainer/Number.text = str(UpgradeResource.level)

func _on_buy_button_pressed():
	
	if Money.spend(UpgradeResource.get_cost(buy_quantity)):
		UpgradeResource.build(buy_quantity)
	
	update_cost()
