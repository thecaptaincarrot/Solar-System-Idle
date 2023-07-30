extends Panel

var ModuleResource : Module : set = module_changed

signal AddToRocket


# Called when the node enters the scene tree for the first time.
func _ready():
	update_fields()
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !is_visible_in_tree():
		if ModuleResource.get_unlocked():
			show()


func module_changed(new_module):
	ModuleResource = new_module
	if is_inside_tree():
		update_fields()


func update_fields():
	$ModuleTexture.texture = ModuleResource.texture
	$Title.text = ModuleResource.name
	$Description.text = ModuleResource.description
	
	for cost_key in ModuleResource.costs.keys():
		if ModuleResource.costs[cost_key] > 0:
			var new_label = Label.new()
			new_label.text = cost_key + ": " + str(ModuleResource.costs[cost_key])
			$VBoxContainer.add_child(new_label)


func _on_button_pressed():
	emit_signal("AddToRocket",ModuleResource)

