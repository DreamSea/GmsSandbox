if (!global.song_preview_stream == 0) {
    audio_destroy_stream(global.song_preview_stream);
    global.song_preview_stream = 0;
}
room_goto(Rhythm);
