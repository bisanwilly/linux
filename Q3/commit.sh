#!/bin/bash

# קובץ CSV שמכיל את הנתונים
CSV_FILE="Q3/bug_report.csv"

# בדיקה שהקובץ קיים
if [[ ! -f "$CSV_FILE" ]]; then
    echo "Error: CSV file not found!"
    exit 1
fi

# קריאת נתונים מתוך ה-CSV
while IFS=, read -r BUGID DESCRIPTION BRANCH DEV_NAME PRIORITY REPO_PATH
do
    # דילוג על כותרת הקובץ
    if [[ "$BUGID" == "BUGID" ]]; then
        continue
    fi

    # יצירת ענף חדש אם הוא לא קיים
    git checkout -b "$BRANCH" 2>/dev/null || git checkout "$BRANCH"

    # יצירת קובץ עם פרטי הבאג
    BUG_FILE="Q3/bug_$BUGID.txt"
    echo "BugID: $BUGID" > "$BUG_FILE"
    echo "Current Date: $(date +'%Y-%m-%d %H:%M:%S')" >> "$BUG_FILE"
    echo "Branch Name: $BRANCH" >> "$BUG_FILE"
    echo "Developer Name: $DEV_NAME" >> "$BUG_FILE"
    echo "Priority: $PRIORITY" >> "$BUG_FILE"
    echo "Repository Path: $REPO_PATH" >> "$BUG_FILE"
    echo "Excel Description: $DESCRIPTION" >> "$BUG_FILE"

    # הוספת הקובץ ל-Git
    git add "$BUG_FILE"

   # ביצוע Commit עם הפורמט המבוקש
    git commit -m "BugID:$BUGID:CurrntDate:$(date +'%Y-%m-%d %H:%M:%S'):Branch:$BRANCH:DevName:$DEV_NAME:Priority:$PRIORITY:Excel Description:$DESCRIPTION"

    # דחיפת השינויים ל-GitHub
    git push origin "$BRANCH"

done < "$CSV_FILE"
