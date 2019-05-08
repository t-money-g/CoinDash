extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screensize =Vector2()

func pickup():
	monitoring = false;
	$Tween.start()

func _ready():
	$Tween.interpolate_property($CoinSprite, 'scale',
								$CoinSprite.scale,
								$CoinSprite.scale * 3, 0.3,Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
								
	$Tween.interpolate_property($CoinSprite, 'modulate',
								Color(1, 1, 1,1),
								Color(1, 1, 1, 0), 0.3,
								Tween.TRANS_QUAD, Tween.EASE_IN_OUT)

func _on_PowerUp_area_entered(area):
	pickup() 
	if area.is_in_group("obstacles"):
		position = Vector2(rand_range(0, screensize.x), rand_range(0, screensize.y))


func _on_LifeTime_timeout():
	queue_free()
