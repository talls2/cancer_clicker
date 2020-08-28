extends CanvasLayer
class_name CounterNode

var count: int = 0
onready var counter := $Counter as Label

func _increase_counter():
	count += 1
	counter.text = str(count)