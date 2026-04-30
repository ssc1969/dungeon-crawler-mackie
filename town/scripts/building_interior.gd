extends Control

@export var building_name: String
@export var background: Texture = null
@export var can_toggle_inventory: bool = false
@export var inventory_enabled: bool = false

@onready var name_label: Label = $HBoxContainer/BuildingOptions/Label
@onready var inventory_panel: Panel = $HBoxContainer/InventoryPanel
@onready var inventory_toggle: Button = $HBoxContainer/InventoryToggle
@onready var texture_rect: TextureRect = $HBoxContainer/TextureRect
@onready var exit_button: Button = $ExitButton


func _ready() -> void:
	name_label.text = building_name
	inventory_panel.visible = inventory_enabled
	inventory_toggle.visible = can_toggle_inventory

	if background:
		texture_rect.texture = background

	if can_toggle_inventory:
		inventory_toggle.connect("button_up", toggle_inventory)


func toggle_inventory() -> void:
	inventory_panel.visible = !inventory_panel.visible


func _on_exit_button_pressed() -> void:
	print('exit pressed')
	get_tree().change_scene_to_file("res://town/town.tscn")
