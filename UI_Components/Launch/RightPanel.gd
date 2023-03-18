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
	
	$MarginContainer/VBoxContainer/MassBox/Mass.text = str(RocketResource.get_mass())
	
	$MarginContainer/VBoxContainer/ThrustBox/Thrust.text = str(RocketResource.get_thrust())
	
	$MarginContainer/VBoxContainer/MPDBox/MoneyPerDay.text = str(RocketResource.get_money_per_day())
	
	$MarginContainer/VBoxContainer/MoneyBox/MoneyCost.text =str(RocketResource.get_money_cost())
	
	$MarginContainer/VBoxContainer/OreBox/OreCost.text = str(RocketResource.get_ore_cost())

