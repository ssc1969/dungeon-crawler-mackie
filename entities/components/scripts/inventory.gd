class_name InventoryComponent extends Node2D

@export var inventory: InventoryData


func _ready() -> void:
	var parent = get_parent()
	parent.add_user_signal("add_item", [
		{"name": "item", "type": TYPE_OBJECT},
		{"name": "count", "type": TYPE_INT}
	])
	parent.connect("add_item", _on_add_item)


func _on_add_item(item: Item, count: int = 1) -> bool:
	return inventory.add_item(item, count)
