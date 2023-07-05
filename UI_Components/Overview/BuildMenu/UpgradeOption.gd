extends Panel

const COSTCONTAINER = preload("res://UI_Components/Overview/BuildMenu/cost_container.tscn")

#Prereqs
var unlocked = true

@export var UpgradeResource : Upgrade

#Resources
signal Buy

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	$Title.text = UpgradeResource.name
	$Description.text = UpgradeResource.description
	update_cost()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Prereqs
	if UpgradeResource.get_unlocked():
		unlocked = true
		show()
	
	if UpgradeResource.bought:
		#Archive?
		#PRobably don't do this every second
		hide()
	
	update_cost()


func update_cost():
	for N in $AllCosts.get_children():
		N.queue_free()
	var costs = UpgradeResource.get_cost()
	
	for cost in costs.keys():
		if costs[cost] <= 0: #Skip costs less than 0
			continue
		var new_cost = COSTCONTAINER.instantiate()
		new_cost.set_resource_name(cost)
		new_cost.set_value(costs[cost])
		$AllCosts.add_child(new_cost)
	
	custom_minimum_size.y = 124 + (16 * $AllCosts.get_child_count())


func _on_buy_button_pressed():
	emit_signal("Buy", UpgradeResource)
