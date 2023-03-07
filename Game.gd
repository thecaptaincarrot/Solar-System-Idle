extends Control

var days = 0

signal Tick

# Called when the node enters the scene tree for the first time.
func _ready():
	Tick.connect(Callable(Resources,"update_tick"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	update_resources()


func update_date():
	$OverviewPanel/NumDays.text = str(days)


func update_resources():
	#money
	$OverviewPanel/MoneyContainer/Money.text = str(Resources.money)
	$OverviewPanel/MoneyContainer/MoneyPerDay.text = str(snapped(Resources.get_money_per_day(),.01))
	
	$OverviewPanel/DataContainer/Data.text = str(Resources.data)
	$OverviewPanel/DataContainer/DataPerDay.text = str(snapped(Resources.get_data_per_day(),.01))
	
	


func _on_tick_timer_timeout():
	days = days + 1
	
	emit_signal("Tick")
	
	update_date()
	
