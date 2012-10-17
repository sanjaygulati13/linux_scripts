#!/bin/csh

set result_file = /delsoft/sanjayg/scripts/movie_list.txt
set top_movie_dir = /delsoft/songs/Movies

rm -rf $result_file
touch $result_file

foreach dir (English Hindi Animation Documentary Foreign)

    echo $dir >> $result_file
    echo "---------------" >> $result_file

    cd $top_movie_dir/$dir

    ls -1 | egrep -iv "\.(srt|sub|txt|idx|ass)" | sed -r 's/\.(avi|mkv|mp4|rmvb|divx|bin|wmv|vob|mov|m4v)//i' >> $result_file

    echo >> $result_file

end
