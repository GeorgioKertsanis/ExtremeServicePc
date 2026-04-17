#!/bin/bash

BASE_DIR="img"
FOLDERS=("mobiles" "laptops" "racks")

for folder in "${FOLDERS[@]}"; do
    if [ -d "$BASE_DIR/$folder" ]; then
        echo "Επεξεργασία: $folder..."
        count=1
        find "$BASE_DIR/$folder" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) | while read -r file; do
            ext="${file##*.}"
            mv "$file" "$BASE_DIR/$folder/${folder}_$count.$ext"
            ((count++))
        done
    fi
done

echo "✅ Η μετονομασία ολοκληρώθηκε!"
