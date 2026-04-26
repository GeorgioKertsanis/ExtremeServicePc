#!/bin/bash

BASE_DIR="img"
# Εδώ προσθέσαμε το gaming!
FOLDERS=("mobiles" "laptops" "racks" "gaming")

for folder in "${FOLDERS[@]}"; do
    if [ -d "$BASE_DIR/$folder" ]; then
        echo "Επεξεργασία: $folder..."
        count=1
        # Ψάχνει όλα τα είδη εικόνων
        find "$BASE_DIR/$folder" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | while read -r file; do
            # Μετονομασία σε σκέτο νούμερο.webp (π.χ. 1.webp)
            mv "$file" "$BASE_DIR/$folder/$count.webp" 2>/dev/null
            ((count++))
        done
    fi
done

echo "✅ Η μετονομασία (1.webp, 2.webp...) ολοκληρώθηκε!"
