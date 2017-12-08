## db creation
* sqlite3 malopolska.db < createDB.sql

## csv import - after db creation run by sqlite3:
* .separator "\t"
* .import FOLDER_PATH/malopolska.csv data