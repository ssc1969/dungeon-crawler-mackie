class_name SlotData extends Resource

@export var item_data: ItemData
@export var quantity: int = 0: set = set_quantity


func use() -> void:
	var was_used = item_data.use()

	if !was_used:
		return

	if !item_data.reusable:
		set_quantity(quantity - 1)


func set_quantity(value: int) -> void:
	quantity = value

	if quantity < 1:
		emit_changed()
