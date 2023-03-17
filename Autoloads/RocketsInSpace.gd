extends Node


var OrbitingRockets = []

signal RocketLaunch


func rocket_launched(RocketResource):
	OrbitingRockets.append(RocketResource)
	
	emit_signal("RocketLaunch",RocketResource)
	pass


func get_money_per_day():
	var sum = 0.0
	for rocket in OrbitingRockets:
		sum += rocket.get_money_per_day()
	
	return sum
