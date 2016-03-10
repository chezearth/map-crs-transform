# map-crs-transform
# Intro
I find it's pretty difficult to do spatial functions over PostGIS tables that have different CRSs. So, I prefer to structure my databases by grouping tables with common CRSs, e.g. GCS (long-lat) data are in their own database, Albers Equal Area data have their own, so do Lamberts Conical Conform, as well as UTM, and TM (the South African CRS). When I need to work with data from different databases, I then need to transform one set of data into the other CRS and then dump-restore it across from one database to the other. 
# How it works
This involves a little shell script consisting of the pgdump command piped to a psql command.
# How to use it
Clone or copy the file repos to a suitable folder on your computer. `CD` to the folder and then type ````bash shellscript.sh -do <origin_database> -t <tablename> -dt <targetdatabase>````. The script will execute a sql script to create a table and transform it to the new 
