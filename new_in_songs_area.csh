#!/bin/csh

set tmp_file = tmp_songs_list

find /delsoft/songs -name "*" | sort >! $tmp_file

comm -3 -1 $1 $tmp_file


