extends Control
@onready var pathfollow = $"../Path2D/PathFollow2D"
@onready var player = $"../World/Player"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#position = pathfollow.position - Vector2(160,144)
	$SpeedProgressBar.value = player.acc.length()
	pass
