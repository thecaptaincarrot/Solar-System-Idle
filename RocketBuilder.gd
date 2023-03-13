extends Control

const MODULEPIECE = preload("res://UI_Components/Design/module_piece.tscn")


signal RocketChanged

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_to_rocket(ModuleResource):
	if get_num_modules() >= GlobalStats.max_ship_modules:
		return
	
	var new_module = MODULEPIECE.instantiate()
	new_module.ModuleResource = ModuleResource
	$ModulesContainer.add_child(new_module)
	
	$ModulesContainer.update_module_positions()
	
	new_module.Remove.connect(remove_module)
	
	emit_signal("RocketChanged", $ModulesContainer.get_module_resources())


func remove_module(module_to_remove):
	$ModulesContainer.remove_child(module_to_remove)
	module_to_remove.queue_free()
	
	$ModulesContainer.update_module_positions()
	emit_signal("RocketChanged", $ModulesContainer.get_module_resources())


func get_num_modules():
	return len($ModulesContainer.get_children())

