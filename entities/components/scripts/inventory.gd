class_name InventoryComponent extends Node2D

@export var inventory: InventoryData


func add_item(item: Item, count: int = 1) -> bool:
	return inventory.add_item(item, count)
