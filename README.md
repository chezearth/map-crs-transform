# map-crs-transform
## Intro
I find it's pretty difficult to do spatial functions over PostGIS tables that have different CRSs. So, I prefer to structure my databases by grouping tables with common CRSs, e.g. GCS (long-lat) data are in their own database, Albers Equal Area data have their own, so do Lamberts Conical Conform, as well as UTM, and TM (the South African CRS). When I need to work with data from different databases, I then need to transform one set of data into the other CRS and then dump-restore it across from one database to the other. 
## How it works
First off, the script checks to see if a table with the same name already exists in the target database. If it does, it asks you if you really want to overwrite it (best advice is **don't!**).
Then it runs `pg_dump` command that pipes the Stdout directly to a `psql -d <target_database>` command.
## How to use it
Clone or copy the file repos to a suitable folder on your computer. `CD` to the folder and then type 
```bash shellscript.sh -do <origin_database> -t <tablename> -dt <targetdatabase>```
The script will execute a sql script to create a new temporary target CRS table in the original database and transform the original to that CRS. It will check the existance of the table in the target database and if permitted, will perform the pg_dump command to overwrite it. **Note**: the table is transformed and _copied_, not moved.
