extends PanelContainer

var connected_building : ConverterBuilding : set = set_building

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Number.text = "0"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if connected_building.get_level() <= 0 :
		hide()
	else:
		show()
	$VBoxContainer/HSlider.max_value = connected_building.get_level()


func set_building(new_building):
	connected_building = new_building
	$VBoxContainer/Title.text = new_building.name


func _on_h_slider_value_changed(value):
	$VBoxContainer/Number.text = str(value)
	
	connected_building.active_number = value


func on_build():
	print(connected_building.active_number)
	print(connected_building.get_level())
	if connected_building.active_number >= connected_building.get_level() - 1:
		print("holla?")
		connected_building.active_number = connected_building.get_level()
		$VBoxContainer/HSlider.value = connected_building.get_level()
