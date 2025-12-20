#!/bin/bash

WEBROOT="/var/www/jairuzsaure_devopssite"
JOURNALS="$WEBROOT/journals"
LOGFILE="$WEBROOT/update.log"

# ==== TODAY'S DATE ====
today=$(date +"%Y-%m-%d")
#today="2025-12-15"
longdate=$(date +"%A, %B %d, %Y")

# ==== WEEK CALCULATION (FIXED) ====
PROJECT_START="2025-11-01"

start_seconds=$(date -d "$PROJECT_START" +%s)
today_seconds=$(date -d "$today" +%s)

days_passed=$(( (today_seconds - start_seconds) / 86400 ))
week_num=$(( (days_passed / 7) + 1 ))

# ==== CREATE DAILY JOURNAL ====
journal_file="$JOURNALS/$today.txt"
echo "Journal Entry - $longdate" > $journal_file
echo "Week: $week_num" >> $journal_file
echo "Message: Stay consistent, keep learning!" >> $journal_file

# ==== UPDATE HOMEPAGE ====
cat <<EOF > $WEBROOT/index.html
<!DOCTYPE html>
<html>
<head>
<title>Jairuz DevOps Journal</title>
<style>
  body { font-family: Arial; padding: 20px; background: #f4f4f4; }
  h1 { color: #333; }
  p { font-size: 18px; }
</style>
</head>
<body>
<h1>Hello from Jairuz's DevOps Site!</h1>
<p><strong>Date:</strong> $longdate</p>
<p><strong>Week:</strong> $week_num of my DevOps Journey</p>
<p><strong>Message:</strong> Stay consistent, keep learning!</p>
<p><a href="journal_viewer.php">View all journals</a></p>
</body>
</html>
EOF

# ==== LOG ACTION ====
echo "[$(date)] Created journal: $journal_file, updated homepage" >> $LOGFILE
