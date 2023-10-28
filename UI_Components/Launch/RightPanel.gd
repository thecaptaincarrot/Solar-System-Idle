extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func clear_fields():
	$MarginContainer/VBoxContainer/RocketName.text = "No Rocket"
	$MarginContainer/VBoxContainer/MassBox/Mass.text = ""
	$MarginContainer/VBoxContainer/ThrustBox/Thrust.text = ""
	$MarginContainer/VBoxContainer/MPDBox/MoneyPerDay.text = ""
	$MarginContainer/VBoxContainer/MoneyBox/MoneyCost.text = ""
	$MarginContainer/VBoxContainer/OreBox/OreCost.text = ""


func update_fields(RocketResource):
	$MarginContainer/VBoxContainer/RocketName.text = RocketResource.name
	$MarginContainer/VBoxContainer/CostBox/MoneyCost.text = str(RocketResource.get_cost_dict())

