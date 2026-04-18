## Allows an entity to interact with [InteractableComponent]s
class_name InteractorComponent extends Area2D

var interactables: Array[Node2D]


func sort_distance(a: InteractableComponent, b: InteractableComponent) -> bool:
	return position.distance_squared_to(a.position) < position.distance_squared_to(b.position)


func _ready() -> void:
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)
	collision_layer = 0
	collision_mask = 0
	set_collision_mask_value(4, true)


## Function to interact with the nearest interactable object
func interact():
	if not can_interact():
		return

	interactables[0].emit_signal("interacted", self)


func can_interact() -> bool:
	return interactables.size() > 0


func _on_body_entered(body: Node2D) -> void:
	interactables.append(body)
	interactables.sort_custom(sort_distance)


func _on_body_exited(body: Node2D) -> void:
	interactables.erase(body)
