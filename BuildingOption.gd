extends Panel

const COSTCONTAINER = preload("res://Overview/BuildMenu/cost_container.tscn")

#Prereqs
var unlocked = true

@export var BuildingResource : Building

#Resources
var Money = preload("res://Resources/Money.tres")

const BUY_INCREMENTS= [1,5,10,25]

var buy_quantity = 1

signal Build

# Called when the node enters the scene tree for the first time.
func _ready():
	$Title.text = BuildingResource.name
	$Description.text = BuildingResource.description
	update_cost()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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
	for N in $AllCosts.get_children():
		N.queue_free()
	var costs = BuildingResource.get_cost(buy_quantity)
	
	for cost in costs.keys():
		var new_cost = COSTCONTAINER.instantiate()
		new_cost.set_resource_name(cost)
		new_cost.set_value(costs[cost])
		$AllCosts.add_child(new_cost)
	
	custom_minimum_size.y = 160 + (20 * $AllCosts.get_child_count())


func update_num():
	$HBoxContainer/Number.text = str(BuildingResource.level)


func _on_buy_button_pressed():
	BuildingResource.build(buy_quantity)
	
	update_cost()
