extends Panel

var current_planet = null

var data = load("res://Resources/Data/TerrestrialData.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Should I do this every frame? Sure, why not
	if current_planet:
		for container in $LocalResources.get_children():
			var resource = container.resource
			container.set_value(current_planet.get_resource_value(resource))
			
			container.set_pertick(current_planet.get_pertick(resource))
	var money_pertick = 0.0
	
	$DataContainer.set_value(data.get_value())
