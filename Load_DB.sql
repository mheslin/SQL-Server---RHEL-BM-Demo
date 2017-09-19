--- CREATE A SAMPLE DATABASE
CREATE DATABASE NH_MTN_DB; 
GO
--- VERIFY DATABASE CREATION
SELECT Name from sys.Databases;
GO
--- CHANGE CONTEXT TO NEW DATABASE
USE NH_MTN_DB;
GO
--- CREATE A TABLE
CREATE TABLE Peaks
(       id               INT,
        mountain         VARCHAR(50),
        elevation        INT)
GO
--- INSERT DATA into 
INSERT INTO Peaks VALUES (1,  'Washington',        6288);
INSERT INTO Peaks VALUES (2,  'Adams',             5774);
INSERT INTO Peaks VALUES (3,  'Jefferson',         5712);
INSERT INTO Peaks VALUES (4,  'Monroe',            5384);
INSERT INTO Peaks VALUES (5,  'Madison',           5367);
INSERT INTO Peaks VALUES (6,  'Lafayette',         5260);
INSERT INTO Peaks VALUES (7,  'Lincoln',           5089);
INSERT INTO Peaks VALUES (8,  'South Twin',        4902);
INSERT INTO Peaks VALUES (9,  'Carter Dome',       4832);
INSERT INTO Peaks VALUES (10, 'Moosilauke',        4802);
INSERT INTO Peaks VALUES (11, 'Eisenhower',        4780);
INSERT INTO Peaks VALUES (12, 'North Twin',        4761);
INSERT INTO Peaks VALUES (13, 'Carrigain',         4700);
INSERT INTO Peaks VALUES (14, 'Bond',              4698);
INSERT INTO Peaks VALUES (15, 'Middle Carter',     4610);
INSERT INTO Peaks VALUES (16, 'West Bond',         4540);
INSERT INTO Peaks VALUES (17, 'Garfield',          4500);
INSERT INTO Peaks VALUES (18, 'Liberty',           4459);
INSERT INTO Peaks VALUES (19, 'South Carter',      4430);
INSERT INTO Peaks VALUES (20, 'Wildcat A',         4422);
INSERT INTO Peaks VALUES (21, 'Hancock',           4420);
INSERT INTO Peaks VALUES (22, 'South Kinsman',     4358);
INSERT INTO Peaks VALUES (23, 'Field',             4340);
INSERT INTO Peaks VALUES (24, 'Osceola',           4340);
INSERT INTO Peaks VALUES (25, 'Flume',             4328);
INSERT INTO Peaks VALUES (26, 'South Hancock',     4319);
INSERT INTO Peaks VALUES (27, 'Pierce',            4310);
INSERT INTO Peaks VALUES (28, 'North Kinsman',     4293);
INSERT INTO Peaks VALUES (29, 'Willey',            4285);
INSERT INTO Peaks VALUES (30, 'Bondcliff',         4265);
INSERT INTO Peaks VALUES (31, 'Zealand',           4260);
INSERT INTO Peaks VALUES (32, 'North Tripyramid',  4180);
INSERT INTO Peaks VALUES (33, 'Cabot',             4170);
INSERT INTO Peaks VALUES (34, 'East Osceola',      4156);
INSERT INTO Peaks VALUES (35, 'Middle Tripyramid', 4140);
INSERT INTO Peaks VALUES (36, 'Cannon',            4100);
INSERT INTO Peaks VALUES (37, 'Hale',              4054);
INSERT INTO Peaks VALUES (38, 'Jackson',           4052);
INSERT INTO Peaks VALUES (39, 'Tom',               4051);
INSERT INTO Peaks VALUES (40, 'Wildcat D',         4050);
INSERT INTO Peaks VALUES (41, 'Moriah',            4049);
INSERT INTO Peaks VALUES (42, 'Passaconaway',      4043);
INSERT INTO Peaks VALUES (43, 'Owls Head',         4025);
INSERT INTO Peaks VALUES (44, 'Galehead',          4024);
INSERT INTO Peaks VALUES (45, 'Whiteface',         4020);
INSERT INTO Peaks VALUES (46, 'Waumbek',           4006);
INSERT INTO Peaks VALUES (47, 'Isolation',         4004);
INSERT INTO Peaks VALUES (48, 'Tecumseh',          4003);
GO
