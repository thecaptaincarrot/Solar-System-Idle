extends Panel

var money = preload("res://Resources/Money.tres")

var current_planet = null


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MoneyContainer.set_value(money.get_value())
	#Should I do this every frame? Sure, why not
	if current_planet:
		for container in $LocalResources.get_children():
			var resource = container.resource
			container.set_value(current_planet.get_resource_value(resource))
