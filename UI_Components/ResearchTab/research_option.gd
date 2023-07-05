extends Panel

const DATABAR = preload("res://UI_Components/ResearchTab/data_progress_bar.tscn")

@export var research_resource : ResearchTopic : set = resource_set


var research_overview = null

var active = false

signal AddTopic
signal RemoveTopic
signal TopicFinished


# Called when the node enters the scene tree for the first time.
func _ready():
	if research_resource:
		research_resource.initialize()
		var data_len = 0
		for data_type in research_resource.research_cost.keys():
			if research_resource.research_cost[data_type] != 0:
				var value = research_resource.research_cost[data_type]
				
				#create new cost label
				var new_label = Label.new()
				new_label.self_modulate = data_type.color
				new_label.text = str(value) + " " + data_type.type + " Data"
				$VBoxContainer/VboxCost.add_child(new_label)
				#Create new progress bar
				var new_bar = DATABAR.instantiate()
				new_bar.max_value = value
				new_bar.self_modulate = data_type.color
				new_bar.topic = research_resource
				new_bar.key = data_type
				$VBoxContainer/VBoxProgress.add_child(new_bar)
				#rect sizing
				data_len += 1
		
		custom_minimum_size.y = 128 + 110 * data_len
		
		research_resource.get_unlocked()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if research_resource.get_unlocked():
		show()
	else:
		hide()


func tick(data_spend):
	var costs = research_resource.research_cost
	var progress = research_resource.research_spent
	var complete = true
	for data_type in costs.keys():
		if progress[data_type] < costs[data_type]:
			complete = false
			if data_type.value >= data_spend:
				progress[data_type] += data_spend
				data_type.spend(data_spend)
			else:
				progress[data_type] += data_type.value
				data_type.spend(data_type.value)
	
	if complete:
		print("Complete")
		complete()
		emit_signal("TopicFinished",self)


func resource_set(new_resource):
	research_resource = new_resource
	
	$Title.text = research_resource.title
	$Description.text = research_resource.description


func activate():
	active = true
	$ResearchButton.text = "Researching"


func deactivate():
	active = false
	$ResearchButton.text = "Research"


func complete():
	active = false
	research_resource.research()
	$ResearchButton/Complete.show()
	$ResearchButton.disabled = true
	


func _on_research_button_pressed():
	if active:
		emit_signal("RemoveTopic", self)
	else:
		emit_signal("AddTopic", self)
