// Create cryptocurrency nodes

CREATE CONSTRAINT coinIdConstraint ON (coin:Coin) ASSERT coin.id IS UNIQUE

LOAD CSV WITH HEADERS FROM "file://coinbasecoins20210514.csv" AS csvLine
CREATE (p:Coin {coin: csvLine.Coin, ticker: csvLine.Ticker})

CREATE INDEX FOR (c:Coin) ON (c.ticker)
