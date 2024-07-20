extends Camera3D

var rotation_speed := 0.5
var min_angle := -45.0
var max_angle := 45.0
var current_yaw := 0.0

func _physics_process(delta):
    var direction = Input.get_axis("pan_left", "pan_right")
    if direction != 0:
        current_yaw -= direction * rotation_speed * delta
    
    current_yaw = clamp(current_yaw, min_angle * PI / 180, max_angle * PI / 180)
    rotation_degrees.y = current_yaw * 180 / PI

        
# Looking left/ right with mouse
#func _input(event):
    #if event is InputEventMouseMotion:
        #var delta = event.relative
        #current_yaw -= delta.x * rotation_speed
        #current_yaw = clamp(current_yaw, min_angle * PI / 180, max_angle * PI / 180)
        #rotation_degrees.y = current_yaw * 180 / PI
