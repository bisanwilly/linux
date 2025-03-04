#!/bin/bash

# יצירת סביבת venv אם לא קיימת
if [ ! -d "Q4/venv" ]; then
    python3 -m venv Q4/venv
fi

# הפעלת הסביבה הווירטואלית
source Q4/venv/bin/activate

# התקנת חבילות אם לא הותקנו
pip install -r Q4/requirements.txt

# קריאת הנתונים מתוך ה-CSV
while IFS=, read -r PLANT HEIGHT LEAF_COUNT DRY_WEIGHT
do
    if [[ "$PLANT" == "Plant" ]]; then
        continue
    fi

    # יצירת תיקייה לצמח ושמירת תמונות
    mkdir -p Q4_2/$PLANT
    python Q4/plant_plots.py --plant "$PLANT" --height $HEIGHT --leaf_count $LEAF_COUNT --dry_weight $DRY_WEIGHT
    mv Q4_1/$PLANT_plots.png Q4_2/$PLANT/
    
done < Q4/plant_data.csv

# יציאה מהסביבה
deactivate
