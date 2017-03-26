//show_debug_message("score: "+string(score));
image_alpha = 0.5;

var inst;
inst = instance_place(x, y, taiko_note);
if (inst != noone) {
    //show_debug_message("collision");
    //show_debug_message(string(x)+", "+string(y)+" vs"+string(inst.x)+", "+string(inst.y));
    //show_debug_message(string(x)+" vs "+string(inst.x));
    
    if (argument[0] == inst.note_type || argument[1] == inst.note_type) {
        with (inst) {
            global.last_acc = (noteTarget - global.trackPosition);
            
            // https://osu.ppy.sh/forum/t/146678
            // great <= 48ms, good <= 108ms
            if (abs(global.last_acc) <= 48) {
                score += 300;
                global.combo++;
                effect_create_above(ef_spark, x, y, 3, c_white);
            } else if (abs(global.last_acc) <= 108) {
                score += 100;
                global.combo++;
                effect_create_above(ef_spark, x, y, 1, c_yellow);
            } else {
                global.combo = 0;
                effect_create_above(ef_smoke, x, y, 1, c_white);
            }
            instance_destroy();
        }
    } else {
        with (inst) {
            global.combo = 0;
            effect_create_above(ef_smoke, x, y, 1, c_white);
            instance_destroy();
        }
    }
}
