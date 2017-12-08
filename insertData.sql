-- After db creation run by sqlite3:
-- .separator "\t"
-- .import FOLDER_PATH/malopolska.csv data

-- -- typy
REPLACE INTO community_types(id, type)
  SELECT DISTINCT rgmi, typ
  FROM data
  WHERE rgmi<>'' AND rgmi<>'9';

-- wojewodztwa
INSERT INTO voivodeships(id, name)
  SELECT DISTINCT woj, nazwa
  FROM data
  WHERE typ = 'województwo';

-- powiaty
INSERT INTO counties(id, name, voivodeship_id)
  SELECT DISTINCT pow, nazwa, woj
  FROM data
  WHERE typ = 'powiat' OR typ = 'miasto na prawach powiatu';

-- gminy
INSERT INTO communities(name, county_id, community_type_id)
  SELECT nazwa, pow, rgmi
  FROM data
  WHERE rgmi<>'' AND rgmi<>'9';