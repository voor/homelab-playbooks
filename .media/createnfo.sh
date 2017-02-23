#!/bin/env bash

episode=$((1))

showtitle=${PWD##*/}

showinfo=$(cat <<-END
<tvshow>
<title>$showtitle</title>
<thumb>banner.jpg</thumb>
<genre>Exercise</genre>
</tvshow>
END
)
echo "$showinfo" > tvshow.nfo

for f in ./*.mkv
do

  title=${f:2:-4}
  template=$(cat <<-END
  <?xml version="1.0" encoding="UTF-8" standalone="yes"?>
  <episodedetails>
      <title>$title</title>
      <showtitle>$showtitle</showtitle>
      <rating>0</rating>
      <season>1</season>
      <episode>$episode</episode>
  </episodedetails>
END
  )
  episode=$((episode+1))
  echo "$template"
  echo "$template" > "$title.nfo"
done
