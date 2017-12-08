-- (1) List statistics - communities statistics
SELECT COUNT(communities.community_type_id), community_types.type
  FROM community_types
  JOIN communities
    ON community_types.id = communities.community_type_id
  GROUP BY community_types.type;

-- (2) Display 3 cities with the longest names
SELECT name
  FROM communities
  ORDER BY LENGTH(name) DESC
  LIMIT 3;

-- (3) Display county's name with the largest number of communities
SELECT counties.name
  FROM counties
  JOIN communities
    ON counties.id = communities.county_id
  GROUP BY counties.name
  ORDER BY COUNT(communities.county_id) DESC
  LIMIT 1;

-- (4) Display locations, that belong to more than one category
SELECT name
  FROM communities
  GROUP BY name
  HAVING COUNT(name) > 2;
