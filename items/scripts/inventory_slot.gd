class_name InventorySlot extends Resource

@export var item: Item = null
@export var quantity: int = 0: set = set_quantity


func is_empty() -> bool:
	return item == null


func can_stack(new_item: Item) -> bool:
	return item == new_item and quantity < item.stack_size


func use() -> void:
	var was_used = item.use()

	if !was_used:
		return

	if !item.reusable:
		set_quantity(quantity - 1)


func set_quantity(value: int) -> void:
	quantity = value

	if quantity < 1:
		emit_changed()
