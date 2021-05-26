extends CanvasLayer

func on_game_start():
	$TitleScreen.visible = false
	$Controls.visible = true
	
func on_game_over():
	$DeathScreen.visible = true
	$"DeathScreen/Score".text = "Final Score: " + str(round($"../Player".global_transform.origin.x))

func on_game_win():
	$WinScreen.visible = true

func on_title_screen():
	$DeathScreen.visible = false
	$WinScreen.visible = false
	$TitleScreen.visible = true

func on_hide_controls():
	$Controls.visible = false
