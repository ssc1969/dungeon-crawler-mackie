## Allows an entity to interact with [InteractableComponent]s
class_name InteractorComponent extends Area2D

var interactables: Array[InteractableComponent]


func _ready() -> void:
	connect("body_entered", _on_body_entered)
	connect("body_exited", _on_body_exited)


## Function to interact with the nearest interactable object
func interact():
	pass


func can_interact() -> bool:
	return interactables.size() > 0


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
