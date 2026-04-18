class_name InteractorTargeter extends ActionTargeter


func target(...args) -> Array[Node2D]:
	var interactor = args[0]
	return [interactor]
