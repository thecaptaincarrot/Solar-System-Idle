extends Panel


# Called when the node enters the scene tree for the first time.
func _ready():
	_on_rocket_builder_rocket_changed([])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_rocket_builder_rocket_changed(modules_list):
	print(modules_list)
	var total_mass = 0
	var total_thrust = 0
	var total_mpd = 0 #Money per day
	var total_money_cost = 0 #money
	var total_ore_cost = 0
	
	for module in modules_list:
		total_mass += module.mass
		if module is ThrustModule:
			total_thrust += module.thrust
		if module is UtilModule:
			total_mpd += module.money_per_day #Money per day
		total_money_cost += module.money_cost #money
		total_ore_cost += module.ore_cost
	
	#Set our labels
	$MarginContainer/VBoxContainer/MassBox/Mass.text = str(total_mass)
	$MarginContainer/VBoxContainer/ThrustBox/Thrust.text = str(total_thrust)
	$MarginContainer/VBoxContainer/MPDBox/MoneyPerDay.text = str(total_mpd)
	$MarginContainer/VBoxContainer/MoneyBox/MoneyCost.text = str(total_money_cost)
	$MarginContainer/VBoxContainer/OreBox/OreCost.text = str(total_ore_cost)


func _on_h_slider_value_changed(value):
	$MarginContainer/VBoxContainer/TTDBox/TimeToDestination.text = str(6.0 - value)
	$MarginContainer/VBoxContainer/ConsumptionBox/FuelNeeded.text = str(10.0 + 10.0 * value)
