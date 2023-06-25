@tool
extends HBoxContainer

@export var resource = ""

@export var identity = "DEFAULT"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Label.text != identity:
		$Label.text = identity
	
	if !Engine.is_editor_hint():
		pass


func _update():
	pass


func set_value(new_value):
	$Value.text = str(new_value)

#TODO: Tooltip defs
