class_name AddItemEffect extends ActionEffect

@export var item: Item
@export var count: int = 1


func use(target: Node2D) -> void:
	target.emit_signal("add_item", item, count)
	print("adding item!")
