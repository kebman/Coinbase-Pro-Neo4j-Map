// Create cryptocurrency pair relationships

LOAD CSV WITH HEADERS FROM "file:///relationships20210514.csv" AS row
MATCH (c1:Coin {ticker:row.base}), (c2:Coin {ticker:row.quote})
MERGE (c1)-[:QUOTED_IN]->(c2);
