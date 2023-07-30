extends Control

const MODULEOPTIONS = preload("res://UI_Components/Design/module_option.tscn")

var current_rocket = []

# Called when the node enters the scene tree for the first time.
func _ready():
	#Load modules from module folder
	#Must also load from sub folders
	#Create a new option for each one, but it should remain hidden unless researched
	var modules = []
	#1. load research from research folder
	var path = "res://Modules/"
	var modules_dir = DirAccess.open(path)
	if modules_dir:
		modules_dir.list_dir_begin()
		var filename = modules_dir.get_next()
		while filename != "":
			if modules_dir.current_is_dir():
				var sub_path = path + filename + "/"
				var sub_module_dir = DirAccess.open(sub_path)
				var sub_module_files = sub_module_dir.get_files()
				for file in sub_module_files:
					if file.contains(".import"):
						continue
					var potential_module = load(sub_path+file)
					if potential_module is Module:
						print("Found module ", sub_path+file)
						modules.append(potential_module)
					else:
						print(file + " is not a module")
					filename = sub_module_dir.get_next()
			else:
				var potential_module = load(path+filename)
				if potential_module is ResearchTopic:
					modules.append(potential_module)
			filename = modules_dir.get_next()
	
	#load module options for all loaded modules
	for module in modules:
		#TODO: Parse different categories into their own slots
		var new_option = MODULEOPTIONS.instantiate()
		new_option.ModuleResource = module
		
		$LeftPanel/DesignLeft/ScrollContainer/ModuleContainer.add_child(new_option)
		
		pass
	
	for N in $LeftPanel/DesignLeft/ScrollContainer/ModuleContainer.get_children():
		N.AddToRocket.connect(add_to_rocket)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_to_rocket(module_resource : Module):
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
