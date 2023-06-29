extends Panel

const DATABAR = preload("res://UI_Components/ResearchTab/data_progress_bar.tscn")

@export var research_resource : ResearchTopic : set = resource_set


var research_overview = null

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
	if research_resource.get_researched() and research_resource.get_unlocked():
		$ResearchButton.disabled = true
		$Complete.show()
	
	
	if research_resource.get_unlocked():
		show()
	else:
		hide()


func tick():
	var costs = research_resource.research_cost
	var progress = research_resource.research_spent
	for data_type in costs.keys():
		if data_type.value > 0 and progress[data_type] < costs[data_type]:
			costs[data_type] += 1


func resource_set(new_resource):
	research_resource = new_resource
	
	$Title.text = research_resource.title
	$Description.text = research_resource.description


func _on_research_button_pressed():
	emit_signal("ResearchSignal", research_resource)
