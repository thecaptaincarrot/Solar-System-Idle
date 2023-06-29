extends HBoxContainer

@export var resource = ""
@export var identity = "DEFAULT"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Label.text != identity:
		$Label.text = identity + ':'
	


func _update():
	pass


func set_value(new_value):
	$Value.text = str(new_value)


func set_pertick(new_pertick):
	if new_pertick >= 0:
		$PlusMinus.text = "+"
	else:
		$PlusMinus.text = "-"
	
	$PerDay.text = str(abs(new_pertick))

#TODO: Tooltip defs
