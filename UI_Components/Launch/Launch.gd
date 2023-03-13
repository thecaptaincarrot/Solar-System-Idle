extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_open():
	$LeftPanel/MarginContainer/ScrollContainer/RocketBox.generate_options()
	
	for N in $LeftPanel/MarginContainer/ScrollContainer/RocketBox.get_children():
		N.AddToPad.connect(add_to_pad)


func add_to_pad(RocketResource):
	pass
