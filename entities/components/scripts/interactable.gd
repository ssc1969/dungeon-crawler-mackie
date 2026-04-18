## Allows this entity to be interacted with when inside the range of an [InteractorComponent].
class_name InteractableComponent extends Node2D

@export var collision_object: CollisionObject2D
@export var effects: Array[Action]


func _ready() -> void:
	# Enable the interaction collision layers for this node
	collision_object.set_collision_layer_value(4, true)
	collision_object.set_collision_mask_value(4, false)
	collision_object.add_user_signal("interacted", [
		{"name": "interactor", "type": TYPE_OBJECT}
	])
	collision_object.connect("interacted", interact)


func interact(interactor: Node2D) -> void:
	if effects.size() == 0:
		return

	for e in effects:
		e.use(interactor)
