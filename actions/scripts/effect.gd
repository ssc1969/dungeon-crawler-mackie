class_name ActionEffect extends Resource
## Extend this base class and override the [member use] function to create a new ItemEffect

@export var use_description: String


## What happens when this effect is used
func use(target: Node2D) -> void:
	pass
