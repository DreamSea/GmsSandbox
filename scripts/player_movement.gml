if (keyboard_check(vk_left)) {
    hspeed = -5;
} else if (keyboard_check(vk_right)) {
    hspeed = 5;
} else {
    hspeed = 0;
}

if (keyboard_check(vk_up)) {
    vspeed = -5;
} else if (keyboard_check(vk_down)) {
    vspeed = 5;
} else {
    vspeed = 0;
}
