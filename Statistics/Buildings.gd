@tool
extends Node


var lobbying_offices = 0
var mines = 0
var smelters = 0 
var oil_wells = 0
var refineries = 0
var telescopes = 0
var labs = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func get_level(ID):
	return get(ID)


func build(ID, quantity):
	var current_level = get(ID)
	set(ID, current_level + quantity)
