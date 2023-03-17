@tool
extends TextureRect

@export var ModuleResource : BaseModule : set = set_module

signal Remove

# Called when the node enters the scene tree for the first time.
func _ready():
	texture = ModuleResource.texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_module(new_module):
	ModuleResource = new_module
	texture = ModuleResource.texture


func hide_button():
	$Button.hide()


func _on_button_pressed():
	emit_signal("Remove",self)
