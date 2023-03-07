@tool
extends Node

var money = 2.0 #In Millions
var data = 0.0

var earth_resources = {"ore": 0.0}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_tick():
	update_money()
	update_data()


func update_money():
	money += get_money_per_day()


func get_money_per_day():
	return Buildings.get_level("lobbying_offices") * 1


func update_data():
	data += get_data_per_day()


func get_data_per_day():
	return Buildings.get_level("telescopes") * 1
