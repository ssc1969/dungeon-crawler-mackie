class_name InventorySlotUI extends Button

var slot_data: InventorySlot:
	set = set_slot_data

@onready var item_icon: TextureRect = $ItemIcon
@onready var type_icon: TextureRect = $ItemType/TypeIcon
@onready var label: Label = $Count


func _ready() -> void:
	pressed.connect(_on_item_pressed)
	type_icon.texture = null
	item_icon.texture = null
	label.text = ""


func set_slot_data(new_slot: InventorySlot) -> void:
	if new_slot.is_empty():
		item_icon.texture = null
		type_icon.texture = null
		label.text = ""
	else:
		slot_data = new_slot
		type_icon.texture = slot_data.item.type_data.texture
		item_icon.texture = slot_data.item.texture

		label.text = str(slot_data.quantity) if slot_data.quantity > 1 else ""


func _on_item_pressed() -> void:
	if !slot_data:
		return

	slot_data.use()
