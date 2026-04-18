class_name TownBuilding
extends Node2D
@onready var area: Area2D = $BuildingSprite/Area2D
@onready var building_sprite: Sprite2D = $BuildingSprite

#preloading the buildings 'interior' of the building that has been pressed
@export var building_interior: PackedScene


func _input(event):
	if event.is_action_pressed("click"):
		if building_sprite.is_pixel_opaque(get_local_mouse_position()):
			get_tree().change_scene_to_packed(building_interior)


func _ready():
	area.mouse_entered.connect(toggle_highlight.bind(true))
	area.mouse_exited.connect(toggle_highlight.bind(false))


func toggle_highlight(on: bool):
	modulate = '#d2dae2' if on else '80839b'
