class_name Action extends Resource
## Defines an Action; that is, a script that applies some effect to a set of entities using the targeter provided.

@export var targeters: Array[ActionTargeter]
@export var effects: Array[ActionEffect]


func use(target_arg = null) -> void:
	var targets: Dictionary[Node2D, bool]

	# get a set (no duplicates) of all the nodes to apply the effect to
	for targeter in targeters:
		var new_nodes = targeter.target(target_arg)

		for n in new_nodes:
			targets[n] = true

	# apply the effect to every node
	for t in targets:
		for e in effects:
			e.use(t)
