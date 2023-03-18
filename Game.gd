extends Control

#Resources
var Money = preload("res://Resources/Money.tres")
var Data = preload("res://Resources/Data.tres")
var Research = preload("res://Resources/Research.tres")
var Ore = preload("res://Resources/Ore.tres")
var Alloys = preload("res://Resources/Alloys.tres")
var Volatiles = preload("res://Resources/Volatiles.tres")
var Fuel = preload("res://Resources/Fuel.tres")


var ResourceList = [Money,Data,Research, Ore,Alloys,Volatiles,Fuel]


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


func hide_menus():
	for child in $LeftPanel.get_children():
		child.hide()
	$LeftPanel.show()
	$Design.hide()
	$Launch.hide()
	$Orbital.hide()
	$Overview.hide()
	$Research.hide()


func _on_tick_timer_timeout():
	days = days + 1
	
	
	emit_signal("Tick")
	
	for resource in ResourceList:
		resource.tick_update()
	
	update_date()
	


func _on_overview_nav_button_pressed():
	hide_menus()
	$Overview.show()
	$LeftPanel/OverviewLeft.show()
	pass # Replace with function body.


func _on_research_nav_button_pressed():
	hide_menus()
	$LeftPanel/ResearchLeft.show()
	$Research.show()
	pass # Replace with function body.


func _on_design_nav_button_pressed():
	hide_menus()
	$LeftPanel.hide()
	$Design.show()


func _on_launch_nav_button_pressed():
	hide_menus()
	$LeftPanel.hide()
	$Launch.show()
	$Launch._on_open()


func _on_orbital_nav_button_pressed():
	hide_menus()
	$LeftPanel.hide()
	$Orbital.show()
	$Orbital._on_open()
