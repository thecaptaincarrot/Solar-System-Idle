extends Control

#Resources

var current_planet : Planet : set = set_planet

var days = 0

signal Tick


# Called when the node enters the scene tree for the first time.
func _ready():
	#tick signal connectiosn
	$TickTimer.timeout.connect(Callable(PlanetHandler, "_on_tick"))
	
	set_planet(PlanetHandler.earth)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update_date():
	$TopPanel/NumDays.text = str(days)


func hide_menus():
	$Design.hide()
	$Launch.hide()
	$Orbital.hide()
	$Overview.hide()
	$Research.hide()


func set_planet(new_planet):
	current_planet = new_planet
	$TopPanel.current_planet = new_planet
	$Overview.set_planet(new_planet)


func _on_tick_timer_timeout():
	days = days + 1
	
	
	emit_signal("Tick")

	update_date()
	$Research.tick()


func _on_overview_nav_button_pressed():
	hide_menus()
	$Overview.show()


func _on_research_nav_button_pressed():
	hide_menus()
	$Research.show()


func _on_design_nav_button_pressed():
	hide_menus()
	$Design.show()


func _on_launch_nav_button_pressed():
	hide_menus()
	$Launch.show()
	$Launch._on_open()


func _on_orbital_nav_button_pressed():
	hide_menus()
	$Orbital.show()
	$Orbital._on_open()


func _on_upgradetest_pressed():
	var upgrade = load("res://Buildings/Upgrades/tESTrESOURCES.tres")
	upgrade.buy()
