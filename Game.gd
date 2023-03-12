extends Control

#Resources
var Money = preload("res://Resources/Money.tres")
var Data = preload("res://Resources/Data.tres")
var Research = preload("res://Resources/Research.tres")


var ResourceList = [Money,Data,Research]


var days = 0

signal Tick

# Called when the node enters the scene tree for the first time.
func _ready():
	for resource in ResourceList:
		resource.initialize()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_date():
	$OverviewPanel/NumDays.text = str(days)


func _on_tick_timer_timeout():
	days = days + 1
	
	print("Hola")
	emit_signal("Tick")
	
	for resource in ResourceList:
		resource.tick_update()
	
	update_date()
	
