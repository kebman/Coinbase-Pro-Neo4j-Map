// Create cryptocurrency nodes

CREATE CONSTRAINT coinIdConstraint ON (coin:Coin) ASSERT coin.id IS UNIQUE

LOAD CSV WITH HEADERS FROM "file:///coinbasecoins20210514.csv" AS csvLine
CREATE (p:Coin {coin: csvLine.Coin, ticker: csvLine.Ticker})

CREATE INDEX FOR (c:Coin) ON (c.ticker)

// Create cryptocurrency pairs (the relationship between the nodes)

LOAD CSV WITH HEADERS FROM "file:///relationships20210514.csv" AS row
MATCH (c1:Coin {ticker:row.base}), (c2:Coin {ticker:row.quote})
MERGE (c1)-[:QUOTED_IN]->(c2);
