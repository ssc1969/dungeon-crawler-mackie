class_name InventoryComponent extends Node2D

@export var slots: Array[SlotData]


func add_item(item: ItemData, count: int = 1) -> bool:

	for slot in slots:
		if !slot:
			continue

		if slot.item_data == item:
			slot.quantity += count
			return true

	for i in slots.size():
		if slots[i] == null:
			var new = SlotData.new()
			new.item_data = item
			new.quantity = count
			new.changed.connect(slot_changed)
			slots[i] = new
			return true

	# TODO: actually handle cases where the inventory is full
	print("inventory full!")

	return false


func connect_slots() -> void:
	for s in slots:
		if s:
			s.changed.connect(slot_changed)


func slot_changed() -> void:
	for s in slots:
		if s:
			if s.quantity < 1:
				s.changed.disconnect(slot_changed)
				var index = slots.find(s)
				slots[index] = null
