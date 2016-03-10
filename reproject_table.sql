DROP TABLE IF EXISTS za_wc.demog_sas;

CREATE TABLE za_wc.demog_sas(
	gid serial primary key,
	the_geom geometry(MULTIPOLYGON,201109), 
	sa_code integer, 
	sp_code integer,
	sp_name varchar(254),
	mp_code integer,
	mp_name varchar(254),
	mn_mdb_c varchar(7),
	mn_code integer,
	mn_name varchar(254),
	dc_mdb_c varchar(5),
	dc_mn_c integer,
	dc_name varchar(254),
	pr_mdb_c varchar(3),
	pr_code integer,
	pr_name varchar (50));

INSERT INTO za_wc.demog_sas(
	the_geom, 
	sa_code, 
	sp_code,
	sp_name,
	mp_code,
	mp_name,
	mn_mdb_c,
	mn_code,
	mn_name,
	dc_mdb_c,
	dc_mn_c,
	dc_name,
	pr_mdb_c,
	pr_code,
	pr_name) 
		SELECT 
			ST_Transform(the_geom, 201109), 
			sa_code, 
			sp_code,
			sp_name,
			mp_code,
			mp_name,
			mn_mdb_c,
			mn_code,
			mn_name,
			dc_mdb_c,
			dc_mn_c,
			dc_name,
			pr_mdb_c,
			pr_code,
			pr_name
		FROM zaf.demog_sas
		WHERE pr_code = 1
		ORDER BY gid;

SELECT ST_AsEWKT(the_geom), * FROM za_wc.demog_sas;
