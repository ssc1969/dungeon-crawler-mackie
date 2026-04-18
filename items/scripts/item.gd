class_name Item extends Resource

@export var name: String = "" ## Name of the item
@export_multiline var description: String = "" ## Description of the item
@export var texture: Texture2D ## Item texture
@export var type_data: ItemType ## Type of the item
@export var stack_size: int = 99 ## Maximum stack size of this item
@export var reusable: bool = false ## Whether or not this item can be reused

@export_category("Item Use Effects")
@export var effects: Array[Action]


func use() -> bool:
	if effects.size() == 0:
		return false

	for e in effects:
		e.use()

	return true
