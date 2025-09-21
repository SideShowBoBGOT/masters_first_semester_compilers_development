for svg_file in *.svg; do
    if [ ! -e "$svg_file" ]; then
        exit 1
    fi
    
    filename="${svg_file%.svg}"
    magick -density 300 "$svg_file" "${filename}.png"
done