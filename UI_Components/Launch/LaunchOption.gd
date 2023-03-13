extends Panel

var RocketResource : Rocket : set = set_rocket

signal AddToPad

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func set_rocket(new_rocket):
	RocketResource = new_rocket
	$Title.text = new_rocket.name


func _on_launch_pressed():
	emit_signal("AddToPad",RocketResource)
