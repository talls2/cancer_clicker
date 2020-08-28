extends Node2D

signal on_click_event

onready var clickable_area := $ClickableArea as Area2D
onready var animation := $Animation as AnimationPlayer

func _ready() -> void:
	var area := $ClickableArea as Area2D
	var connected := 0

	connected += area.connect('input_event', self, '_on_click')
	connected += area.connect('mouse_entered', self, '_on_mouse_enter')
	connected += area.connect('mouse_exited', self, '_on_mouse_exit')

	assert(connected == 0)


func _on_click(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if(event is InputEventMouseButton):
		if(event.pressed):
			animation.play('Click')
			animation.queue('Hover')

			emit_signal('on_click_event')

func _on_mouse_enter():
	animation.play('Hover')

func _on_mouse_exit():
	animation.play('Idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
