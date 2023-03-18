extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_h_slider_value_changed(value):
	$ResearchOptionContainer/HBoxContainer/CostPerDay.text = str(10 * pow(2,value))
	$ResearchOptionContainer/HBoxContainer2/ResearchPerDay.text = str(1 + value)
