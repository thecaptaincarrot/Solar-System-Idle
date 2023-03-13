@tool
extends Panel

@export var research_resource : ResearchTopic : set = resource_set


# Called when the node enters the scene tree for the first time.
func _ready():
	research_resource.get_unlocked()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !Engine.is_editor_hint():
		if research_resource.get_researched() and is_visible_in_tree():
			$ResearchButton.hide()
		
		if research_resource.get_unlocked():
			show()
		else:
			hide()


func resource_set(new_resource):
	research_resource = new_resource
	
	$Title.text = research_resource.title
	$Description.text = research_resource.description
	
	$CostBox/Cost.text = str(research_resource.research_cost)


func _on_research_button_pressed():
	pass # Replace with function body.
