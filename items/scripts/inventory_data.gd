class_name InventoryData extends Resource

@export var slots: Array[InventorySlot]

signal inventory_changed


func _init() -> void:
	connect_slots()


func connect_slots() -> void:
	for s in slots:
		if s:
			s.changed.connect(slot_changed)


func add_item(item: Item, count: int = 1) -> int:
	var remaining := count

	# try to stack in existing slots
	for slot in slots:
		if remaining <= 0:
			break

		if slot.can_stack(item):
			var space := item.stack_size - slot.quantity
			var to_add := mini(remaining, space)
			slot.quantity += count
			remaining -= to_add

	for slot in slots:
		if remaining <= 0:
			break

		if slot.is_empty():
			slot.item = item
			var to_add := mini(remaining, item.stack_size)
			slot.quantity = to_add
			remaining -= to_add

	inventory_changed.emit()
	return remaining # returns any that didn't fit


func remove_item(target_item: Item, count: int = 1) -> bool:
	var remaining := count

	for slot in slots:
		if remaining <= 0:
			break

		if slot.item == target_item:
			var to_remove := mini(remaining, slot.quantity)
			slot.quantity -= to_remove
			remaining -= to_remove

			if slot.quantity <= 0:
				slot.item = null
				slot.quantity = 0

	inventory_changed.emit()
	return remaining <= 0 # true if we removed everything that was requested


func slot_changed() -> void:
	for s in slots:
		if s:
			if s.quantity < 1:
				s.changed.disconnect(slot_changed)
				var index = slots.find(s)
				slots[index] = null
				emit_changed()
