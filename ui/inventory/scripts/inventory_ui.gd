class_name InventoryUI extends Control

var focus_index: int

@export var data: InventoryData

# TODO: replace with preloaded inventory slot scene
var INVENTORY_SLOT: PackedScene


func _ready() -> void:
	clear_inventory()
	data.changed.connect(on_inventory_changed)


func clear_inventory() -> void:
	for c in get_children():
		c.queue_free()


func update_inventory() -> void:
	for slot in data.slots:
		var new_slot = INVENTORY_SLOT.instantiate()
		add_child(new_slot)
		new_slot.slot_data = slot
		new_slot.focus_entered.connect(item_focused)

	get_child(0).grab_focus()


func item_focused() -> void:
	for i in get_child_count():
		if get_child(i).has_focus():
			focus_index = i


func on_inventory_changed() -> void:
	clear_inventory()
	update_inventory()
	get_child(focus_index).grab_focus()
