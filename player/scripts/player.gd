class_name Player extends CharacterBody2D

var direction: Vector2 = Vector2.ZERO
var facing_direction: Vector2 = Vector2.RIGHT

var move_speed: float = 100.0
@onready var interactor_component: InteractorComponent = $InteractorComponent


func _process(_delta: float) -> void:
	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")

	if Input.is_action_just_released("interact"):
		interactor_component.interact()


func _physics_process(_delta: float) -> void:
	velocity = direction * move_speed
	move_and_slide()
