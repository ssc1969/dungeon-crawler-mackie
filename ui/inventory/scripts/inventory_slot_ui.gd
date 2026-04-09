class_name InventorySlotUI extends Button

var slot_data: SlotData:
	set = set_slot_data

@onready var item_icon: TextureRect = $ItemIcon
@onready var type_icon: TextureRect = $ItemType/TypeIcon
@onready var label: Label = $Count


func _ready() -> void:
	type_icon.texture = null
	item_icon.texture = null
	label.text = ""


func set_slot_data(value: SlotData) -> void:
	slot_data = value

	if slot_data == null:
		return

	type_icon.texture = slot_data.item_data.type_data.texture
	item_icon.texture = slot_data.item_data.texture
	label.text = str(slot_data.quantity)


func item_pressed() -> void:
	if !slot_data:
		return

	slot_data.use()
