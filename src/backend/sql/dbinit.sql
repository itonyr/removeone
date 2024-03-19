-- Extensions - UUID Support
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
-- Table: Items
CREATE TABLE Items (
    itemId UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    itemName VARCHAR,
    categoryId INT REFERENCES Lookup_ItemCategories(categoryId),
    isEnabled BOOLEAN,
    createdOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Table: Lookup_ItemCategories
CREATE TABLE Lookup_ItemCategories (
    categoryId SERIAL PRIMARY KEY,
    categoryName VARCHAR,
    categoryDescription TEXT,
    isEnabled BOOLEAN NOT NULL,
    createdByUserId UUID REFERENCES Users(userId) NOT NULL
);
-- Table: Comparisons
CREATE TABLE Comparisons (
    comparisonId UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    createdOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expiryDate TIMESTAMP,
    item1_itemId UUID REFERENCES Items(itemId),
    item2_itemId UUID REFERENCES Items(itemId),
    item3_itemId UUID REFERENCES Items(itemId),
    createdByUserId UUID REFERENCES Users(userId)
);
-- Table: Users
CREATE TABLE Users (
    userId UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    userName VARCHAR,
    lastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    isEnabled BOOLEAN
);
-- Table: Items_Icons
CREATE TABLE Items_Icons (
    iconId UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
    itemId UUID REFERENCES Items(itemId),
    IconUrl TEXT,
    lastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    createdByUserId UUID REFERENCES Users(userId),
    createdOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- Indexes
CREATE INDEX idx_items_categoryId ON Items (categoryId);
CREATE INDEX idx_comparisons_item1_itemId ON Comparisons (item1_itemId);
CREATE INDEX idx_comparisons_item2_itemId ON Comparisons (item2_itemId);
CREATE INDEX idx_comparisons_item3_itemId ON Comparisons (item3_itemId);
CREATE INDEX idx_comparisons_createdByUserId ON Comparisons (createdByUserId);
CREATE INDEX idx_items_icons_itemId ON Items_Icons (itemId);
CREATE INDEX idx_items_icons_createdByUserId ON Items_Icons (createdByUserId);

-- Initial User Accounts 
INSERT INTO Users (UserId, userName, isEnabled)
VALUES (
        'ce5b7987-4499-4150-af98-7c35b49e6000',
        'tony',
        true
    );

-- Initial Item Categories
INSERT INTO Lookup_ItemCategories (categoryName, isEnabled, createdByUserId)
VALUES (
        'FastFood',
        true,
        'ce5b7987-4499-4150-af98-7c35b49e6000'
    ),(
        'Candy',
        true,
        'ce5b7987-4499-4150-af98-7c35b49e6000'
    ),(
        'Retail',
        true,
        'ce5b7987-4499-4150-af98-7c35b49e6000'
    ),(
        'Chips',
        true,
        'ce5b7987-4499-4150-af98-7c35b49e6000'
    );

-- Initial items in the fastfood category 
INSERT INTO Items (itemName, categoryId, isEnabled)
VALUES ('McDonald''s', 1, true),
    ('Subway', 1, true),
    ('Starbucks', 1, true),
    ('Burger King', 1, true),
    ('Wendy''s', 1, true),
    ('Taco Bell', 1, true),
    ('Dunkin''', 1, true),
    ('Pizza Hut', 1, true),
    ('KFC (Kentucky Fried Chicken)', 1, true),
    ('Chick-fil-A', 1, true),
    ('Domino''s Pizza', 1, true),
    ('Chipotle Mexican Grill', 1, true),
    ('Sonic Drive-In', 1, true),
    ('Arby''s', 1, true),
    ('Dairy Queen', 1, true),
    ('Popeyes Louisiana Kitchen', 1, true),
    ('Panda Express', 1, true),
    ('Jimmy John''s', 1, true),
    ('Five Guys', 1, true),
    ('Little Caesars', 1, true);

-- Insert initial items into the Candy category
INSERT INTO Items (itemName, categoryId, isEnabled)
VALUES 
    ('Snickers', 2, true),
    ('Reese''s Peanut Butter Cups', 2, true),
    ('M&M''s', 2, true),
    ('Twix', 2, true),
    ('Hershey''s Milk Chocolate', 2, true),
    ('Skittles', 2, true),
    ('Kit Kat', 2, true),
    ('Sour Patch Kids', 2, true),
    ('Milky Way', 2, true),
    ('Starburst', 2, true),
    ('Butterfinger', 2, true),
    ('Tootsie Roll', 2, true),
    ('Swedish Fish', 2, true),
    ('Jolly Rancher', 2, true),
    ('Reese''s Pieces', 2, true),
    ('Airheads', 2, true),
    ('Nerds', 2, true),
    ('Smarties', 2, true),
    ('Twizzlers', 2, true),
    ('Gummy Worms', 2, true);

-- Insert initial items into the Retail category 

INSERT INTO Items (itemName, categoryId, isEnabled)
VALUES 
    ('Walmart', 3, true),
    ('Target', 3, true),
    ('Costco Wholesale', 3, true),
    ('The Home Depot', 3, true),
    ('Lowe''s', 3, true),
    ('Best Buy', 3, true),
    ('Macy''s', 3, true),
    ('Kohl''s', 3, true),
    ('JCPenney', 3, true),
    ('Sears', 3, true),
    ('Nordstrom', 3, true),
    ('Gap', 3, true),
    ('Old Navy', 3, true),
    ('Banana Republic', 3, true),
    ('H&M', 3, true),
    ('TJ Maxx', 3, true),
    ('Ross Dress for Less', 3, true),
    ('Marshalls', 3, true),
    ('Bed Bath & Beyond', 3, true),
    ('Barnes & Noble', 3, true);

-- Insert initial items into the Chips category

INSERT INTO Items (itemName, categoryId, isEnabled)
VALUES 
    ('Lay''s', 4, true),
    ('Doritos', 4, true),
    ('Pringles', 4, true),
    ('Ruffles', 4, true),
    ('Cheetos', 4, true),
    ('Tostitos', 4, true),
    ('Fritos', 4, true),
    ('Kettle Brand', 4, true),
    ('Cape Cod', 4, true),
    ('SunChips', 4, true),
    ('Popchips', 4, true),
    ('Wise', 4, true),
    ('Utz', 4, true),
    ('Herr''s', 4, true),
    ('Tim''s Cascade Style', 4, true),
    ('Zapp''s', 4, true),
    ('Snyder''s of Hanover', 4, true),
    ('Terra', 4, true),
    ('PopCorners', 4, true),
    ('Boulder Canyon', 4, true);
