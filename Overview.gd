extends Control


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
