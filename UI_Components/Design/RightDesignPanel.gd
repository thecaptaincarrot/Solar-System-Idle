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
	var total_cost = {}
	
	for module in modules_list:
		total_mass += module.mass
		for cost_key in module.costs.keys():
			if total_cost.keys().has(cost_key):
				total_cost[cost_key] += module.costs[cost_key]
			else:
				total_cost[cost_key] = module.costs[cost_key]
	
	#Set our labels
	$MarginContainer/VBoxContainer/MassBox/Mass.text = str(total_mass)
	#Costs
	for N in $MarginContainer/VBoxContainer/CostContainer.get_children():
		if N.name != "COST":
			N.queue_free()
	
	for cost_key in total_cost.keys():
		if total_cost[cost_key] > 0:
			var new_label = Label.new()
			new_label.text = cost_key + ": " + str(total_cost[cost_key])
			$MarginContainer/VBoxContainer/CostContainer.add_child(new_label)


func _on_h_slider_value_changed(value):
	$MarginContainer/VBoxContainer/TTDBox/TimeToDestination.text = str(6.0 - value)
	$MarginContainer/VBoxContainer/ConsumptionBox/FuelNeeded.text = str(10.0 + 10.0 * value)
