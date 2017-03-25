//show_debug_message("score: "+string(score));
image_alpha = 0.3;

var inst;
inst = instance_place(x, y, Note);
if (inst != noone) {
    //show_debug_message("collision");
    //show_debug_message(string(x)+", "+string(y)+" vs"+string(inst.x)+", "+string(inst.y));
    //show_debug_message(string(x)+" vs "+string(inst.x));
    with (inst) {
        global.last_acc = (noteTarget - global.trackPosition)/100;
        instance_destroy();
        score += 1;
        global.combo++;
        //show_debug_message("score: "+string(score));
    }
}
