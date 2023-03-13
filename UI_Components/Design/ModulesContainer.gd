extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	update_module_positions()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_module_positions():
	for child in get_children():
		child.set_anchors_and_offsets_preset(7)
		child.position.y +=  child.get_index()*-256
		print(child.name, " ", child.get_index())


func get_module_resources():
	var modules_list = []
	for child in get_children():
		modules_list.append(child.ModuleResource)
	
	return modules_list
