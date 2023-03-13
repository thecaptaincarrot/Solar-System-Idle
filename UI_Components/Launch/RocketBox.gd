extends VBoxContainer

const LAUNCHOPTION = preload("res://UI_Components/Launch/launch_option.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func generate_options():
	for N in get_children():
		N.queue_free()
	
	for rocket in SavedRockets.get_rockets():
		var new_option = LAUNCHOPTION.instantiate()
		new_option.RocketResource = rocket
		add_child(new_option)
