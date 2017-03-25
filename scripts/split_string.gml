/// split_string(str, delim)
var str = argument0;
var delim = argument1;

var index = 0;

var delim_position = string_pos(delim, str);

while (delim_position != 0) {
    split[index] = string_copy(str, 1, delim_position-1);
    str = string_delete(str, 1, delim_position + string_length(delim)-1);
    index++;
    delim_position = string_pos(delim, str);
}

// get last piece
split[index] = str;

return split;
