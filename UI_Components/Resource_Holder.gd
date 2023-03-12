@tool
extends HBoxContainer

@export var resource : Resource

@export var identity = "DEFAULT"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Label.text != identity:
		$Label.text = identity
	
	if !Engine.is_editor_hint():
		_update()


func _update():
	if resource:
		$Value.text = str(resource.get_value())
		
		$PerDay.text = str(resource.get_per_tick())

#TODO: Tooltip defs
