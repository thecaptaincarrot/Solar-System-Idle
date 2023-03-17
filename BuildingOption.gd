@tool
extends Panel

#Prereqs
var unlocked = true

@export var BuildingResource : Building

#Resources
var Money = preload("res://Resources/Money.tres")

const BUY_INCREMENTS= [1,5,10,25]


var cost = 0.0

var buy_quantity = 1

signal Build

# Called when the node enters the scene tree for the first time.
func _ready():
	$Title.text = BuildingResource.name
	$Description.text = BuildingResource.description
	
	if !BuildingResource.get_unlocked():
		unlocked = false
		hide()
	
	update_cost()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		$Title.text = BuildingResource.name
		$Description.text = BuildingResource.description
	else:
		#Prereqs
		if BuildingResource.get_unlocked():
			unlocked = true
			show()
		
		
		#Buy Quantity
		var quantity_index = 0
		
		if Input.is_key_pressed(KEY_SHIFT):
			quantity_index += 1
		if Input.is_key_pressed(KEY_CTRL):
			quantity_index += 2
		
		buy_quantity = BUY_INCREMENTS[quantity_index]
		$BuyButton.text = "Buy " + str(buy_quantity)
		
		update_num()
		update_cost()


func update_cost():
	cost = BuildingResource.get_cost(buy_quantity)
	$CostContainer/Cost.text = str(cost)


func update_num():
	$HBoxContainer/Number.text = str(BuildingResource.level)

func _on_buy_button_pressed():
	
	if Money.spend(BuildingResource.get_cost(buy_quantity)):
		BuildingResource.build(buy_quantity)
	
	update_cost()
