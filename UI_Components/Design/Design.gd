extends Control

var current_rocket = []

# Called when the node enters the scene tree for the first time.
func _ready():
	for N in $LeftPanel/DesignLeft/ScrollContainer/ModuleContainer.get_children():
		N.AddToRocket.connect(add_to_rocket)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_to_rocket(module_resource : BaseModule):
	print(module_resource.name)
	
	$ScrollContainer/RocketContainer/RocketBuilder.add_to_rocket(module_resource)
	
	pass


func _on_save_design_pressed():
	var rocket_name = $RightPanel/MarginContainer/VBoxContainer/RocketNameEdit.text
	if rocket_name == "":
		rocket_name = "Rocket"
	
	var module_list = $ScrollContainer/RocketContainer/RocketBuilder/ModulesContainer.get_module_resources()
	
	SavedRockets.save_rocket(rocket_name,module_list)


func _on_option_button_item_selected(index):
	if index == 0:
		$RightPanel/MarginContainer/VBoxContainer/Insufficient.hide()
	else:
		$RightPanel/MarginContainer/VBoxContainer/Insufficient.show()
