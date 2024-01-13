CREATE TABLE CraftBeer (
    BeerID INT PRIMARY KEY,
    BeerName VARCHAR(255) NOT NULL,
    BrewerID INT,
    StyleID INT,
    ABV DECIMAL(4, 2),
    IBU INT,
    Description TEXT,
    ReleaseDate DATE,
    Rating DECIMAL(3, 2),
    StockQuantity INT,
    Price DECIMAL(5, 2)
);

CREATE TABLE Brewer (
    BrewerID INT PRIMARY KEY,
    BrewerName VARCHAR(255) NOT NULL,
    Location VARCHAR(255),
    EstablishedYear INT
);

CREATE TABLE BeerStyle (
    StyleID INT PRIMARY KEY,
    StyleName VARCHAR(50) NOT NULL
);
-- Insert data into Brewer table
INSERT INTO Brewer (BrewerID, BrewerName, Location, EstablishedYear)
VALUES
    (1, 'Crafty Brews', 'Cityville, CA, USA', 2010),
    (2, 'Hop Haven', 'Brewtown, OR, USA', 2005),
    (3, 'Malt Magic', 'Alestown, NY, USA', 2012);

-- Insert data into BeerStyle table
INSERT INTO BeerStyle (StyleID, StyleName)
VALUES
    (1, 'IPA'),
    (2, 'Stout'),
    (3, 'Pale Ale'),
    (4, 'Wheat Beer'),
    (5, 'Sour');

-- Insert data into CraftBeer table
select * from CraftBeer;
select * from Brewer;
select * from BeerStyle;

CREATE VIEW BeerDetails AS
SELECT c.BeerID, c.BeerName, b.BrewerName, s.StyleName, c.ABV, c.IBU, c.Description, c.ReleaseDate, c.Rating, c.StockQuantity, c.Price
FROM CraftBeer c
JOIN Brewer b ON c.BrewerID = b.BrewerID
JOIN BeerStyle s ON c.StyleID = s.StyleID;
