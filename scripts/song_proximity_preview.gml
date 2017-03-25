var nearestSong = instance_nearest(x, y, GoObject);

var distance = sqrt(power(nearestSong.x-x,2) + power(nearestSong.y-y,2));

var intensity = 150 - distance;
if (intensity < 0) {
    intensity = 0;
    if (!global.song_preview_stream == 0) {
        audio_destroy_stream(global.song_preview_stream);
        global.song_preview_stream = 0;
    }
} else {
    if (intensity > 100) {
        intensity = 100;
    }
    if (global.song_preview_stream == 0) {
        global.song_preview_stream = audio_create_stream(nearestSong.songfilepath);
        global.song_preview_index = audio_play_sound(global.song_preview_stream,0,true);
    
        var time = get_timer()/1000/1000;
        
        audio_sound_get_track_position(global.song_preview_index); // needed so audio_sound_length works?
        var song_length = audio_sound_length(global.song_preview_index);
        
        while (time > song_length) {
            show_debug_message(time);
            show_debug_message(song_length);
            time -= song_length;
        }
        audio_sound_set_track_position(global.song_preview_index, time);
    }
    audio_sound_gain(global.song_preview_stream, intensity/100, 0);
}
