#!/bin/sh
sed -i \
         -e 's/#181818/rgb(0%,0%,0%)/g' \
         -e 's/#f8eaea/rgb(100%,100%,100%)/g' \
    -e 's/#1f1f1f/rgb(50%,0%,0%)/g' \
     -e 's/#fc5f72/rgb(0%,50%,0%)/g' \
     -e 's/#1f1f1f/rgb(50%,0%,50%)/g' \
     -e 's/#f8eaea/rgb(0%,0%,50%)/g' \
	"$@"
