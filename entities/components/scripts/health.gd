## Handles health management for an entity.
class_name HealthComponent extends Node2D

@export var max_health: float = 20.0:
	set(value):
		max_health = value;

		if current_health > max_health:
			current_health = max_health

var current_health: float = 20.0:
	set(value):
		current_health = clampf(value, 0, max_health)


## Initialize this entity's health back to it's max health
func initialize_health():
	current_health = max_health


## Deal damage to this entity
func damage(amount: float):
	current_health -= amount


## Heal damage from this entity
func heal(amount: float):
	current_health += amount
