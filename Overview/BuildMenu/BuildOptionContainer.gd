extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	for N in get_children():
		N.Build.connect(Callable(Buildings, "build"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


