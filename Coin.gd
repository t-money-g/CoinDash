extends Area2D

var screensize = Vector2()

func pickup():
	monitoring = false;
	$Tween.start()

func _ready():
	$Timer.wait_time = rand_range(3, 8)
	$Timer.start()
	$Tween.interpolate_property($CoinSprite, 'scale',
								$CoinSprite.scale,
								$CoinSprite.scale * 3, 0.3,Tween.TRANS_QUAD, Tween.EASE_IN_OUT)
								
	$Tween.interpolate_property($CoinSprite, 'modulate',
								Color(1, 1, 1,1),
								Color(1, 1, 1, 0), 0.3,
								Tween.TRANS_QUAD, Tween.EASE_IN_OUT)

func _on_Tween_tween_completed(object, key):
	queue_free()

func _on_Timer_timeout():
	$CoinSprite.frame = 0
	$CoinSprite.play()

func _on_Coin_area_entered(area):
	if area.is_in_group("obstacles"):
		position = Vector2(rand_range(0, screensize.x), rand_range(0, screensize.y))