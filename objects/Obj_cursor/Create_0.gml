global.debug = false
global.timer = 0

converted = 0
depth = -2*room_height
shop_open = false
grabbed = noone
invert_scroll = 0
scroll_dir = 0
scroll_time = 0

font_num = font_add_sprite_ext(Spr_font_num,"0123456789.",false,1)
font_txt = font_add_sprite_ext(Spr_font_txt,"abcdefghijklmnopqrstuvwxyz1234567890:.",false,1)

upgrades = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,true] //17 is always true
cost = [5,15,50,5,15,50,5,15,50,5,15,50,99,5,15,50,99,0] //17 is always 0

//config
population_density = 1 //0 to 1
point_multiplier = 1 //0 to 10
human_resiliance = 0.3 //0 to 1
human_max_speed = 1 //0 to 2
tool_pickup_time = 30 //0 to 100 in seconds
mine_chance = 0.05
draw_corpses = true
game_room = 0

win = 0