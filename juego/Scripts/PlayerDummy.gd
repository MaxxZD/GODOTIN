extends KinematicBody

export var cantidad_rotacion: int = 20

func _ready() -> void:
	$Animaciones.play("run-cycle")
	
func _process(delta: float) -> void:
	$Armature.rotation_degrees.y += cantidad_rotacion * delta
