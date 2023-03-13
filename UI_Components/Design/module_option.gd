@tool
extends Panel

@export var ModuleResource : BaseModule : set = module_changed

signal AddToRocket


# Called when the node enters the scene tree for the first time.
func _ready():
	update_fields()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func module_changed(new_module):
	ModuleResource = new_module
	if is_inside_tree():
		update_fields()


func update_fields():
	$ModuleTexture.texture = ModuleResource.texture
	$Title.text = ModuleResource.name
	$Description.text = ModuleResource.description
	
	$VBoxContainer/OreBox/OreCost.text = str(ModuleResource.ore_cost)
	$VBoxContainer/MoneyBox/MoneyCost.text = str(ModuleResource.money_cost)


func _on_button_pressed():
	emit_signal("AddToRocket",ModuleResource)

