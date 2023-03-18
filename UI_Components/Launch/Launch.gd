extends Control

var Money = preload("res://Resources/Money.tres")
var Ore = preload("res://Resources/Ore.tres")

var StagedRocket : Rocket

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_can_launch():
		$RightPanel/Launch.disabled = false
		$RightPanel/Launch/NotEnoughResources.hide()
	else:
		$RightPanel/Launch.disabled = true
		$RightPanel/Launch/NotEnoughResources.show()


func _on_open():
	$LeftPanel/MarginContainer/ScrollContainer/RocketBox.generate_options()
	
	for N in $LeftPanel/MarginContainer/ScrollContainer/RocketBox.get_children():
		N.AddToPad.connect(add_to_pad)


func add_to_pad(RocketResource):
	#Remove Currently Loaded Rocket
	$ScrollContainer/RocketContainer/RocketBuilder.clear_modules()
	
	StagedRocket = RocketResource
	
	$RightPanel.update_fields(RocketResource)
	
	#Add modules from rocket to the rocket builder
	for module in RocketResource.get_modules():
		$ScrollContainer/RocketContainer/RocketBuilder.add_to_rocket(module, true)


func get_can_launch():
	if StagedRocket == null:
		return false
	
	if Money.get_value() >= StagedRocket.get_money_cost() and Ore.get_value() >= StagedRocket.get_ore_cost():
		return true
	else:
		return false

func _on_launch_pressed():
	
	if Money.get_value() >= StagedRocket.get_money_cost() and Ore.get_value() >= StagedRocket.get_ore_cost():
		Money.spend(StagedRocket.get_money_cost())
		Ore.spend(StagedRocket.get_ore_cost())
		
		RocketsInSpace.rocket_launched(StagedRocket)
		
		$LaunchProgress.show()
		$LaunchProgress.running = true
		
