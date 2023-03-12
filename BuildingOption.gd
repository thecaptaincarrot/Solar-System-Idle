@tool
extends Panel

#Resources
var Money = preload("res://Resources/Money.tres")

const BUY_INCREMENTS= [1,5,10,25]

@export var building_id = "lobbying_offices"

@export var title = "Lobbying Office"
@export var description = "Generates Income"

var cost = 0.0

@export var multiplier = 10.0
@export var exponent_base = 2.0
@export var base_cost = 0.0 #In millions

var buy_quantity = 1

signal Build

# Called when the node enters the scene tree for the first time.
func _ready():
	$Title.text = title
	$Description.text = description
	update_cost()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Engine.is_editor_hint():
		$Title.text = title
		$Description.text = description
	
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



func get_cost():
	var level = Buildings.get_level(building_id)
	
	#recalculate cost
	var sum = 0
	
	for i in range(level, level + buy_quantity):
		sum += multiplier * (pow(exponent_base,i)) + base_cost
	
	cost = snapped(sum,.01)
	
	return cost


func update_cost():
	get_cost()
	$CostContainer/Cost.text = str(cost)


func update_num():
	var level = Buildings.get_level(building_id)
	$HBoxContainer/Number.text = str(level)

func _on_buy_button_pressed():
	
	if Money.spend(get_cost()):
		Buildings.build(building_id, buy_quantity)
	
	update_cost()
