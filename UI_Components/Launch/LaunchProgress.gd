extends ProgressBar

signal LaunchComplete

var running = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if running:
		value += delta
	
	if value >= max_value:
		emit_signal("LaunchComplete")
		hide()
		value = 0.0
		running = false
