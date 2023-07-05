extends Control

const BUILDOPTION = preload("res://UI_Components/Overview/BuildMenu/building_option.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_build_button_pressed():
	$LeftPanel/Build.show()
	$LeftPanel/Upgrade.hide()


func _on_upgrade_button_pressed():
	$LeftPanel/Build.hide()
	$LeftPanel/Upgrade.show()


func set_planet(new_planet : Planet):
	for N in $LeftPanel/Build/ScrollContainer/BuildOptionContainer.get_children():
		N.queue_free()
	
	for building in new_planet.Buildings:
		var new_option = BUILDOPTION.instantiate()
		new_option.BuildingResource = building
		
		new_option.Build.connect(Callable(new_planet,"build_request"))
		
		$LeftPanel/Build/ScrollContainer/BuildOptionContainer.add_child(new_option)
