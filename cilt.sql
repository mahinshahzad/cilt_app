-- Create a new database named 'cilt'
-- CREATE DATABASE cilt;
--GO

--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@THIS IS THE CORRECT ONE ########################

-- Use the new database 'cilt'
USE cilt;

-- Create the business_unit table
CREATE TABLE business_unit (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create the process table
CREATE TABLE process (
    id INT IDENTITY(1,1) PRIMARY KEY,
    business_unit_id INT,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (business_unit_id) REFERENCES business_unit(id)
);

-- Create the machine table
CREATE TABLE machine (
    id INT IDENTITY(1,1) PRIMARY KEY,
    process_id INT,
    number INT NOT NULL,
    FOREIGN KEY (process_id) REFERENCES process(id)
);

-- Create the sub_area table
CREATE TABLE sub_area (
    id INT IDENTITY(1,1) PRIMARY KEY,
    machine_id INT,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (machine_id) REFERENCES machine(id)
);

-- Insert into business_unit table
INSERT INTO business_unit (name) VALUES ('Bufp');

-- Get the id of the 'Bufp' business_unit
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

-- Insert into process table for 'Art Studio'
-- INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Art Studio');

-- Get the id of the 'Art Studio' process
DECLARE @process_id_art_studio INT;
SELECT @process_id_art_studio = id FROM process WHERE business_unit_id = @business_unit_id AND name = 'Art Studio';

-- Insert into machine table for 'Art Studio'
--INSERT INTO machine (process_id, number) VALUES (@process_id_art_studio, 24501);

-- Get the id of the machine for 'Art Studio'
DECLARE @machine_id_art_studio INT;
SELECT @machine_id_art_studio = id FROM machine WHERE process_id = @process_id_art_studio AND number = 24501;

-- Insert sub_areas for the 'Art Studio' machine
-- INSERT INTO sub_area (machine_id, name) VALUES 
-- (@machine_id_art_studio, 'Hp Lasor Ploter Printer Old'),
-- (@machine_id_art_studio, 'Epson Surecolor P7000 Std Printer'),
-- (@machine_id_art_studio, 'Scanner Of Art Area');

-- Insert into process table for 'Innovation and Development Lab'
-- INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Innovation and Development Lab');

-- Get the id of the 'Innovation and Development Lab' process
DECLARE @process_id_innovation INT;
SELECT @process_id_innovation = id FROM process WHERE business_unit_id = @business_unit_id AND name = 'Innovation and Development Lab';

-- Insert into machine table for 'Innovation and Development Lab'
-- INSERT INTO machine (process_id, number) VALUES (@process_id_innovation, 26016);

-- Get the id of the machine for 'Innovation and Development Lab'
DECLARE @machine_id_innovation INT;
SELECT @machine_id_innovation = id FROM machine WHERE process_id = @process_id_innovation AND number = 26016;

-- Insert sub_areas for the 'Innovation and Development Lab' machine
-- INSERT INTO sub_area (machine_id, name) VALUES 
-- (@machine_id_innovation, 'Heat sealer (rdm)'),
-- (@machine_id_innovation, 'Heat sealer temperature controlle'),
-- (@machine_id_innovation, 'Tensile tester (lloyd instrument)'),
-- (@machine_id_innovation, 'J & b hot trak tester'),
-- (@machine_id_innovation, 'Wvtr (water vapor trans rate)'),
-- (@machine_id_innovation, 'Otr (oxygen transmission rate)'),
-- (@machine_id_innovation, 'Tear tester (amityville)'),
-- (@machine_id_innovation, 'Flex tester (idm)'),
-- (@machine_id_innovation, 'Film shrinkage tester (gbpi)'),
-- (@machine_id_innovation, 'Autoclave'),
-- (@machine_id_innovation, 'Hot air circulation oven memmert'),
-- (@machine_id_innovation, 'Optical density meter (x-rite)'),
-- (@machine_id_innovation, 'Film opacity meter'),
-- (@machine_id_innovation, 'Incubator (20l)'),
-- (@machine_id_innovation, 'Gen_innovation & development lab');


-- run from this:

-- Use the existing database 'cilt'
USE cilt;

-- Ensure 'Bufp' business unit exists or insert it
IF NOT EXISTS (SELECT 1 FROM business_unit WHERE name = 'Bufp')
BEGIN
    INSERT INTO business_unit (name) VALUES ('Bufp');
END

-- Get the id of the 'Bufp' business_unit
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

-- Ensure 'Reproduction' process exists or insert it
IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Reproduction')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Reproduction');
END

-- Get the id of the 'Reproduction' process
DECLARE @process_id_reproduction INT;
SELECT @process_id_reproduction = id FROM process WHERE business_unit_id = @business_unit_id AND name = 'Reproduction';

-- Insert Machine no: 22463 if it doesn't already exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = @process_id_reproduction AND number = 22463)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (@process_id_reproduction, 22463);
END

-- Get the id of Machine no: 22463
DECLARE @machine_id_22463 INT;
SELECT @machine_id_22463 = id FROM machine WHERE process_id = @process_id_reproduction AND number = 22463;

-- Insert sub_areas for Machine no: 22463 if they don't already exist
MERGE sub_area AS target
USING (VALUES
    (@machine_id_22463, 'ELECTRICAL PANEL OF 22463'),
    (@machine_id_22463, 'Cylinder Drive motor'),
    (@machine_id_22463, 'V-belt'),
    (@machine_id_22463, 'Free wheels'),
    (@machine_id_22463, 'Rubber Amotizer')
) AS source (machine_id, name)
ON (target.machine_id = source.machine_id AND target.name = source.name)
WHEN NOT MATCHED THEN
    INSERT (machine_id, name) VALUES (source.machine_id, source.name);

-- Insert Machine no: 22460 if it doesn't already exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = @process_id_reproduction AND number = 22460)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (@process_id_reproduction, 22460);
END

-- Get the id of Machine no: 22460
DECLARE @machine_id_22460 INT;
SELECT @machine_id_22460 = id FROM machine WHERE process_id = @process_id_reproduction AND number = 22460;

-- Insert sub_areas for Machine no: 22460 if they don't already exist
MERGE sub_area AS target
USING (VALUES
    (@machine_id_22460, 'ELECTRICAL PANEL OF 22460'),
    (@machine_id_22460, 'Drive chain'),
    (@machine_id_22460, 'Drive Gear with steel'),
    (@machine_id_22460, 'Chain sprocket'),
    (@machine_id_22460, 'Carbon Brushes'),
    (@machine_id_22460, 'Anode Basket'),
    (@machine_id_22460, 'Exhaust system'),
    (@machine_id_22460, 'Acid pump'),
    (@machine_id_22460, 'Cylinder Adaptor'),
    (@machine_id_22460, 'Centering follow side'),
    (@machine_id_22460, 'Centering drive side'),
    (@machine_id_22460, 'Chain sprocket'),
    (@machine_id_22460, 'cylinder drive motor')
) AS source (machine_id, name)
ON (target.machine_id = source.machine_id AND target.name = source.name)
WHEN NOT MATCHED THEN
    INSERT (machine_id, name) VALUES (source.machine_id, source.name);

-- Insert Machine no: 22462 if it doesn't already exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = @process_id_reproduction AND number = 22462)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (@process_id_reproduction, 22462);
END

-- Get the id of Machine no: 22462
DECLARE @machine_id_22462 INT;
SELECT @machine_id_22462 = id FROM machine WHERE process_id = @process_id_reproduction AND number = 22462;

-- Insert sub_areas for Machine no: 22462 if they don't already exist
MERGE sub_area AS target
USING (VALUES
    (@machine_id_22462, 'ELECTRICAL PANEL OF 22462'),
    (@machine_id_22462, 'Auto door'),
    (@machine_id_22462, 'current transfar rings'),
    (@machine_id_22462, 'cylinder drive motor'),
    (@machine_id_22462, 'pressure cones both side'),
    (@machine_id_22462, 'pressure cones brass shafts both side'),
    (@machine_id_22462, 'lead screw nut with brass bushes'),
    (@machine_id_22462, 'Lead screw drive motor'),
    (@machine_id_22462, 'Exhaust system')
) AS source (machine_id, name)
ON (target.machine_id = source.machine_id AND target.name = source.name)
WHEN NOT MATCHED THEN
    INSERT (machine_id, name) VALUES (source.machine_id, source.name);

-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;


---------------------------------------------------
-- REFERENCE ALL PROCESSES TO THE SAME BUSINESS UNIT ID: 


-- Use the existing database 'cilt'
USE cilt;

-- Get the id of the 'Bufp' business_unit
DECLARE @bufp_business_unit_id INT;
SELECT @bufp_business_unit_id = id FROM business_unit WHERE name = 'Bufp';

-- Update the business_unit_id of all processes to the 'Bufp' business_unit_id
UPDATE process
SET business_unit_id = @bufp_business_unit_id;

-- View the process table to verify the update
SELECT * FROM process;

---------------------------------------------------
-- REMOVE REPEATING BUSINESS UNIT ENTRIES 

-- Use the existing database 'cilt'
USE cilt;

-- Step 1: Get the id of the 'Bufp' business_unit to keep
DECLARE @correct_business_unit_id INT;
SELECT @correct_business_unit_id = id FROM business_unit WHERE name = 'Bufp';

-- Step 2: Update all related processes to reference the correct business_unit
UPDATE process
SET business_unit_id = @correct_business_unit_id
WHERE business_unit_id IN (SELECT id FROM business_unit WHERE name = 'Bufp' AND id != @correct_business_unit_id);

-- Step 3: Delete the duplicate business_unit entries
DELETE FROM business_unit
WHERE name = 'Bufp' AND id != @correct_business_unit_id;

-- View the updated business_unit table
SELECT * FROM business_unit;

-- View the updated process table
SELECT * FROM process;


-------------------------
-- DELETE FIRST REPEATING ART STUDIO FROM PROCESS TABLE

-- Use the existing database 'cilt'
USE cilt;

-- Delete the entry with id 1 from the process table
DELETE FROM process
WHERE id = 1;

-- View the updated process table
SELECT * FROM process;


-------------------------
-- DELETE FIRST REPEATING REPRODUCTION FROM PROCESS TABLE

-- Use the existing database 'cilt'
USE cilt;

-- Delete the entry with id 1 from the process table
DELETE FROM process
WHERE id = 4;

-- View the updated process table
SELECT * FROM process;


-------------------------
-- DELETE FROM MACHINE NO TBALE ALL REPEATING ENTRIES

-- Use the existing database 'cilt'
USE cilt;

-- Delete the entry with id 3 from the machine table
DELETE FROM machine
WHERE id = 5;

-- View the updated machine table
SELECT * FROM machine;

-------------------------
-- DELETE FROM SUB AREA TBALE ALL REPEATING ENTRIES

-- Use the existing database 'cilt'
USE cilt;

-- Delete entries with IDs from 19 to 45 in the sub_area table
DELETE FROM sub_area
WHERE id BETWEEN 19 AND 45;

-- View the updated sub_area table
SELECT * FROM sub_area;


-------------------------
-- ADDING TWO MACHINES INTO REPRODUCTION

-- Use the existing database 'cilt'
USE cilt;

-- Insert Machine no: 22430
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22430)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22430);
END

-- Get the id of Machine no: 22430
DECLARE @machine_id_22430 INT;
SELECT @machine_id_22430 = id FROM machine WHERE process_id = 5 AND number = 22430;

-- Insert sub_areas for Machine no: 22430
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22430, 'ELECTRICAL PANEL OF 22430'),
(@machine_id_22430, 'cylinder cleaning motor'),
(@machine_id_22430, 'Drive chain'),
(@machine_id_22430, 'Centering drive side'),
(@machine_id_22430, 'Centering follow side'),
(@machine_id_22430, 'Cylinder Adaptor'),
(@machine_id_22430, 'Acid pump'),
(@machine_id_22430, 'Dozing Pump'),
(@machine_id_22430, 'Anode Basket'),
(@machine_id_22430, 'Anode Basket up down motor'),
(@machine_id_22430, 'Filter housing'),
(@machine_id_22430, 'Anode adjusment'),
(@machine_id_22430, 'Carbon Brushes'),
(@machine_id_22430, 'Recyling unit reduction'),
(@machine_id_22430, 'Led Anode'),
(@machine_id_22430, 'Drive Gear with steel'),
(@machine_id_22430, 'Chain sprocket');

-- Insert Machine no: 22431
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22431)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22431);
END

-- Get the id of Machine no: 22431
DECLARE @machine_id_22431 INT;
SELECT @machine_id_22431 = id FROM machine WHERE process_id = 5 AND number = 22431;

-- Insert sub_areas for Machine no: 22431
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22431, 'OVER HEAD HOIST FOR OLD CU-TANKS'),
(@machine_id_22431, 'ELECTRICAL PANEL OF 22430'),
(@machine_id_22431, 'Drive gear'),
(@machine_id_22431, 'Drive chain'),
(@machine_id_22431, 'Chain sprocket'),
(@machine_id_22431, 'Gear with steel'),
(@machine_id_22431, 'Centring drive side'),
(@machine_id_22431, 'Centring flow side'),
(@machine_id_22431, 'Anode basket'),
(@machine_id_22431, 'reduction unit'),
(@machine_id_22431, 'basket motor up & down'),
(@machine_id_22431, 'Carbun brushes'),
(@machine_id_22431, 'Carbon holders'),
(@machine_id_22431, 'Acid pump'),
(@machine_id_22431, 'Dozing pump'),
(@machine_id_22431, 'Adaptors for cylinders'),
(@machine_id_22431, 'Reduction unit pump');

-- Insert Machine no: 22432
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22432)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22432);
END

-- Get the id of Machine no: 22432
DECLARE @machine_id_22432 INT;
SELECT @machine_id_22432 = id FROM machine WHERE process_id = 5 AND number = 22432;

-- Insert sub_areas for Machine no: 22432
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22432, 'ELECTRICAL PANEL OF 22432'),
(@machine_id_22432, 'cylinder drive motor'),
(@machine_id_22432, 'pressure cones both side'),
(@machine_id_22432, 'lead screw nut with brass bushes'),
(@machine_id_22432, 'Lead screw drive motor'),
(@machine_id_22432, 'Carbon brushes both side'),
(@machine_id_22432, 'Cool child water carbon brushes both side'),
(@machine_id_22432, 'Side seal rubber packing both side'),
(@machine_id_22432, 'Exhaust system'),
(@machine_id_22432, 'pressure cones brass shafts both side'),
(@machine_id_22432, 'Auto door'),
(@machine_id_22432, 'Cool child water carbon brushes both side'),
(@machine_id_22432, 'Carbon brushes both side');

-- View the machine table
SELECT * FROM machine WHERE process_id = 5;

-- View the sub_area table for the new machines
SELECT * FROM sub_area WHERE machine_id IN (@machine_id_22430, @machine_id_22431, @machine_id_22432);


----------------------------
-- INSERT MORE MACHINES INTO REPRODUCTION !!!!!!! RUN FROM HERE!!!!!!

-- Use the existing database 'cilt'
USE cilt;

-- Insert Machine no: 22440
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22440)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22440);
END

-- Get the id of Machine no: 22440
DECLARE @machine_id_22440 INT;
SELECT @machine_id_22440 = id FROM machine WHERE process_id = 5 AND number = 22440;

-- Insert sub_areas for Machine no: 22440
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22440, 'MAIN SPINDLE HEAD OF POLISH MASTER'),
(@machine_id_22440, 'FINE DIAMOND OF POLISH MASTER'),
(@machine_id_22440, 'Emulsion OF POLISH MASTER'),
(@machine_id_22440, 'Air Gauge OF POLISH MASTER'),
(@machine_id_22440, 'Emulsion level OF POLISH MASTER'),
(@machine_id_22440, 'Half Sheell fp OF POLISH MASTER'),
(@machine_id_22440, 'Half Sheell Lemanic OF POLISH MASTER'),
(@machine_id_22440, 'Little coupling OF POLISH MASTER'),
(@machine_id_22440, 'Pneumatic Break OF POLISH MASTER'),
(@machine_id_22440, 'Emulsion filters OF POLISH MASTER'),
(@machine_id_22440, 'Central Lubrecation pum OF POLISH MASTER'),
(@machine_id_22440, 'Emulsion pump OF POLISH MASTER'),
(@machine_id_22440, 'Chip Collector OF POLISH MASTER'),
(@machine_id_22440, 'Chip bag OF POLISH MASTER'),
(@machine_id_22440, 'Lead Screw nut OF POLISH MASTER'),
(@machine_id_22440, 'OVER HEAD HOIST FOR POLISH MASTER');

-- Insert Machine no: 22441
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22441)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22441);
END

-- Get the id of Machine no: 22441
DECLARE @machine_id_22441 INT;
SELECT @machine_id_22441 = id FROM machine WHERE process_id = 5 AND number = 22441;

-- Insert sub_areas for Machine no: 22441
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22441, 'ELECTRICAL PANEL OF 22441'),
(@machine_id_22441, 'polishing head # 01'),
(@machine_id_22441, 'polishing head # 02'),
(@machine_id_22441, 'grinding head # 01'),
(@machine_id_22441, 'cutting head'),
(@machine_id_22441, 'pressure cones both side'),
(@machine_id_22441, 'lead screw nut with brass bushes'),
(@machine_id_22441, 'Lead screw drive motor'),
(@machine_id_22441, 'Auto door'),
(@machine_id_22441, 'Water circulation pumps'),
(@machine_id_22441, 'greasing dozing pump'),
(@machine_id_22441, 'guide ways');

-- Insert Machine no: 22442
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22442)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22442);
END

-- Get the id of Machine no: 22442
DECLARE @machine_id_22442 INT;
SELECT @machine_id_22442 = id FROM machine WHERE process_id = 5 AND number = 22442;

-- Insert sub_areas for Machine no: 22442
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22442, 'ELECTRICAL PANEL OF 22442'),
(@machine_id_22442, 'polishing head # 01'),
(@machine_id_22442, 'polishing head # 02'),
(@machine_id_22442, 'Paper polishing head #03'),
(@machine_id_22442, 'cylinder drive motor'),
(@machine_id_22442, 'Pinonil both side'),
(@machine_id_22442, 'pressure cones'),
(@machine_id_22442, 'lead screw nut with brass bushes'),
(@machine_id_22442, 'Star coupling both side');

-- Insert Machine no: 22443
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22443)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22443);
END

-- Get the id of Machine no: 22443
DECLARE @machine_id_22443 INT;
SELECT @machine_id_22443 = id FROM machine WHERE process_id = 5 AND number = 22443;

-- Insert sub_areas for Machine no: 22443
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22443, 'ELECTRICAL PANEL OF 22443'),
(@machine_id_22443, 'Auto door'),
(@machine_id_22443, 'grinding head # 01'),
(@machine_id_22443, 'grinding head # 02'),
(@machine_id_22443, 'paper polishing head'),
(@machine_id_22443, 'cutting head'),
(@machine_id_22443, 'pressure cones both side'),
(@machine_id_22443, 'greasing dozing pump'),
(@machine_id_22443, 'Water circulation pumps'),
(@machine_id_22443, 'Lead screw drive motor'),
(@machine_id_22443, 'greasing dozing pump'),
(@machine_id_22443, 'lead screw nut with brass bushes');

-- Insert Machine no: 22450
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22450)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22450);
END

-- Get the id of Machine no: 22450
DECLARE @machine_id_22450 INT;
SELECT @machine_id_22450 = id FROM machine WHERE process_id = 5 AND number = 22450;

-- Insert sub_areas for Machine no: 22450
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22450, 'ELECTRICAL PANEL OF 22450');


-- Insert Machine no: 22453
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22453)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22453);
END

-- Get the id of Machine no: 22453
DECLARE @machine_id_22453 INT;
SELECT @machine_id_22453 = id FROM machine WHERE process_id = 5 AND number = 22453;

-- Insert sub_areas for Machine no: 22453
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22453, 'Drive Side'),
(@machine_id_22453, 'Head Assembly'),
(@machine_id_22453, 'NON Drive Side'),
(@machine_id_22453, 'Suction System');

-- Use the existing database 'cilt'
USE cilt;

-- Insert Machine no: 22454
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22454)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22454);
END

-- Get the id of Machine no: 22454
DECLARE @machine_id_22454 INT;
SELECT @machine_id_22454 = id FROM machine WHERE process_id = 5 AND number = 22454;

-- Insert sub_areas for Machine no: 22454
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22454, 'ENGRAVING HEAD OF ENGRAVER K5 22454'),
(@machine_id_22454, 'Drive Side of K5 Smart 22454'),
(@machine_id_22454, 'NON Drive Side of K5 Smart 22454'),
(@machine_id_22454, 'VACCUM SECTION OF ENGRAVER K5 22454');

-- Insert Machine no: 22455
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22455)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22455);
END

-- Get the id of Machine no: 22455
DECLARE @machine_id_22455 INT;
SELECT @machine_id_22455 = id FROM machine WHERE process_id = 5 AND number = 22455;

-- Insert sub_areas for Machine no: 22455
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22455, 'CYLINDER DRIVE SYS OF ENGRAVER K5 SMART'),
(@machine_id_22455, 'ENGRAVING HEAD OF ENGRAVER K5 SMART'),
(@machine_id_22455, 'VACCUM SECTION OF ENGRAVER K5 SMART'),
(@machine_id_22455, 'ELECTRICAL SYSTEM OF ENGRAVER K5 SMART'),
(@machine_id_22455, 'BACKUP POWER SYSTEM OF ENGRAVER K5 SMART');

-- Insert Machine no: 22470
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22470)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22470);
END

-- Get the id of Machine no: 22470
DECLARE @machine_id_22470 INT;
SELECT @machine_id_22470 = id FROM machine WHERE process_id = 5 AND number = 22470;

-- Insert sub_areas for Machine no: 22470
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22470, 'ELECTRICAL PANEL OF 22470'),
(@machine_id_22470, 'cylinder drive motor'),
(@machine_id_22470, 'Chain sprocket'),
(@machine_id_22470, 'Drive chain'),
(@machine_id_22470, 'Drive Gear with steel'),
(@machine_id_22470, 'Cylinder Adaptor'),
(@machine_id_22470, 'Centering drive side'),
(@machine_id_22470, 'Centering follow side'),
(@machine_id_22470, 'Acid pump'),
(@machine_id_22470, 'Anode Basket'),
(@machine_id_22470, 'Exhaust system'),
(@machine_id_22470, 'Cylinder Adaptor'),
(@machine_id_22470, 'Carbon Brushes'),
(@machine_id_22470, 'Heaters');

--------------------------------
-- RUN FROM HERE LAST EDITED 2:31PM 16TH JULY

USE cilt;

-- Insert Machine no: 22472
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22472)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22472);
END

-- Get the id of Machine no: 22472
DECLARE @machine_id_22472 INT;
SELECT @machine_id_22472 = id FROM machine WHERE process_id = 5 AND number = 22472;

-- Insert sub_areas for Machine no: 22472
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22472, 'ELECTRICAL PANEL OF 22472'),
(@machine_id_22472, 'Exhaust system'),
(@machine_id_22472, 'Carbon brushes both side'),
(@machine_id_22472, 'Cool child water carbon brushes both side'),
(@machine_id_22472, 'pressure cones brass shafts both side'),
(@machine_id_22472, 'Side seal rubber packing both side'),
(@machine_id_22472, 'lead screw nut with brass bushes'),
(@machine_id_22472, 'Lead screw drive motor'),
(@machine_id_22472, 'pressure cones brass shafts both side'),
(@machine_id_22472, 'pressure cones both side'),
(@machine_id_22472, 'cylinder drive motor'),
(@machine_id_22472, 'Auto door'),
(@machine_id_22472, 'current transfar rings both side');

-- Insert Machine no: 22471
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22471)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22471);
END

-- Get the id of Machine no: 22471
DECLARE @machine_id_22471 INT;
SELECT @machine_id_22471 = id FROM machine WHERE process_id = 5 AND number = 22471;

-- Insert sub_areas for Machine no: 22471
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22471, 'ELECTRICAL PANEL OF 22471'),
(@machine_id_22471, 'Paper polishing head'),
(@machine_id_22471, 'Pinole both side'),
(@machine_id_22471, 'Winding & Unwinding unit'),
(@machine_id_22471, 'Lead screw drive motor'),
(@machine_id_22471, 'lead screw nut with brass bushes'),
(@machine_id_22471, 'Star coupling both side'),
(@machine_id_22471, 'Cylinder drive gear box'),
(@machine_id_22471, 'Slinding pvc bearing to botom'),
(@machine_id_22471, 'Cones both side'),
(@machine_id_22471, 'Tooth rack'),
(@machine_id_22471, 'Tooth gear');

-- Insert Machine no: 22480
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22480)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22480);
END

-- Get the id of Machine no: 22480
DECLARE @machine_id_22480 INT;
SELECT @machine_id_22480 = id FROM machine WHERE process_id = 5 AND number = 22480;

-- Insert sub_areas for Machine no: 22480
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22480, 'blanket for drum'),
(@machine_id_22480, 'Doctor blade'),
(@machine_id_22480, 'Blade holder'),
(@machine_id_22480, 'Pressure cones'),
(@machine_id_22480, 'Air turbine motor'),
(@machine_id_22480, 'Exhaust system OF PROOF'),
(@machine_id_22480, 'cylinder cleaning motor'),
(@machine_id_22480, 'Hydrulic pump'),
(@machine_id_22480, 'Hydrulic shocks');

-- Insert Machine no: 22482
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22482)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22482);
END

-- Get the id of Machine no: 22482
DECLARE @machine_id_22482 INT;
SELECT @machine_id_22482 = id FROM machine WHERE process_id = 5 AND number = 22482;

-- Insert sub_areas for Machine no: 22482
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22482, 'DRUM UNIT OF PROOF PRESS 22482'),
(@machine_id_22482, 'Hydrulic pump'),
(@machine_id_22482, 'lock un lock arm'),
(@machine_id_22482, 'cylinder clampings'),
(@machine_id_22482, 'Exhaust system'),
(@machine_id_22482, 'Pnumatic system');

-- Insert Machine no: 22473
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22473)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22473);
END

-- Get the id of Machine no: 22473
DECLARE @machine_id_22473 INT;
SELECT @machine_id_22473 = id FROM machine WHERE process_id = 5 AND number = 22473;

-- Insert sub_areas for Machine no: 22473
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22473, 'ELECTRICAL PANEL OF 22473'),
(@machine_id_22473, 'Cylinder drive motor of balancing m/c'),
(@machine_id_22473, 'drive belt of balancing m/c'),
(@machine_id_22473, 'free wheels of balancing m/c'),
(@machine_id_22473, 'locking & unlocking sys of balancing m/c'),
(@machine_id_22473, 'of balancing m/c');

-- Insert Machine no: 22422
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22422)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22422);
END

-- Get the id of Machine no: 22422
DECLARE @machine_id_22422 INT;
SELECT @machine_id_22422 = id FROM machine WHERE process_id = 5 AND number = 22422;

-- Insert sub_areas for Machine no: 22422
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22422, 'ELECTRICAL PANEL OF 22422');

-- Insert Machine no: 22121
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22121)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22121);
END

-- Get the id of Machine no: 22121
DECLARE @machine_id_22121 INT;
SELECT @machine_id_22121 = id FROM machine WHERE process_id = 5 AND number = 22121;

-- Insert sub_areas for Machine no: 22121
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22121, 'ELECTRICAL PANEL OF 22121'),
(@machine_id_22121, 'pneumatic shock'),
(@machine_id_22121, 'pneumatic cylinder drive'),
(@machine_id_22121, 'Cameras'),
(@machine_id_22121, 'pneumatic cylinder up & down bed'),
(@machine_id_22121, 'Lead screw nut'),
(@machine_id_22121, 'mounting drum'),
(@machine_id_22121, 'mounting mendral'),
(@machine_id_22121, 'tooth rack'),
(@machine_id_22121, 'cameras'),
(@machine_id_22121, 'devider head motor'),
(@machine_id_22121, 'drive motor for mendral'),
(@machine_id_22121, 'drive motor for mendral up & down');

-- Insert Machine no: 22150
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22150)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22150);
END

-- Get the id of Machine no: 22150
DECLARE @machine_id_22150 INT;
SELECT @machine_id_22150 = id FROM machine WHERE process_id = 5 AND number = 22150;

-- Insert sub_areas for Machine no: 22150
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22150, 'ELECTRICAL PANEL OF 22150'),
(@machine_id_22150, 'winding unit'),
(@machine_id_22150, 'wending axel'),
(@machine_id_22150, 'treeting unit'),
(@machine_id_22150, 'printing cylinder'),
(@machine_id_22150, 'doctor blade'),
(@machine_id_22150, 'blade holder'),
(@machine_id_22150, 'cylinder holding unit'),
(@machine_id_22150, 'cylinder drive motor'),
(@machine_id_22150, 'drive motor winding unit'),
(@machine_id_22150, 'drive motor unwinding unit'),
(@machine_id_22150, 'all bearings'),
(@machine_id_22150, 'blade chamber screws'),
(@machine_id_22150, 'chiller unit'),
(@machine_id_22150, 'chamber lock system'),
(@machine_id_22150, 'impression roller adjuster'),
(@machine_id_22150, 'penumatic cylinders'),
(@machine_id_22150, 'Safety couplings');

-- Insert Machine no: 22286
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22286)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22286);
END

-- Get the id of Machine no: 22286
DECLARE @machine_id_22286 INT;
SELECT @machine_id_22286 = id FROM machine WHERE process_id = 5 AND number = 22286;

-- Insert sub_areas for Machine no: 22286
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22286, 'ELECTRICAL PANEL OF 22286');

-- Insert Machine no: 22421
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22421)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22421);
END

-- Get the id of Machine no: 22421
DECLARE @machine_id_22421 INT;
SELECT @machine_id_22421 = id FROM machine WHERE process_id = 5 AND number = 22421;

-- Insert sub_areas for Machine no: 22421
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22421, 'ELECTRICAL PANEL OF 22421');

-- Insert Machine no: 22420
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22420)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22420);
END

-- Get the id of Machine no: 22420
DECLARE @machine_id_22420 INT;
SELECT @machine_id_22420 = id FROM machine WHERE process_id = 5 AND number = 22420;

-- Insert sub_areas for Machine no: 22420
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22420, 'ELECTRICAL PANEL OF 22420');

-- Insert Machine no: 22423
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22423)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22423);
END

-- Get the id of Machine no: 22423
DECLARE @machine_id_22423 INT;
SELECT @machine_id_22423 = id FROM machine WHERE process_id = 5 AND number = 22423;

-- Insert sub_areas for Machine no: 22423
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22423, 'ELECTRICAL PANEL OF 22423'),
(@machine_id_22423, 'Lead screw drive motor'),
(@machine_id_22423, 'cameras'),
(@machine_id_22423, 'Main drive motor'),
(@machine_id_22423, 'Pneumatic shock'),
(@machine_id_22423, 'Mounting Mendral');


USE cilt;

-- Insert Machine no: 22400
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 5 AND number = 22400)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (5, 22400);
END

-- Get the id of Machine no: 22400
DECLARE @machine_id_22400 INT;
SELECT @machine_id_22400 = id FROM machine WHERE process_id = 5 AND number = 22400;


-----------------------------------------
-- CREATING NEW PROCESS EXTRUSION 2:42PM

USE cilt;


-- Insert into process table for extrusion
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Extrusion')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Extrusion');
END


---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!checking !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;



------------RUN FROM HERE 6:41PM--------------

USE cilt;

-- Insert machine number 22218 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22218)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22218);
END

-- Get the id of Machine no: 22218
DECLARE @machine_id_22218 INT;
SELECT @machine_id_22218 = id FROM machine WHERE process_id = 10 AND number = 22218;

-- Insert sub areas for Machine no: 22218
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22218, 'Unwind unit for 22218'),
(@machine_id_22218, 'Coating unit for 22218'),
(@machine_id_22218, 'Rewind unit for 22218'),
(@machine_id_22218, 'Chiller unit of 22218');

-- Insert machine number 22228 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22228)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22228);
END

-- Get the id of Machine no: 22228
DECLARE @machine_id_22228 INT;
SELECT @machine_id_22228 = id FROM machine WHERE process_id = 10 AND number = 22228;

-- Insert sub areas for Machine no: 22228
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22228, 'Unwind unit for 22228'),
(@machine_id_22228, 'Rewind unit for 22228'),
(@machine_id_22228, 'Coating unit for 22228'),
(@machine_id_22228, 'Waxing tank unit for 22228'),
(@machine_id_22228, 'Chiller unit for 22228'),
(@machine_id_22228, 'Heating system of waxing 22228'),
(@machine_id_22228, 'Infeed nip roller waxing - 22228'),
(@machine_id_22228, 'Out feed nip roller waxing - 22228');

-- Insert machine number 22215 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22215)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22215);
END

-- Get the id of Machine no: 22215
DECLARE @machine_id_22215 INT;
SELECT @machine_id_22215 = id FROM machine WHERE process_id = 10 AND number = 22215;

-- Insert sub areas for Machine no: 22215
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22215, 'Winder unit A of 22215'),
(@machine_id_22215, 'Winder unit B of 22215'),
(@machine_id_22215, 'Terating unit of 22215'),
(@machine_id_22215, 'Draw unit of 22215'),
(@machine_id_22215, 'Haul off unit of 22215'),
(@machine_id_22215, 'Vacuum system of 22215'),
(@machine_id_22215, 'Extruder A of 22215'),
(@machine_id_22215, 'Extruder B of 22215'),
(@machine_id_22215, 'Extruder C of 22215'),
(@machine_id_22215, 'Extruder D of 22215'),
(@machine_id_22215, 'Extruder E of 22215'),
(@machine_id_22215, 'Die head of 22215');


------------------RUN FROM HERE 6:45PM -----------

-- Insert machine number 22234 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22234)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22234);
END

-- Get the id of Machine no: 22234
DECLARE @machine_id_22234 INT;
SELECT @machine_id_22234 = id FROM machine WHERE process_id = 10 AND number = 22234;

-- Insert sub areas for Machine no: 22234
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22234, 'Winder unit A of 22234'),
(@machine_id_22234, 'Winder unit B of 22234'),
(@machine_id_22234, 'Treating unit of 22234'),
(@machine_id_22234, 'Draw unit of 22234'),
(@machine_id_22234, 'Haul off unit of 22234'),
(@machine_id_22234, 'Vacuum system of 22234'),
(@machine_id_22234, 'Extruder A of 22234'),
(@machine_id_22234, 'Extruder B of 22234'),
(@machine_id_22234, 'Extruder C of 22234'),
(@machine_id_22234, 'Die head of 22234'),
(@machine_id_22234, 'Auto gauge of 3 layer - 22234');

-- Insert machine number 22217 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22217)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22217);
END

-- Get the id of Machine no: 22217
DECLARE @machine_id_22217 INT;
SELECT @machine_id_22217 = id FROM machine WHERE process_id = 10 AND number = 22217;

-- Insert sub areas for Machine no: 22217
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22217, 'Winding unit A of 22217'),
(@machine_id_22217, 'Winding unit B of 22217'),
(@machine_id_22217, 'Treating unit of 22217'),
(@machine_id_22217, 'Draw unit of 22217'),
(@machine_id_22217, 'Haul off unit of 22217'),
(@machine_id_22217, 'Hopper unit of 22217'),
(@machine_id_22217, 'Extruder A of 22217'),
(@machine_id_22217, 'Extruder B of 22217'),
(@machine_id_22217, 'Extruder C of 22217'),
(@machine_id_22217, 'Extruder D of 22217'),
(@machine_id_22217, 'Extruder E of 22217'),
(@machine_id_22217, 'Die head of 22217');

-- Insert machine number 22238 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22238)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22238);
END

-- Get the id of Machine no: 22238
DECLARE @machine_id_22238 INT;
SELECT @machine_id_22238 = id FROM machine WHERE process_id = 10 AND number = 22238;

-- Insert sub areas for Machine no: 22238
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22238, 'Winder A 22238'),
(@machine_id_22238, 'Draw unit 22238'),
(@machine_id_22238, 'Treating unit 22238'),
(@machine_id_22238, 'Winder B 22238'),
(@machine_id_22238, 'Haul off 22238'),
(@machine_id_22238, 'Vacuum conveying sys 22238'),
(@machine_id_22238, 'Extruder A 22238'),
(@machine_id_22238, 'Extruder B 22238'),
(@machine_id_22238, 'Extruder C 22238'),
(@machine_id_22238, 'Die head - 22238'),
(@machine_id_22238, 'Electrical panel');

-- Insert machine number 22274 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22274)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22274);
END

-- Get the id of Machine no: 22274
DECLARE @machine_id_22274 INT;
SELECT @machine_id_22274 = id FROM machine WHERE process_id = 10 AND number = 22274;

-- Insert sub areas for Machine no: 22274
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22274, 'Draw unit 22274'),
(@machine_id_22274, 'Winder A 22274'),
(@machine_id_22274, 'Winder B 22274'),
(@machine_id_22274, 'Treating unit 22274'),
(@machine_id_22274, 'Vacuum conveying 22274'),
(@machine_id_22274, 'Haul off unit 22274'),
(@machine_id_22274, 'Extruder A section 22274'),
(@machine_id_22274, 'Extruder B section 22274'),
(@machine_id_22274, 'Extruder C section 22274'),
(@machine_id_22274, 'Extruder D section 22274'),
(@machine_id_22274, 'Extruder E section 22274'),
(@machine_id_22274, 'Extruder F section 22274'),
(@machine_id_22274, 'Extruder G section 22274'),
(@machine_id_22274, 'Die head 22274'),
(@machine_id_22274, 'Electrical system 22274');

-- Insert machine number 22296 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22296)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22296);
END

-- Get the id of Machine no: 22296
DECLARE @machine_id_22296 INT;
SELECT @machine_id_22296 = id FROM machine WHERE process_id = 10 AND number = 22296;

-- Insert sub areas for Machine no: 22296
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22296, 'Winder A 22296'),
(@machine_id_22296, 'Treating unit Varax 22296'),
(@machine_id_22296, 'Draw unit 22296'),
(@machine_id_22296, 'Winder B 22296'),
(@machine_id_22296, 'Vacuum conveying 22296'),
(@machine_id_22296, 'Haul off unit 22296'),
(@machine_id_22296, 'Extruder A 22296'),
(@machine_id_22296, 'Extruder B 22296'),
(@machine_id_22296, 'Extruder C 22296'),
(@machine_id_22296, 'Extruder D 22296'),
(@machine_id_22296, 'Extruder E 22296'),
(@machine_id_22296, 'Die head 22296');


---------------------RUN HERE 6:53PM -------------

-- Insert machine number 22278 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22278)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22278);
END

-- Get the id of Machine no: 22278
DECLARE @machine_id_22278 INT;
SELECT @machine_id_22278 = id FROM machine WHERE process_id = 10 AND number = 22278;

-- Insert sub areas for Machine no: 22278
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22278, 'Auto gauge unit of 22278'),
(@machine_id_22278, 'Primery unwinder unit of 22278'),
(@machine_id_22278, 'Secondary unwinder unit of 22278'),
(@machine_id_22278, 'Rewinder unit of 22278'),
(@machine_id_22278, 'Powder coating unit of 22278'),
(@machine_id_22278, 'Adhesive coating unit of 22278'),
(@machine_id_22278, 'Extruder unit of 22278'),
(@machine_id_22278, 'Die head unit of 22278'),
(@machine_id_22278, 'Chiller nip unit of 22278'),
(@machine_id_22278, 'Material suction unit of 22278'),
(@machine_id_22278, 'Poly coating unit of 22278'),
(@machine_id_22278, 'Dryer unit of coating unit - 22278'),
(@machine_id_22278, 'Primer unwinder treating unit'),
(@machine_id_22278, 'Secondary unwinder treating unit'),
(@machine_id_22278, 'Powder sprayer unit'),
(@machine_id_22278, 'Out feed unit 22278');

-- Insert machine number 22200 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 10 AND number = 22200)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (10, 22200);
END



------------CREATING NEW PROCESS LAMINATION-----------------

USE cilt;


-- Insert into process table for lamination
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Lamination')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Lamination');
END


------ENTERING MACHINES INTO LAMINATION-----

-- Insert machine number 22294 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22294)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22294);
END

-- Get the id of Machine no: 22294
DECLARE @machine_id_22294 INT;
SELECT @machine_id_22294 = id FROM machine WHERE process_id = 11 AND number = 22294;

-- Insert sub areas for Machine no: 22294
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22294, 'Pre-heater unit of coating unit 22294'),
(@machine_id_22294, 'Pre-heater unit of nip unit 22294'),
(@machine_id_22294, 'Edge guide unit of primary unwind 22294'),
(@machine_id_22294, 'Edge guide unit of secondary unwind 22294'),
(@machine_id_22294, 'Pasting assy of winder unit 22294'),
(@machine_id_22294, 'Pasting roller of winder unit 22294'),
(@machine_id_22294, 'Lay on assy of winder unit 22294'),
(@machine_id_22294, 'Chiller/Chiller air unit 22294'),
(@machine_id_22294, 'Flexo trolley 22294'),
(@machine_id_22294, 'Viscosity controller 22294'),
(@machine_id_22294, 'Elect trolley 22294'),
(@machine_id_22294, 'Dryer filter of tunnel # 1 22294'),
(@machine_id_22294, 'Coating unit 22294'),
(@machine_id_22294, 'Rewind unit 22294'),
(@machine_id_22294, 'Secondary unwind 22294'),
(@machine_id_22294, 'Wet lamination unit 22294'),
(@machine_id_22294, 'Wintriss system 22294'),
(@machine_id_22294, 'Synaptik system 22294'),
(@machine_id_22294, 'Primary unwind 22294'),
(@machine_id_22294, 'Dryer hood zone # 1 22294'),
(@machine_id_22294, 'Dryer hood zone # 2 22294'),
(@machine_id_22294, 'Dryer hood zone # 3 22294'),
(@machine_id_22294, 'Dryer hood zone # 4 22294');


-- Insert machine number 22226 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22226)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22226);
END

-- Get the id of Machine no: 22226
DECLARE @machine_id_22226 INT;
SELECT @machine_id_22226 = id FROM machine WHERE process_id = 11 AND number = 22226;

-- Insert sub areas for Machine no: 22226
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22226, 'Rewinding unit 22226'),
(@machine_id_22226, 'Primary unwinder 22226'),
(@machine_id_22226, 'Secondary unwinder 22226'),
(@machine_id_22226, 'Coating unit 22226'),
(@machine_id_22226, 'Primary edge guide 22226'),
(@machine_id_22226, 'Secondary edge guide 22226'),
(@machine_id_22226, 'Hood unit # 01 22226'),
(@machine_id_22226, 'Hood unit # 02 22226'),
(@machine_id_22226, 'Hood unit # 03 22226'),
(@machine_id_22226, 'Hood unit # 04 22226'),
(@machine_id_22226, 'Pasting assy 22226'),
(@machine_id_22226, 'Pre-Heater -1 22226'),
(@machine_id_22226, 'Solovent pump/line 22226'),
(@machine_id_22226, 'Heat exchanger/battery unit # 01 22226'),
(@machine_id_22226, 'Heat exchanger/battery unit # 02 22226'),
(@machine_id_22226, 'Heat exchanger/battery unit # 03 22226'),
(@machine_id_22226, 'Heat exchanger/battery unit # 04 22226'),
(@machine_id_22226, 'Chain hoist -rewinder 22226'),
(@machine_id_22226, 'Chain hoist -second unwind 22226'),
(@machine_id_22226, 'Adhesive mixture and drums 22226'),
(@machine_id_22226, 'Viscosity controller 22226');


-- Insert machine number 22267 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22267)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22267);
END

-- Get the id of Machine no: 22267
DECLARE @machine_id_22267 INT;
SELECT @machine_id_22267 = id FROM machine WHERE process_id = 11 AND number = 22267;

-- Insert sub areas for Machine no: 22267
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22267, 'Primary unwind 22267 Sol LESS LAM SL450'),
(@machine_id_22267, 'Secondary unwind 22267 Sol LESS LAM SL450'),
(@machine_id_22267, 'Coating unit 22267 Sol LESS LAM SL450'),
(@machine_id_22267, 'Bridge roll unit 22267 Sol LESS LAM SL450'),
(@machine_id_22267, 'Bobst mixer unit 22267 Sol LESS LAM SL450'),
(@machine_id_22267, 'Wintriss system 22267 Sol LESS LAM SL450'),
(@machine_id_22267, 'Main control panel 22267 Sol LESS LAM SL450'),
(@machine_id_22267, 'Rewind unit 22267 Sol LESS LAM SL450');


-- Insert machine number 22271 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22271)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22271);
END

-- Get the id of Machine no: 22271
DECLARE @machine_id_22271 INT;
SELECT @machine_id_22271 = id FROM machine WHERE process_id = 11 AND number = 22271;

-- Insert sub areas for Machine no: 22271
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22271, 'Unwind unit 22271'),
(@machine_id_22271, 'Rewinder unit 22271'),
(@machine_id_22271, 'Primary unwinder unit 22271'),
(@machine_id_22271, 'Coating unit 22271'),
(@machine_id_22271, 'Nipping unit 22271'),
(@machine_id_22271, 'Pre-heater of metering unit 22271'),
(@machine_id_22271, 'Pre-heater of transfer roller 22271'),
(@machine_id_22271, 'Pre-heater of chilled water roller 22271'),
(@machine_id_22271, 'Primary treating unit 22271'),
(@machine_id_22271, 'Secondary treating unit 22271'),
(@machine_id_22271, 'Adhesive unit 22271'),
(@machine_id_22271, 'Adhesive tank A Compo 22271'),
(@machine_id_22271, 'Adhesive tank C Compo 22271'),
(@machine_id_22271, 'Electroheated hose 22271'),
(@machine_id_22271, 'Adhesive control valve 22271'),
(@machine_id_22271, 'Mixing head 22271'),
(@machine_id_22271, 'Adhesive pump A Compo 22271'),
(@machine_id_22271, 'Adhesive pump C Compo 22271'),
(@machine_id_22271, 'Reel lifting ele trolley 22271'),
(@machine_id_22271, 'Fume exhaust blowers 22271'),
(@machine_id_22271, 'Treating exhaust blower 22271');


-- Insert machine number 22266 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22266)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22266);
END

-- Get the id of Machine no: 22266
DECLARE @machine_id_22266 INT;
SELECT @machine_id_22266 = id FROM machine WHERE process_id = 11 AND number = 22266;

-- Insert sub areas for Machine no: 22271
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22266, 'Unwind unit 22266'),
(@machine_id_22266, 'Primary unwind unit 22266'),
(@machine_id_22266, 'Secondary unit 22266'),
(@machine_id_22266, 'Rewinder unwind unit 22266'),
(@machine_id_22266, 'Coating unit 22266'),
(@machine_id_22266, 'Treating unit of primary unit 22266'),
(@machine_id_22266, 'Secondary unwind unit 22266'),
(@machine_id_22266, 'Adhesive unit 22266'),
(@machine_id_22266, 'Exust blower 22266'),
(@machine_id_22266, 'Treating unit blower 22266'),
(@machine_id_22266, 'Safety glass 22266'),
(@machine_id_22266, 'Metering roller drive gear box 22266'),
(@machine_id_22266, 'Coating roller drive coupling 22266'),
(@machine_id_22266, 'Winder chuck drive gear box 22266'),
(@machine_id_22266, 'Winder lay on roller and assy 22266'),
(@machine_id_22266, 'Secondary unwinder doncer roller 22266'),
(@machine_id_22266, 'Winder doncer roller 22266'),
(@machine_id_22266, 'Drive belt of chilled roller 22266'),
(@machine_id_22266, 'Timing pulleys of chilled roller 22266'),
(@machine_id_22266, 'Drive belts of coating rollers  22266'),
(@machine_id_22266, 'Timing pulleys of coating rollers 22266'),
(@machine_id_22266, 'Treating unit electrodes 22266'),
(@machine_id_22266, 'Winder axle chuck 22266'),
(@machine_id_22266, 'Primary unwinder chucks 22266'),
(@machine_id_22266, 'Secondary unwinder chucks 22266'),
(@machine_id_22266, 'Pre-heater coating roller 22266'),
(@machine_id_22266, 'Linear drive cylinder and assy 22266');

-- Insert machine number 22224 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22224)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22224);
END

-- Get the id of Machine no: 22224
DECLARE @machine_id_22224 INT;
SELECT @machine_id_22224= id FROM machine WHERE process_id = 11 AND number = 22224;

-- Insert sub areas for Machine no: 22224
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22224, 'Electrical panel 22224'),
(@machine_id_22224, 'Unwind unit 22224'),
(@machine_id_22224, 'Primary unwinder unit 22224'),
(@machine_id_22224, 'Secondary unwinder unit 22224'),
(@machine_id_22224, 'Rewinder unit 22224'),
(@machine_id_22224, 'Pre-heater unit 22224'),
(@machine_id_22224, 'Coating unit 22224'),
(@machine_id_22224, 'Fume exhaust blower 22224'),
(@machine_id_22224, 'Treating unit 22224'),
(@machine_id_22224, 'Nipping unit 22224'),
(@machine_id_22224, 'Lay on assy 22224'),
(@machine_id_22224, 'Adhesive unit 22224');


-- Insert machine number 22255 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22255)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22255);
END

-- Get the id of Machine no: 22255
DECLARE @machine_id_22255 INT;
SELECT @machine_id_22255= id FROM machine WHERE process_id = 11 AND number = 22255;

-- Insert sub areas for Machine no: 22255
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22255, 'Unwind unit 22255'),
(@machine_id_22255, 'Rewinding unit 22255'),
(@machine_id_22255, 'Unwind drive/Non drive chuck 22255'),
(@machine_id_22255, 'Rewinding drive/Non drive chuck  22255'),
(@machine_id_22255, 'Edge guide unit 22255'),
(@machine_id_22255, 'Unwinding lay on assy 22255'),
(@machine_id_22255, 'Hydraulic unit 22255');


-- Insert machine number 22256 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22256)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22256);
END

-- Get the id of Machine no: 22256
DECLARE @machine_id_22256 INT;
SELECT @machine_id_22256= id FROM machine WHERE process_id = 11 AND number = 22256;

-- Insert sub areas for Machine no: 22256
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22256, 'Unwind unit 22256'),
(@machine_id_22256, 'Rewinding unit 22256'),
(@machine_id_22256, 'Unwind drive/Non drive chuck 22256'),
(@machine_id_22256, 'Rewinding drive/Non drive chuck  22256'),
(@machine_id_22256, 'Edge guide unit 22256'),
(@machine_id_22256, 'Unwinding lay on assy 22256'),
(@machine_id_22256, 'Rewinding lay on assy 22256'),
(@machine_id_22256, 'Hydraulic unit 22256 (7851)'),
(@machine_id_22256, 'Hydraulic unit 22256 (7859)');


-- Insert machine number 22257 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22257)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22257);
END

-- Get the id of Machine no: 22256
DECLARE @machine_id_22257 INT;
SELECT @machine_id_22257= id FROM machine WHERE process_id = 11 AND number = 22257;

-- Insert sub areas for Machine no: 22256
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22257, 'Unwind unit 22257'),
(@machine_id_22257, 'Rewinding unit 22257 (7852)'),
(@machine_id_22257, 'Unwinding drive/Non drive chuck 22257'),
(@machine_id_22257, 'Rewinding drive/Non drive chuck  22257'),
(@machine_id_22257, 'Edge guide unit 22257'),
(@machine_id_22257, 'Unwinding lay on assy 22257'),
(@machine_id_22257, 'Rewinding lay on assy 22257'),
(@machine_id_22257, 'Hydraulic unit 22257 (7858)'),
(@machine_id_22257, 'Rewinding unit 22257 (7859)');

-- Insert machine number 22272 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22272)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22272);
END

-- Get the id of Machine no: 22272
DECLARE @machine_id_22272 INT;
SELECT @machine_id_22272= id FROM machine WHERE process_id = 11 AND number = 22272;

-- Insert sub areas for Machine no: 22272
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22272, 'Unwind unit 22272'),
(@machine_id_22272, 'Rewinding unit 22272'),
(@machine_id_22272, 'Unwinder drive/Non drive chuck 22272'),
(@machine_id_22272, 'Rewinder drive/Non drive chuck  22272'),
(@machine_id_22272, 'Edge guide unit 22272'),
(@machine_id_22272, 'Unwinded lay on assy 22272'),
(@machine_id_22272, 'Rewinder lay on assy 22272'),
(@machine_id_22272, 'Hydraulic unit 22272');


-- Insert machine number 22291 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 11 AND number = 22291)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (11, 22291);
END

-----------------CREATING NEW PROCESS 'PRINTING'#######################

USE cilt;

-- Insert into process table for lamination
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Printing')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Printing');
END


---!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!checking !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;


-- ## INSERTING MACHINES IN PRINTING ##

-- Insert machine number 22233 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22233)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22233);
END

-- Get the id of Machine no: 22233
DECLARE @machine_id_22233 INT;
SELECT @machine_id_22233 = id FROM machine WHERE process_id = 12 AND number = 22233;

-- Insert sub areas for Machine no: 22233
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22233, 'Unwinder Unit Of 22233'),
(@machine_id_22233, 'Infeed Unit Of 22233'),
(@machine_id_22233, 'Main Alatainer Unit Of 22233'),
(@machine_id_22233, 'Print Unit # 1 Of 22233'),
(@machine_id_22233, 'Print Unit # 2 Of 22233'),
(@machine_id_22233, 'Print Unit # 3 Of 22233'),
(@machine_id_22233, 'Print Unit # 4 Of 22233'),
(@machine_id_22233, 'Print Unit # 5 Of 22233'),
(@machine_id_22233, 'Print Unit # 6 Of 22233'),
(@machine_id_22233, 'Print Unit # 7 Of 22233'),
(@machine_id_22233, 'Print Unit # 8 Of 22233'),
(@machine_id_22233, 'Print Unit # 9 Of 22233'),
(@machine_id_22233, 'Print Unit # 10 Of 22233'),
(@machine_id_22233, 'Reversing Unit Of 22233'),
(@machine_id_22233, 'Outfeed Unit Of 22233'),
(@machine_id_22233, 'Rewinder Unit Of 22233'),
(@machine_id_22233, 'Main Exhaust System Of 22233');

-- Insert machine number 22268 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22268)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22268);
END

-- Get the id of Machine no: 22268
DECLARE @machine_id_22268 INT;
SELECT @machine_id_22268 = id FROM machine WHERE process_id = 12 AND number = 22268;

-- Insert sub areas for Machine no: 22268
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22268, 'Unwind Unit Of 22268'),
(@machine_id_22268, 'Infeed Unit Of 22268'),
(@machine_id_22268, 'Print Unit # 1 Of 22268'),
(@machine_id_22268, 'Print Unit # 2 Of 22268'),
(@machine_id_22268, 'Print Unit # 3 Of 22268'),
(@machine_id_22268, 'Print Unit # 4 Of 22268'),
(@machine_id_22268, 'Print Unit # 5 Of 22268'),
(@machine_id_22268, 'Print Unit # 6 Of 22268'),
(@machine_id_22268, 'Print Unit # 7 Of 22268'),
(@machine_id_22268, 'Print Unit # 8 Of 22268'),
(@machine_id_22268, 'Outfeed Unit Of 22268'),
(@machine_id_22268, 'Rewind Unit Of 22268'),
(@machine_id_22268, 'Main Alatainer Unit Of 22268'),
(@machine_id_22268, 'Main Exhaust System Of 22268');

-- Insert machine number 22279 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22279)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22279);
END

-- Get the id of Machine no: 22279
DECLARE @machine_id_22279 INT;
SELECT @machine_id_22279 = id FROM machine WHERE process_id = 12 AND number = 22279;

-- Insert sub areas for Machine no: 22279
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22279, 'Unwind Unit Of 22279'),
(@machine_id_22279, 'Infeed Unit Of 22279'),
(@machine_id_22279, 'Print Unit # 1 Of 22279'),
(@machine_id_22279, 'Print Unit # 2 Of 22279'),
(@machine_id_22279, 'Print Unit # 3 Of 22279'),
(@machine_id_22279, 'Print Unit # 4 Of 22279'),
(@machine_id_22279, 'Print Unit # 5 Of 22279'),
(@machine_id_22279, 'Print Unit # 6 Of 22279'),
(@machine_id_22279, 'Print Unit # 7 Of 22279'),
(@machine_id_22279, 'Print Unit # 8 Of 22279'),
(@machine_id_22279, 'Rewind Unit Of 22279'),
(@machine_id_22279, 'Outfeed Unit Of 22279'),
(@machine_id_22279, 'Main Exhaust Blower Of 22279'),
(@machine_id_22279, 'Main Alatainer Unit Of 22279'),
(@machine_id_22279, 'Stereo Cylinder Loading Trolly Of 22279');

-- RUN FROM HERE;:::::

-- Insert machine number 22157 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22157)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22157);
END

-- Get the id of Machine no: 22157
DECLARE @machine_id_22157 INT;
SELECT @machine_id_22157 = id FROM machine WHERE process_id = 12 AND number = 22157;

-- Insert sub areas for Machine no: 22157
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22157, 'Unwind Unit Of 22157'),
(@machine_id_22157, 'Infeed Unit Of 22157'),
(@machine_id_22157, 'Central Impression 22157'),
(@machine_id_22157, 'Print Unit # 1 Of 22157'),
(@machine_id_22157, 'Print Unit # 2 Of 22157'),
(@machine_id_22157, 'Print Unit # 3 Of 22157'),
(@machine_id_22157, 'Print Unit # 4 Of 22157'),
(@machine_id_22157, 'Print Unit # 5 Of 22157'),
(@machine_id_22157, 'Print Unit # 6 Of 22157'),
(@machine_id_22157, 'Print Unit # 7 Of 22157'),
(@machine_id_22157, 'Print Unit # 8 Of 22157'),
(@machine_id_22157, 'Drying System Of 22157'),
(@machine_id_22157, 'Main Op Panel Of 22157'),
(@machine_id_22157, 'Outfeed Unit Of 22157'),
(@machine_id_22157, 'Main Exhaust System Of 22157'),
(@machine_id_22157, 'Rewind Unit Of 22157'),
(@machine_id_22157, 'Main Elatainer Panel Electrical Of 22157');

-- Insert machine number 22114 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22114)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22114);
END

-- Get the id of Machine no: 22114
DECLARE @machine_id_22114 INT;
SELECT @machine_id_22114 = id FROM machine WHERE process_id = 12 AND number = 22114;

-- Insert sub areas for Machine no: 22114
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22114, 'Print Unit # 1 Of 22114');

-- Insert machine number 22140 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22140)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22140);
END

-- Get the id of Machine no: 22140
DECLARE @machine_id_22140 INT;
SELECT @machine_id_22140 = id FROM machine WHERE process_id = 12 AND number = 22140;

-- Insert sub areas for Machine no: 22140
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22140, 'Unwind Unit Of 22140'),
(@machine_id_22140, 'Infeed Unit Of 22140'),
(@machine_id_22140, 'Central Impression Of 22140'),
(@machine_id_22140, 'Print Unit # 1 Of 22140'),
(@machine_id_22140, 'Print Unit # 2 Of 22140'),
(@machine_id_22140, 'Print Unit # 3 Of 22140'),
(@machine_id_22140, 'Print Unit # 4 Of 22140'),
(@machine_id_22140, 'Print Unit # 5 Of 22140'),
(@machine_id_22140, 'Print Unit # 6 Of 22140'),
(@machine_id_22140, 'Print Unit # 7 Of 22140'),
(@machine_id_22140, 'Print Unit # 8 Of 22140'),
(@machine_id_22140, 'Drying System Of 22140'),
(@machine_id_22140, 'Main Op Panel Of 22140'),
(@machine_id_22140, 'Outfeed Unit Of 22140'),
(@machine_id_22140, 'Main Exhaust System Of 22140'),
(@machine_id_22140, 'Rewind Unit Of 22140');

-------RUN FROM HERE 9:57AM-------

-- Insert machine number 22297 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22297)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22297);
END

-- Get the id of Machine no: 22297
DECLARE @machine_id_22297 INT;
SELECT @machine_id_22297 = id FROM machine WHERE process_id = 12 AND number = 22297;

-- Insert sub areas for Machine no: 22297
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22297, 'Winding Section Of New Printer 22297'),
(@machine_id_22297, 'Printing Section Of New Printer 22297'),
(@machine_id_22297, 'Drying Section Of New Printer 22297'),
(@machine_id_22297, 'Infeed Draw Unit Of New Printer 22297'),
(@machine_id_22297, 'Outfeed Draw Unit Of New Printer 22297'),
(@machine_id_22297, 'Rewinding Section Of New Printer 22297');

-- Insert machine number 22291 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22291)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22291);
END

-- Get the id of Machine no: 22291
DECLARE @machine_id_22291 INT;
SELECT @machine_id_22291 = id FROM machine WHERE process_id = 12 AND number = 22291;

-- Insert sub areas for Machine no: 22291 -1 Babcock 1994
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22291, 'Solvent Hose 19x5 (35018023) 22291 -1 Babcock 1994'),
(@machine_id_22291, 'Sandpiper Pump (For Buf) 22291 -1 Babcock 1994'),
(@machine_id_22291, 'Yamada Pump (For Buf) 22291 -1 Babcock 1994'),
(@machine_id_22291, 'Diesel Pump Suntec- 1.1 Kw 22291 -1 Babcock 1994'),
(@machine_id_22291, 'Nozzle 10gph 60 Degree Dunfoss 22291 -1 Babcock 1994'),
(@machine_id_22291, 'Nozzle 15 Gph 60 Degree Dunfoss 22291 -1 Babcock 1994');

-- Insert sub areas for Machine no: 22291 -3 Babcock 1998
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22291, 'Solvent Hose 19x5 (35018023) 22291 -3 Babcock 1998'),
(@machine_id_22291, 'Sandpiper Pump (For Buf) 22291 -3 Babcock 1998'),
(@machine_id_22291, 'Yamada Pump (For Buf) 22291 -3 Babcock 1998'),
(@machine_id_22291, 'Diesel Pump Suntec- 1.1 Kw 22291 -3 Babcock 1998'),
(@machine_id_22291, 'Nozzle 10gph 60 Degree Dunfoss 22291 -3 Babcock 1998'),
(@machine_id_22291, 'Nozzle 15 Gph 60 Degree Dunfoss 22291 -3 Babcock 1998');

-- Insert sub areas for Machine no: 22291 -5 Babcock 2012
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22291, 'Solvent Hose 19x5 (35018023) 22291 -5 Babcock 2012'),
(@machine_id_22291, 'Sandpiper Pump (For Buf) 22291 -5 Babcock 2012'),
(@machine_id_22291, 'Yamada Pump (For Buf) 22291 -5 Babcock 2012'),
(@machine_id_22291, 'Diesel Pump Suntec- 1.1 Kw 22291 -5 Babcock 2012'),
(@machine_id_22291, 'Nozzle 10gph 60 Degree Dunfoss 22291 -5 Babcock 2012'),
(@machine_id_22291, 'Nozzle 15 Gph 60 Degree Dunfoss 22291 -5 Babcock 2012'),
(@machine_id_22291, 'Thermal Oil Pumps Skid');

-- Insert machine number 22220 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22220)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22220);
END

-- Get the id of Machine no: 22220
DECLARE @machine_id_22220 INT;
SELECT @machine_id_22220 = id FROM machine WHERE process_id = 12 AND number = 22220;

-- Insert sub areas for Machine no: 22220
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22220, 'Exhaust System Of Washing M/C 22220'),
(@machine_id_22220, 'Solvent Circulation System 22220'),
(@machine_id_22220, 'Main Operator Panel Of Washing 22220'),
(@machine_id_22220, 'Washing Track System 22220'),
(@machine_id_22220, 'Solvent Tank System 22220'),
(@machine_id_22220, 'Front Door Of Flexowash 22220');

-- Insert machine number 22200 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22200)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22200);
END

-- Get the id of Machine no: 22200
DECLARE @machine_id_22200 INT;
SELECT @machine_id_22200 = id FROM machine WHERE process_id = 12 AND number = 22200;

-- Insert sub areas for Machine no: 22200
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22200, 'Electrical Panel Of Alphasonic Machine'),
(@machine_id_22200, 'Sandpiper Pump (For Buf) (Solvent Station Near Dic Plant)'),
(@machine_id_22200, 'Sandpiper Pump (Solvent Station Near Dic Plant)');

-- Insert machine number 22202 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22202)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22202);
END

-- Insert machine number 22120 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 12 AND number = 22120)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (12, 22120);
END

-- Get the id of Machine no: 22120
DECLARE @machine_id_22120 INT;
SELECT @machine_id_22120 = id FROM machine WHERE process_id = 12 AND number = 22120;

-- Insert sub areas for Machine no: 22120
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22120, 'Print Unit # 1 Of 22120'),
(@machine_id_22120, 'Print Unit # 2 Of 22120'),
(@machine_id_22120, 'Print Unit # 3 Of 22120'),
(@machine_id_22120, 'Print Unit # 4 Of 22120'),
(@machine_id_22120, 'Print Unit # 5 Of 22120'),
(@machine_id_22120, 'Print Unit # 6 Of 22120'),
(@machine_id_22120, 'Print Unit # 7 Of 22120'),
(@machine_id_22120, 'Print Unit # 8 Of 22120'),
(@machine_id_22120, 'Unwind Unit Of 22120'),
(@machine_id_22120, 'Camera Unit Of 22120'),
(@machine_id_22120, 'Rewind Unit Of 22120'),
(@machine_id_22120, 'Ink System Of 22120'),
(@machine_id_22120, 'Main Exhaust Blower Of 22120'),
(@machine_id_22120, 'Main Altainter Of 22120');

-----------------CREATING NEW PROCESS 'SLITTING'#######################

USE cilt;

-- Insert into process table for SLITTING
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Slitting')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Slitting');
END

-- ###### INSERTING MACHINES IN SLITTING #####

-- Insert machine number 22244 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22244)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22244);
END

-- Insert machine number 22284 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22284)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22284);
END


-- Insert machine number 22282 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22282)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22282);
END

-- Get the id of Machine no: 22282
DECLARE @machine_id_22282 INT;
SELECT @machine_id_22282 = id FROM machine WHERE process_id = 13 AND number = 22282;

-- Insert sub areas for Machine no: 22282
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22282, 'Drive Unit Of Core-Cut 22282'),
(@machine_id_22282, 'Blade Assembly Unit Core-Cut 22282'),
(@machine_id_22282, 'Slide Pusher Assembly Core-Cut 22282');

-- Insert machine number 22237 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22237)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22237);
END

-- Get the id of Machine no: 22237
DECLARE @machine_id_22237 INT;
SELECT @machine_id_22237 = id FROM machine WHERE process_id = 13 AND number = 22237;

-- Insert sub areas for Machine no: 22237
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22237, 'Rewind Unit 22237'),
(@machine_id_22237, 'Edge Guide System 22237'),
(@machine_id_22237, 'Splice Assembly 22237'),
(@machine_id_22237, 'Slitting Unit 22237'),
(@machine_id_22237, 'Banana Roll System 22237'),
(@machine_id_22237, 'Off Loading System 22237'),
(@machine_id_22237, 'Pneumatic System 22237'),
(@machine_id_22237, 'Main Electric System 22237'),
(@machine_id_22237, 'Hydraulic Unit 22237'),
(@machine_id_22237, 'Trimming Blower Unit 22237'),
(@machine_id_22237, 'Unwind Unit 22237');

-- Insert machine number 22249 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22249)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22249);
END

-- Get the id of Machine no: 22249
DECLARE @machine_id_22249 INT;
SELECT @machine_id_22249 = id FROM machine WHERE process_id = 13 AND number = 22249;

-- Insert sub areas for Machine no: 22249
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22249, 'Blade Assembly Unit Of 22249'),
(@machine_id_22249, 'Rewinding Unit Of 22249'),
(@machine_id_22249, 'Unwind Unit Of Yoden 22249'),
(@machine_id_22249, 'Hydraulic Unit Of 22249'),
(@machine_id_22249, 'Pneumatic Assembly Of 22249'),
(@machine_id_22249, 'Trimming Blower Unit Of 22249');

-- Insert machine number 22248 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22248)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22248);
END

-- Get the id of Machine no: 22248
DECLARE @machine_id_22248 INT;
SELECT @machine_id_22248 = id FROM machine WHERE process_id = 13 AND number = 22248;

-- Insert sub areas for Machine no: 22248
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22248, 'Rewinding Unit Of 22248'),
(@machine_id_22248, 'Unwind Unit Of Yoden 22248'),
(@machine_id_22248, 'Blade Assembly Unit Of 22248'),
(@machine_id_22248, 'Pneumatic Assembly Of 22248'),
(@machine_id_22248, 'Hydraulic Unit Of 22248'),
(@machine_id_22248, 'Trimming Blower Unit Of 22248');


-- Insert machine number 22250 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22250)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22250);
END

-- Get the id of Machine no: 22250
DECLARE @machine_id_22250 INT;
SELECT @machine_id_22250 = id FROM machine WHERE process_id = 13 AND number = 22250;

-- Insert sub areas for Machine no: 22250
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22250, 'Rewinding Unit Of 22250'),
(@machine_id_22250, 'Unwind Unit Of 22250'),
(@machine_id_22250, 'Blade Assembly Unit Of 22250'),
(@machine_id_22250, 'Pneumatic Assembly Of 22250'),
(@machine_id_22250, 'Hydraulic Unit Of 22250'),
(@machine_id_22250, 'Trimming Blower Unit Of 22250');


-- @@@@run from here 10:48###]

-- Insert machine number 22270 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22270)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22270);
END

-- Get the id of Machine no: 22270
DECLARE @machine_id_22270 INT;
SELECT @machine_id_22270 = id FROM machine WHERE process_id = 13 AND number = 22270;

-- Insert sub areas for Machine no: 22270
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22270, 'Rewinding Unit Of 22270'),
(@machine_id_22270, 'Unwind Unit Of 22270'),
(@machine_id_22270, 'Blade Assembly Unit Of 22270'),
(@machine_id_22270, 'Pneumatic Assembly Of 22270'),
(@machine_id_22270, 'Hydraulic Unit Of 22270'),
(@machine_id_22270, 'Trimming Blower Unit Of 22270');

-- Insert machine number 22280 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22280)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22280);
END

-- Get the id of Machine no: 22280
DECLARE @machine_id_22280 INT;
SELECT @machine_id_22280 = id FROM machine WHERE process_id = 13 AND number = 22280;

-- Insert sub areas for Machine no: 22280
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22280, 'Rewinding Unit Of 22280'),
(@machine_id_22280, 'Unwind Unit 22280'),
(@machine_id_22280, 'Hydraulic Unit Of 22280'),
(@machine_id_22280, 'Blade Assembly Unit Of 22280'),
(@machine_id_22280, 'Pneumatic Assembly Of 22280'),
(@machine_id_22280, 'Banana Roller Of 22280'),
(@machine_id_22280, 'Trimming Blower Unit Of 22280');

-- Insert machine number 22246 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22246)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22246);
END

-- Get the id of Machine no: 22246
DECLARE @machine_id_22246 INT;
SELECT @machine_id_22246 = id FROM machine WHERE process_id = 13 AND number = 22246;

-- Insert sub areas for Machine no: 22246
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22246, 'Rewinding Unit Of 22246'),
(@machine_id_22246, 'Unwind Unit of 22246'),
(@machine_id_22246, 'Hydraulic Unit Of 22246'),
(@machine_id_22246, 'Blade Assembly Unit Of 22246'),
(@machine_id_22246, 'Shapper Shaft Of 22246'),
(@machine_id_22246, 'Trimming Blower Unit Of 22246');

-- Insert machine number 22155 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22155)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22155);
END

-- Get the id of Machine no: 22155
DECLARE @machine_id_22155 INT;
SELECT @machine_id_22155 = id FROM machine WHERE process_id = 13 AND number = 22155;

-- Insert sub areas for Machine no: 22155
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22155, 'Rewinding Unit Of 22155'),
(@machine_id_22155, 'Unwinding Unit Of 22155'),
(@machine_id_22155, 'Hydraulic Unit Of 22155'),
(@machine_id_22155, 'Blade Assembly Unit Of 22155'),
(@machine_id_22155, 'Shapper Shaft Of 22155'),
(@machine_id_22155, 'Pneumatic Assembly Of 22155'),
(@machine_id_22155, 'Trimming Blower Unit Of 22155'),
(@machine_id_22155, 'Banana Roller Of 22155'),
(@machine_id_22155, 'Main Electrical Panel 22155'),
(@machine_id_22155, 'Main HMI Display 22155');



-- @@@@@@ RUN FROM HERE 11:05AM @@@@@@@@@

-- Insert machine number 22154 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22154)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22154);
END

-- Get the id of Machine no: 22154
DECLARE @machine_id_22154 INT;
SELECT @machine_id_22154 = id FROM machine WHERE process_id = 13 AND number = 22154;

-- Insert sub areas for Machine no: 22154
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22154, 'Rewinding Unit Of 22154'),
(@machine_id_22154, 'Unwinding Unit Of 22154'),
(@machine_id_22154, 'Hydraulic Unit Of 22154'),
(@machine_id_22154, 'Blade Assembly Unit Of 22154'),
(@machine_id_22154, 'Shapper Shaft Of 22154'),
(@machine_id_22154, 'Pneumatic Assembly Of 22154'),
(@machine_id_22154, 'Trimming Blower Unit Of 22154'),
(@machine_id_22154, 'Banana Roller Of 22154');

-- RUN FROM HERE: 


-- Insert machine number 22247 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22247)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22247);
END

-- Get the id of Machine no: 22247
DECLARE @machine_id_22247 INT;
SELECT @machine_id_22247 = id FROM machine WHERE process_id = 13 AND number = 22247;

-- Insert sub areas for Machine no: 22247
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22247, 'Rewinding Unit Of 22247'),
(@machine_id_22247, 'Unwinding Unit Of 22247'),
(@machine_id_22247, 'Hydraulic Unit Of 22247'),
(@machine_id_22247, 'Shapper Shaft Of 22247'),
(@machine_id_22247, 'Blade Shaft Assembly Unit Of 22247');

-- Insert machine number 22276 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22276)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22276);
END

-- Get the id of Machine no: 22276
DECLARE @machine_id_22276 INT;
SELECT @machine_id_22276 = id FROM machine WHERE process_id = 13 AND number = 22276;

-- Insert sub areas for Machine no: 22276
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22276, 'Rewinding Unit Of 22276'),
(@machine_id_22276, 'Unwinding Unit Of 22276'),
(@machine_id_22276, 'Hydraulic Unit Of 22276'),
(@machine_id_22276, 'Shapper Shaft Of 22276'),
(@machine_id_22276, 'Blade Shaft Of 22276');


-- Insert machine number 22104 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22104)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22104);
END

-- Get the id of Machine no: 22104
DECLARE @machine_id_22104 INT;
SELECT @machine_id_22104 = id FROM machine WHERE process_id = 13 AND number = 22104;

-- Insert sub areas for Machine no: 22104
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22104, 'Rewinding Unit Of 22104'),
(@machine_id_22104, 'Unwinding Unit Of 22104'),
(@machine_id_22104, 'Layon Rollers Of 22104'),
(@machine_id_22104, 'Brake Of Rewinding Unit 22104'),
(@machine_id_22104, 'Brake Of Unwinding Unit 22104');

-- Insert machine number 22245 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22245)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22245);
END

-- Get the id of Machine no: 22245
DECLARE @machine_id_22245 INT;
SELECT @machine_id_22245 = id FROM machine WHERE process_id = 13 AND number = 22245;

-- Insert sub areas for Machine no: 22245
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22245, 'Rewinding Unit Of 22245'),
(@machine_id_22245, 'Unwinding Unit Of 22245'),
(@machine_id_22245, 'Shapper Shaft Of 22245'),
(@machine_id_22245, 'Pneumatic Assembly Of 22245'),
(@machine_id_22245, 'Hydraulic Unit Of 22245'),
(@machine_id_22245, 'Trimming Unit Of 22245');


-- Insert machine number 22253 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22253)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22253);
END

-- Get the id of Machine no: 22253
DECLARE @machine_id_22253 INT;
SELECT @machine_id_22253 = id FROM machine WHERE process_id = 13 AND number = 22253;

-- Insert sub areas for Machine no: 22253
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22253, 'Rewinding Unit Of 22253'),
(@machine_id_22253, 'Unwinding Unit Of 22253'),
(@machine_id_22253, 'Layon Rollers Of 22253'),
(@machine_id_22253, 'Brake Of Rewinding Unit 22253'),
(@machine_id_22253, 'Brake Of Unwinding Unit 22253');

-- Insert machine number 22153 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22153)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22153);
END

-- Get the id of Machine no: 22153
DECLARE @machine_id_22153 INT;
SELECT @machine_id_22153 = id FROM machine WHERE process_id = 13 AND number = 22153;

-- Insert sub areas for Machine no: 22153
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22153, 'Rewinding Unit Of 22153'),
(@machine_id_22153, 'Unwinding Unit Of 22153'),
(@machine_id_22153, 'Layon Rollers Of Rewinder Unit 22153'),
(@machine_id_22153, 'Layon Rollers Of Unwinder Unit 22153'),
(@machine_id_22153, 'Brake Of Rewinding Unit 22153'),
(@machine_id_22153, 'Brake Of Unwinding Unit 22153'),
(@machine_id_22153, 'Trimming Blower Unit Of 22153');


-- Insert machine number 22258 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22258)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22258);
END

-- Get the id of Machine no: 22258
DECLARE @machine_id_22258 INT;
SELECT @machine_id_22258 = id FROM machine WHERE process_id = 13 AND number = 22258;

-- Insert sub areas for Machine no: 22258
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22258, 'Rewinding Unit Of 22258'),
(@machine_id_22258, 'Unwinding Unit Of 22258'),
(@machine_id_22258, 'Layon Rollers Of Rewinder Unit 22258'),
(@machine_id_22258, 'Layon Rollers Of Unwinder Unit 22258'),
(@machine_id_22258, 'Nip Roller 22258');

-- Insert machine number 22259 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22259)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22259);
END

-- Get the id of Machine no: 22259
DECLARE @machine_id_22259 INT;
SELECT @machine_id_22259 = id FROM machine WHERE process_id = 13 AND number = 22259;

-- Insert sub areas for Machine no: 22259
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22259, 'Rewinding Unit Of 22259'),
(@machine_id_22259, 'Unwinding Unit Of 22259'),
(@machine_id_22259, 'Layon Rollers Of Rewinder Unit 22259'),
(@machine_id_22259, 'Layon Rollers Of Unwinder Unit 22259'),
(@machine_id_22259, 'Nip Roller 22259');


-- Insert machine number 22273 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22273)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22273);
END

-- Get the id of Machine no: 22273
DECLARE @machine_id_22273 INT;
SELECT @machine_id_22273 = id FROM machine WHERE process_id = 13 AND number = 22273;

-- Insert sub areas for Machine no: 22273
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22273, 'Rewinding Unit Of 22273'),
(@machine_id_22273, 'Unwinding Unit Of 22273'),
(@machine_id_22273, 'Layon Rollers Of Rewinder Unit 22273'),
(@machine_id_22273, 'Layon Rollers Of Unwinder Unit 22273'),
(@machine_id_22273, 'Nip Roller 22273');

-- Insert machine number 22285 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22285)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22285);
END

-- Get the id of Machine no: 22285
DECLARE @machine_id_22285 INT;
SELECT @machine_id_22285 = id FROM machine WHERE process_id = 13 AND number = 22285;

-- Insert sub areas for Machine no: 22285
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22285, 'Rewinding Unit Of 22285'),
(@machine_id_22285, 'Unwinding Unit Of 22285'),
(@machine_id_22285, 'Layon Rollers Of Rewinder Unit 22285'),
(@machine_id_22285, 'Layon Rollers Of Unwinder Unit 22285'),
(@machine_id_22285, 'Nip Roller 22285');

-- Insert machine number 22231 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22231)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22231);
END

-- Get the id of Machine no: 22231
DECLARE @machine_id_22231 INT;
SELECT @machine_id_22231 = id FROM machine WHERE process_id = 13 AND number = 22231;

-- Insert sub areas for Machine no: 22231
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22231, 'Shapper Shaft Of 22231'),
(@machine_id_22231, 'Drive Unit Of 22231'),
(@machine_id_22231, 'Drive Rollers 22231');

-- Insert machine number 22200 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 13 AND number = 22200)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (13, 22200);
END

-- Get the id of Machine no: 22200
DECLARE @machine_id_22200 INT;
SELECT @machine_id_22200 = id FROM machine WHERE process_id = 13 AND number = 22200;

-- Insert sub areas for Machine no: 22200
INSERT INTO sub_area (machine_id, name) VALUES
(@machine_id_22200, 'Slitting Cargo Lifts 22200'),
(@machine_id_22200, 'Packaging Area Machines 22200');

--- ###### INSERTING A NEW PROCESS FINISHING ######

USE cilt;

-- Insert into process table for FINISHING
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Finishing')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Finishing');
END


-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;


-- ######################## RUN FROM HERE 2:06PM ####################################


-- Insert machine number 22151 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22151)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22151);
END

-- Get the id of Machine no: 22151
DECLARE @machine_id_22151 INT;
SELECT @machine_id_22151 = id FROM machine WHERE process_id = 14 AND number = 22151;

-- Insert sub areas for Machine no: 22151
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22151, 'Wrapper Stand Of 22151'),
(@machine_id_22151, 'Glue Tank Unit Of 22151'),
(@machine_id_22151, 'Cone Die Unit Of 22151'),
(@machine_id_22151, 'Main Gear Box Unit Of 22151'),
(@machine_id_22151, 'Vacuum Pump Of 22151'),
(@machine_id_22151, 'Pulleys Of 22151'),
(@machine_id_22151, 'Cone Collect Tray Of 22151'),
(@machine_id_22151, 'Cone Collect Stand Of 22151'),
(@machine_id_22151, 'Trimming Box Of 22151');

-- Insert machine number 22149 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22149)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22149);
END

-- Get the id of Machine no: 22149
DECLARE @machine_id_22149 INT;
SELECT @machine_id_22149 = id FROM machine WHERE process_id = 14 AND number = 22149;

-- Insert sub areas for Machine no: 22149
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22149, 'Wrapper Stand Of 22149'),
(@machine_id_22149, 'Glue Tank Unit Of 22149'),
(@machine_id_22149, 'Cone Die Unit Of 22149'),
(@machine_id_22149, 'Main Gear Box Unit Of 22149'),
(@machine_id_22149, 'Vacuum Pump Of 22149'),
(@machine_id_22149, 'Pulleys Of 22149'),
(@machine_id_22149, 'Cone Collect Tray Of 22149'),
(@machine_id_22149, 'Cone Collect Stand Of 22149'),
(@machine_id_22149, 'Trimming Box Of 22149');

-- Insert machine number 22148 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22148)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22148);
END

-- Get the id of Machine no: 22148
DECLARE @machine_id_22148 INT;
SELECT @machine_id_22148 = id FROM machine WHERE process_id = 14 AND number = 22148;

-- Insert sub areas for Machine no: 22148
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22148, 'Wrapper Stand Of 22148'),
(@machine_id_22148, 'Glue Tank Unit Of 22148'),
(@machine_id_22148, 'Cone Die Unit Of 22148'),
(@machine_id_22148, 'Main Gear Box Unit Of 22148'),
(@machine_id_22148, 'Vacuum Pump Of 22148'),
(@machine_id_22148, 'Pulleys Of 22148'),
(@machine_id_22148, 'Cone Collect Tray Of 22148'),
(@machine_id_22148, 'Cone Collect Stand Of 22148'),
(@machine_id_22148, 'Trimming Box Of 22148');

-- Insert machine number 22147 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22147)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22147);
END

-- Get the id of Machine no: 22147
DECLARE @machine_id_22147 INT;
SELECT @machine_id_22147 = id FROM machine WHERE process_id = 14 AND number = 22147;

-- Insert sub areas for Machine no: 22147
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22147, 'Wrapper Stand Of 22147'),
(@machine_id_22147, 'Glue Tank Unit Of 22147'),
(@machine_id_22147, 'Cone Die Unit Of 22147'),
(@machine_id_22147, 'Main Gear Box Unit Of 22147'),
(@machine_id_22147, 'Vacuum Pump Of 22147'),
(@machine_id_22147, 'Pulleys Of 22147'),
(@machine_id_22147, 'Cone Collect Tray Of 22147'),
(@machine_id_22147, 'Cone Collect Stand Of 22147'),
(@machine_id_22147, 'Trimming Box Of 22147'),
(@machine_id_22147, 'Chain Drive Wrapper Stand Of 22147');

-- Insert machine number 22119 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22119)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22119);
END

-- Get the id of Machine no: 22119
DECLARE @machine_id_22119 INT;
SELECT @machine_id_22119 = id FROM machine WHERE process_id = 14 AND number = 22119;

-- Insert sub areas for Machine no: 22119
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22119, 'Wrapper Stand Of 22119'),
(@machine_id_22119, 'Glue Tank Of 22119'),
(@machine_id_22119, 'Cone Die Unit Of 22119'),
(@machine_id_22119, 'Main Gear Box Unit Of 22119'),
(@machine_id_22119, 'Vacuum Pump Of 22119'),
(@machine_id_22119, 'Pulleys Of 22119'),
(@machine_id_22119, 'Cone Collect Tray Of 22119'),
(@machine_id_22119, 'Cone Collect Stand Of 22119'),
(@machine_id_22119, 'Trimming Box Of 22119');

-- Insert machine number 22136 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22136)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22136);
END

-- Get the id of Machine no: 22136
DECLARE @machine_id_22136 INT;
SELECT @machine_id_22136 = id FROM machine WHERE process_id = 14 AND number = 22136;

-- Insert sub areas for Machine no: 22136
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22136, 'Wrapper Stand Of 22136'),
(@machine_id_22136, 'Glue Tank Unit Of 22136'),
(@machine_id_22136, 'Cone Die Unit Of 22136'),
(@machine_id_22136, 'Main Gear Box Unit Of 22136'),
(@machine_id_22136, 'Vacuum Pump Of 22136'),
(@machine_id_22136, 'Pulleys Of 22136'),
(@machine_id_22136, 'Cone Collect Tray Of 22136'),
(@machine_id_22136, 'Cone Collect Stand Of 22136'),
(@machine_id_22136, 'Trimming Box Of 22136');

-- Insert machine number 22144 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22144)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22144);
END

-- Get the id of Machine no: 22144
DECLARE @machine_id_22144 INT;
SELECT @machine_id_22144 = id FROM machine WHERE process_id = 14 AND number = 22144;

-- Insert sub areas for Machine no: 22144
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22144, 'Unwind Unit Of 22144'),
(@machine_id_22144, 'Load Cell Roller Of 22144'),
(@machine_id_22144, 'Gripper Roller Unit Of 22144'),
(@machine_id_22144, 'Dancer Roller Of 22144'),
(@machine_id_22144, 'Die Assembly Unit Of 22144'),
(@machine_id_22144, 'Trimming Conveyor Belts Of 22144'),
(@machine_id_22144, 'Die Loading Unloading Beam Of 22144');

-- Insert machine number 22139 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22139)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22139);
END

-- Get the id of Machine no: 22139
DECLARE @machine_id_22139 INT;
SELECT @machine_id_22139 = id FROM machine WHERE process_id = 14 AND number = 22139;

-- Insert sub areas for Machine no: 22139
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22139, 'Unwind Unit Of 22139'),
(@machine_id_22139, 'Gripper Roller Unit Of 22139'),
(@machine_id_22139, 'Dancer Roller Of 22139'),
(@machine_id_22139, 'Die Assembly Unit Of 22139'),
(@machine_id_22139, 'Trimming Conveyor Belt Of 22139'),
(@machine_id_22139, 'Die Loading Unloading Beam Of 22139'),
(@machine_id_22139, 'Drive Motor With Gear Box Of 22139');

-- Insert machine number 22117 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22117)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22117);
END

-- Get the id of Machine no: 22117
DECLARE @machine_id_22117 INT;
SELECT @machine_id_22117 = id FROM machine WHERE process_id = 14 AND number = 22117;

-- Insert sub areas for Machine no: 22127
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22117, 'Wrapper Stand Of 22117'),
(@machine_id_22117, 'Glue Tank Of 22117'),
(@machine_id_22117, 'Cone Die Of 22117'),
(@machine_id_22117, 'Main Gear Box Of 22117'),
(@machine_id_22117, 'Vacuum Pump Of 22117'),
(@machine_id_22117, 'Pulleys Of 22117'),
(@machine_id_22117, 'Cone Collect Tray Of 22117'),
(@machine_id_22117, 'Cone Collect Stand Of 22117'),
(@machine_id_22117, 'Trimming Box Of 22117');


-------------------------
-- DELETE FROM MACHINE NO TBALE ALL REPEATING ENTRIES

-- Use the existing database 'cilt'
USE cilt;

-- Delete the entry with id 3 from the machine table
DELETE FROM machine
WHERE id = 97;

-- View the updated machine table
SELECT * FROM machine;

-------------------------
-- DELETE FROM SUB AREA TBALE ALL REPEATING ENTRIES

-- Use the existing database 'cilt'
USE cilt;

-- Delete entries with IDs from 19 to 45 in the sub_area table
DELETE FROM sub_area
WHERE id BETWEEN 856 AND 864;

-- View the updated sub_area table
SELECT * FROM sub_area;

-- @@@@@ RUN FROM HERE 2:32PM @@@@@@@@@@@@@@@@@@

-- Insert machine number 22137 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22137)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22137);
END

-- Get the id of Machine no: 22137
DECLARE @machine_id_22137 INT;
SELECT @machine_id_22137 = id FROM machine WHERE process_id = 14 AND number = 22137;

-- Insert sub areas for Machine no: 22137
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22137, 'Unwind Unit Of 22137'),
(@machine_id_22137, 'Gripper Roller Of 22137'),
(@machine_id_22137, 'Dancer Roller Of 22137'),
(@machine_id_22137, 'Die Assembly Of 22137'),
(@machine_id_22137, 'Trimming Conveyor Of 22137'),
(@machine_id_22137, 'Die Loading Unloading Beam Of 22137');

-- Insert machine number 22240 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22240)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22240);
END

-- Get the id of Machine no: 22240
DECLARE @machine_id_22240 INT;
SELECT @machine_id_22240 = id FROM machine WHERE process_id = 14 AND number = 22240;

-- Insert sub areas for Machine no: 22240
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22240, 'Bag Feeding Unit Of 22240'),
(@machine_id_22240, 'Sealing Die Bed Of 22240'),
(@machine_id_22240, 'Vibrator Unit Of 22240'),
(@machine_id_22240, 'Vacuum Pump Of 22240');

-- Insert machine number 22235 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22235)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22235);
END

-- Get the id of Machine no: 22235
DECLARE @machine_id_22235 INT;
SELECT @machine_id_22235 = id FROM machine WHERE process_id = 14 AND number = 22235;

-- Insert sub areas for Machine no: 22235
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22235, 'Bag Feeding Unit Of 22235'),
(@machine_id_22235, 'Sealing Die Bed Unit Of 22235'),
(@machine_id_22235, 'Vibrator Unit Of 22235'),
(@machine_id_22235, 'Vacuum Pump Of 22235');

-- Insert machine number 22281 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22281)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22281);
END

-- Get the id of Machine no: 22281
DECLARE @machine_id_22281 INT;
SELECT @machine_id_22281 = id FROM machine WHERE process_id = 14 AND number = 22281;

-- Insert sub areas for Machine no: 22281
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22281, 'Bag Feeding Unit Of 22281'),
(@machine_id_22281, 'Sealing Die Bed Unit Of 22281'),
(@machine_id_22281, 'Vibrattor Unit Of 22281'),
(@machine_id_22281, 'Vaccum Pump Of 22281'),
(@machine_id_22281, 'Main Electrical Panel'),
(@machine_id_22281, 'Main Control HMI');

-- Insert machine number 22277 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22277)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22277);
END

-- Get the id of Machine no: 22277
DECLARE @machine_id_22277 INT;
SELECT @machine_id_22277 = id FROM machine WHERE process_id = 14 AND number = 22277;

-- Insert sub areas for Machine no: 22277
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22277, 'Web Guid Unit Of 22277'),
(@machine_id_22277, 'Side Gussite Of 22277'),
(@machine_id_22277, 'Main Dancer Of 22277'),
(@machine_id_22277, 'Zipper Unit Of 22277'),
(@machine_id_22277, 'Gripper Roll3 Of 22277'),
(@machine_id_22277, 'Longitudinal Bed Of 22277'),
(@machine_id_22277, 'Gripper Rolle Unit 2 Of 22277'),
(@machine_id_22277, 'Vertical Die Bed Of 22277'),
(@machine_id_22277, 'Cutting Blade Ass Of 22277'),
(@machine_id_22277, 'Conveyour Belt Of 22277'),
(@machine_id_22277, 'Vacuum Blower Sys Of 22277'),
(@machine_id_22277, 'Trimming Unit Of 22277'),
(@machine_id_22277, 'Main Operator Panel Of 22277'),
(@machine_id_22277, 'Bag Counter Conveyour Belt Of 22277'),
(@machine_id_22277, 'Noch Punch Vertical Die Bed Of 22277'),
(@machine_id_22277, 'Separater Of 22277'),
(@machine_id_22277, 'R3015 Zipper Unit Of 22277'),
(@machine_id_22277, 'Cylinder Cutting Blade Ass Of 22277'),
(@machine_id_22277, 'Cylinder Exhaust Cutting Blade Ass Of 22277'),
(@machine_id_22277, 'Capsoul Punch Vertical Die Bed Of 22277'),
(@machine_id_22277, 'Angle Cylinder Regulator Cutting Blade Ass Of 22277'),
(@machine_id_22277, 'Regulator Noch Punch Vertical Die Bed Of 22277'),
(@machine_id_22277, 'Die Carrage Vertical Die Bed Of 22277'),
(@machine_id_22277, 'Cylinder Valve Conveyour Belt Of 22277'),
(@machine_id_22277, 'Up Main Dancer Of 22277'),
(@machine_id_22277, 'Gripper Roller Cutting Blade Ass Of 22277'),
(@machine_id_22277, 'Triangle Punch Vertical Die Bed Of 22277'),
(@machine_id_22277, 'Unwind Unit Of 22277');

-- Insert machine number 22275 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22275)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22275);
END

-- Get the id of Machine no: 22275
DECLARE @machine_id_22275 INT;
SELECT @machine_id_22275 = id FROM machine WHERE process_id = 14 AND number = 22275;

-- Insert sub areas for Machine no: 22275
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22275, 'Upper Winding Of 22275'),
(@machine_id_22275, 'Unwinding Unit B Of 22275'),
(@machine_id_22275, 'Accumulator Of 22275'),
(@machine_id_22275, 'Dancer Roller Of 22275'),
(@machine_id_22275, 'Rebort Unit Of 22275'),
(@machine_id_22275, 'Longitudinal Die Unit Of 22275'),
(@machine_id_22275, 'Side Gussit Unit Of 22275'),
(@machine_id_22275, 'Gripper Roller Unit No#05 Of 22275'),
(@machine_id_22275, 'Gripper Roller Unit No#04 Of 22275'),
(@machine_id_22275, 'Gripper Roller Unit No#03 Of 22275'),
(@machine_id_22275, 'Gripper Roller Unit No#02 Of 22275'),
(@machine_id_22275, 'Gripper Roller Unit No#01 Of 22275'),
(@machine_id_22275, 'Cutting Blade Assembly Unit Of 22275'),
(@machine_id_22275, 'Conveyor Bed Unit Of 22275'),
(@machine_id_22275, 'Operator Operation LCD Of 22275'),
(@machine_id_22275, 'Main Electrical Panel Of 22275');

-- Insert machine number 22207 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22207)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22207);
END

-- Get the id of Machine no: 22207
DECLARE @machine_id_22207 INT;
SELECT @machine_id_22207 = id FROM machine WHERE process_id = 14 AND number = 22207;

-- Insert sub areas for Machine no: 22207
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22207, 'Unwind Unit Of 22207'),
(@machine_id_22207, 'Side Gussite Unit Of 22207'),
(@machine_id_22207, 'Dancer Roller Unit Of 22207'),
(@machine_id_22207, 'Gusset Unwind Unit Of 22207'),
(@machine_id_22207, 'Longitudinal Die Of 22207'),
(@machine_id_22207, 'Vertical Die Bed Of 22207'),
(@machine_id_22207, 'Blade Assembly Of 22207'),
(@machine_id_22207, 'Trimming Unit Of 22207');

-- 3:07PM                                           &&&&&&&&&&&&&&&&&&


-- Insert machine number 22239 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22239)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22239);
END

-- Get the id of Machine no: 22239
DECLARE @machine_id_22239 INT;
SELECT @machine_id_22239 = id FROM machine WHERE process_id = 14 AND number = 22239;

-- Insert sub areas for Machine no: 22239
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22239, 'Unwind Unit Of 22239'),
(@machine_id_22239, 'Side Gussite Unit Of 22239'),
(@machine_id_22239, 'Dancer Roller Unit Of 22239'),
(@machine_id_22239, 'Longitudinal Die Of 22239'),
(@machine_id_22239, 'Vertical Die Bed Of 22239'),
(@machine_id_22239, 'Blade Assembly Of 22239'),
(@machine_id_22239, 'Trimming Unit Of 22239'),
(@machine_id_22239, 'Operator Operation LCD Of 22239'),
(@machine_id_22239, 'Main Electrical Panel Of 22239');

-- Insert machine number 22269 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22269)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22269);
END

-- Get the id of Machine no: 22269
DECLARE @machine_id_22269 INT;
SELECT @machine_id_22269 = id FROM machine WHERE process_id = 14 AND number = 22269;

-- Insert sub areas for Machine no: 22269
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22269, 'Unwind Unit B Of 22269'),
(@machine_id_22269, 'Unwind Accumulator Of 22269'),
(@machine_id_22269, 'Unwind Dancer Roller Of 22269'),
(@machine_id_22269, 'Unwind Rebort Unit Of 22269'),
(@machine_id_22269, 'Unwind Side Gussit Of 22269'),
(@machine_id_22269, 'Unwind Longitudinal Die Of 22269'),
(@machine_id_22269, 'Upper Gripper Roller Of 22269'),
(@machine_id_22269, 'Gripper Roller 04 Of 22269'),
(@machine_id_22269, 'Gripper Roller 03 Of 22269'),
(@machine_id_22269, 'Upper Gripper Dancer Roller Of 22269'),
(@machine_id_22269, 'Gripper Roller Unit No #01 Of 22269'),
(@machine_id_22269, 'Cutting Blade Assembly Unit Of 22269'),
(@machine_id_22269, 'Conveyor Bed Unit Of 22269'),
(@machine_id_22269, 'Operator Operation LCD Of 22269'),
(@machine_id_22269, 'Main Electrical Panel Of 22269');

-- Insert machine number 22264 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22264)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22264);
END

-- Get the id of Machine no: 22264
DECLARE @machine_id_22264 INT;
SELECT @machine_id_22264 = id FROM machine WHERE process_id = 14 AND number = 22264;

-- Insert sub areas for Machine no: 22264
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22264, 'Unwind Unit Of 22264'),
(@machine_id_22264, 'Embossing Unit Of 22264'),
(@machine_id_22264, 'Steel Nipe Roller Of 22264'),
(@machine_id_22264, 'Gripper Roller Unit Of 22264'),
(@machine_id_22264, 'Hole Punch Unit Of 22264'),
(@machine_id_22264, 'Gripper Roller Unit2 Of 22264'),
(@machine_id_22264, 'Dancer Roller Unit Of 22264'),
(@machine_id_22264, 'U.V Light Unit Of 22264'),
(@machine_id_22264, 'Winding Unit Of 22264'),
(@machine_id_22264, 'Drive Of Embossing Unit Of 22264');

-- Insert machine number 22265 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22265)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22265);
END

-- Get the id of Machine no: 22265
DECLARE @machine_id_22265 INT;
SELECT @machine_id_22265 = id FROM machine WHERE process_id = 14 AND number = 22265;

-- Insert sub areas for Machine no: 22265
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22265, 'Unwind Unit Of 22265'),
(@machine_id_22265, 'Embossing Unit Of 22265'),
(@machine_id_22265, 'Steel Nipe Roller Of 22265'),
(@machine_id_22265, 'Dancer Roller Unit Of 22265'),
(@machine_id_22265, 'Die Drive Cutting Motor Of 22265'),
(@machine_id_22265, 'Die Assembly Unit Of 22265'),
(@machine_id_22265, 'Web Control Side Wise Unit Of 22265'),
(@machine_id_22265, 'Gripper Roller Web Control Of 22265'),
(@machine_id_22265, 'Embossing Unit Of 22265'),
(@machine_id_22265, 'Die Drive Of 22265');

-- Insert machine number 22152 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22152)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22152);
END

-- Get the id of Machine no: 22152
DECLARE @machine_id_22152 INT;
SELECT @machine_id_22152 = id FROM machine WHERE process_id = 14 AND number = 22152;

-- Insert sub areas for Machine no: 22152
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22152, 'Unwinding Unit Of 22152'),
(@machine_id_22152, 'Web Foolding Unit Of 22152'),
(@machine_id_22152, 'Side Gussite Plate+Wheel Of 22152'),
(@machine_id_22152, 'Dancer Roller Unit Of 22152'),
(@machine_id_22152, 'Perforation + Hole Punch Bed Of 22152'),
(@machine_id_22152, 'Perforation + Hole Of 22152'),
(@machine_id_22152, 'Sealing Die Unit Of 22152'),
(@machine_id_22152, 'Dancer Roller Unit Of 22152');

-- Insert machine number 22138 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22138)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22138);
END

-- Get the id of Machine no: 22138
DECLARE @machine_id_22138 INT;
SELECT @machine_id_22138 = id FROM machine WHERE process_id = 14 AND number = 22138;

-- Insert sub areas for Machine no: 22138
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22138, 'Unwind Unit Of 22138'),
(@machine_id_22138, 'Gripper Roller Of 22138'),
(@machine_id_22138, 'Hole Punch Unit Of 22138'),
(@machine_id_22138, 'Gussite Control Unit Of 22138'),
(@machine_id_22138, 'Hole Punch Unit Of 22138'),
(@machine_id_22138, 'Front Gripper Roller Unit Of 22138'),
(@machine_id_22138, 'Die Sealing Unit Of 22138'),
(@machine_id_22138, 'Triming Blower Unit Of 22138'),
(@machine_id_22138, 'Main Drive Motor Unit Of 22138');



-- Insert machine number 22124 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22124)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22124);
END

-- Get the id of Machine no: 22124
DECLARE @machine_id_22124 INT;
SELECT @machine_id_22124 = id FROM machine WHERE process_id = 14 AND number = 22124;

-- Insert sub areas for Machine no: 22124
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22124, 'Unwinding Unit Of 22124'),
(@machine_id_22124, 'Web Foolding Unit Of 22124'),
(@machine_id_22124, 'Back Side Gripper Roller Of 22124'),
(@machine_id_22124, 'Hole Punch Unit Of 22124'),
(@machine_id_22124, 'Gussite Control  Unit Of 22124'),
(@machine_id_22124, 'Hole Punch + Photo Cell Of 22124'),
(@machine_id_22124, 'Gripper Roller Unit Of 22124'),
(@machine_id_22124, 'Die Sealing Unit Of 22124'),
(@machine_id_22124, 'Triming Blower Of 22124');


-- Insert machine number 22262 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22262)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22262);
END

-- Get the id of Machine no: 22262
DECLARE @machine_id_22262 INT;
SELECT @machine_id_22262 = id FROM machine WHERE process_id = 14 AND number = 22262;

-- Insert sub areas for Machine no: 22262
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22262, 'Unwinding Unit Of 22262'),
(@machine_id_22262, 'Perforation Unit Of 22262'),
(@machine_id_22262, 'Punches + Die Of 22262'),
(@machine_id_22262, 'Gripper Roller Unit Of 22262'),
(@machine_id_22262, 'Blade Assembly Of 22262'),
(@machine_id_22262, 'Canveryor Belt Of 22262'),
(@machine_id_22262, 'Operator Opeation LCD Of 22262'),
(@machine_id_22262, 'Main Electical Panel Of 22262');

-- Insert machine number 22295 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22295)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22295);
END

-- Get the id of Machine no: 22295
DECLARE @machine_id_22295 INT;
SELECT @machine_id_22295 = id FROM machine WHERE process_id = 14 AND number = 22295;

-- Insert sub areas for Machine no: 22295
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22295, 'Unwind Unit Of 22295'),
(@machine_id_22295, 'Griper Roller Of 22295'),
(@machine_id_22295, 'Gussit Unit Of 22295'),
(@machine_id_22295, 'Perforation Unit Of 22295'),
(@machine_id_22295, 'Glue Device Of 22295'),
(@machine_id_22295, 'Dancer Roller Of 22295'),
(@machine_id_22295, 'Actuator Unit Of 22295'),
(@machine_id_22295, 'Unwinding Unit Of 22295'),
(@machine_id_22295, 'Operator Opeation LCD Of 22295'),
(@machine_id_22295, 'Main Electrical Panel Of 22295');


-- Insert machine number 22283 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22283)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22283);
END

-- Get the id of Machine no: 22283
DECLARE @machine_id_22283 INT;
SELECT @machine_id_22283 = id FROM machine WHERE process_id = 14 AND number = 22283;

-- Insert sub areas for Machine no: 22283
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22283, 'Unwind Unit Of 22283'),
(@machine_id_22283, 'Side Gussite Unit Of 22283'),
(@machine_id_22283, 'Dancer Roller Unit Of 22283'),
(@machine_id_22283, 'Longitudinal Die Unit Of 22283'),
(@machine_id_22283, 'Vertical Die Bed Unit Of 22283'),
(@machine_id_22283, 'Cutting Blade Assembly Unit Of 22283'),
(@machine_id_22283, 'Triming Unit Of 22283');

-- Insert machine number 22209 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22209)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22209);
END

-- Get the id of Machine no: 22209
DECLARE @machine_id_22209 INT;
SELECT @machine_id_22209 = id FROM machine WHERE process_id = 14 AND number = 22209;

-- Insert sub areas for Machine no: 22209
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22209, 'Unwind Unit Of 22209'),
(@machine_id_22209, 'Electrical Panel Of 22209'),
(@machine_id_22209, 'Gussit unit Of 22209'),
(@machine_id_22209, 'Vertical Die Of 22209'),
(@machine_id_22209, 'Winding Unit Of 22209'),
(@machine_id_22209, 'Main Drive Motor Of 22209');

-- Insert machine number 22200 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 14 AND number = 22200)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (14, 22200);
END


-- ########### CREATING PROCESS SRP ############

USE cilt;

-- Insert into process table for SRP
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'SRP')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'SRP');
END

-- CHECKING ---
-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;

-- Insert machine number 22299 into process id 15 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 15 AND number = 22299)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (15, 22299);
END

-- Get the id of Machine no: 22299
DECLARE @machine_id_22299 INT;
SELECT @machine_id_22299 = id FROM machine WHERE process_id = 15 AND number = 22299;

-- Insert sub areas for Machine no: 22299
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_22299, 'Oil Heating Unit Tpc 1500 22299'),
(@machine_id_22299, 'Gas Chromatograph Gc Neptune 803 22299'),
(@machine_id_22299, 'Air Compressor Zt-75 22299'),
(@machine_id_22299, 'Siemens CO2,O2,CO,Solvent Analyser 22229'),
(@machine_id_22299, 'Trane Chiller 22299'),
(@machine_id_22299, 'Nitrogen Generator Ng-500 22299'),
(@machine_id_22299, 'Cooling Tower 22299'),
(@machine_id_22299, 'Filter Room # 1 22299'),
(@machine_id_22299, 'Filter Room # 2 22299'),
(@machine_id_22299, 'UDS System 22299'),
(@machine_id_22299, 'Distillation Unit C9100 22299'),
(@machine_id_22299, 'Distillation Unit C9200 22299'),
(@machine_id_22299, 'Seven Stages Tank 22299'),
(@machine_id_22299, 'Skid_1 22299'),
(@machine_id_22299, 'Skid_2 22299'),
(@machine_id_22299, 'Distillation Unit C9300 22299');

-- ########### CREATING PROCESS QA  ############

USE cilt;

-- Insert into process table for QA
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'QA')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'QA');
END

-- Insert machine number 26016 into process id 16 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 16 AND number = 26016)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (16, 26016);
END

-- Get the id of Machine no: 26016
DECLARE @machine_id_26016 INT;
SELECT @machine_id_26016 = id FROM machine WHERE process_id = 16 AND number = 26016;

-- Insert sub areas for Machine no: 26016
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_26016, 'Peel Tester Old 26016'),
(@machine_id_26016, 'Cof Tester 26016'),
(@machine_id_26016, 'Brust & Leak Tester 26016'),
(@machine_id_26016, 'Gas Chromatography 26016'),
(@machine_id_26016, 'Weighing Balance 26016'),
(@machine_id_26016, 'Micron Meter 26016'),
(@machine_id_26016, 'Peel Tester New 26016'),
(@machine_id_26016, 'Lab Heat Sealer 26016'),
(@machine_id_26016, 'Gradiant Heat Sealer 26016'),
(@machine_id_26016, 'Circular Rub Tester 26016'),
(@machine_id_26016, 'Refrigerator 26016'),
(@machine_id_26016, 'Day Light Shade Tester 26016'),
(@machine_id_26016, 'Core Collapsing Strength Tester 26016'),
(@machine_id_26016, 'Nitrogen Generator 26016'),
(@machine_id_26016, 'Hydrogen Genertor 26016'),
(@machine_id_26016, 'Digital Oven 26016'),
(@machine_id_26016, 'Hot Air Circulation Oven 26016'),
(@machine_id_26016, 'Furnace 26016'),
(@machine_id_26016, 'Falling Dot Impact Tester 26016'),
(@machine_id_26016, 'Air Compressor # 1 For Gc_Imported 26016'),
(@machine_id_26016, 'Air Compressor # 2 For Gc_Local 26016'),
(@machine_id_26016, 'Samples Cutting Templates 26016');

-- ########### CREATING PROCESS Electrical Panel Rooms ############

USE cilt;

-- Insert into process table
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE name = 'Bufp';

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Electrical Panel Rooms')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Electrical Panel Rooms');
END


-- DONT RUN THIS YET -------


-- Insert machine number T66 into process id 17 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 17 AND number = T66)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (17, T66);
END

-- Insert machine number  into process id 17 if it doesn't exist
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 16 AND number = 26016)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (16, 26016);
END

---------- DONT RUN THE ABOVE JUST YET ------


-- ####################################################################################################################################

--    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                  CREATING BU BUFP            @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- Insert new business unit named 'BUFC'
INSERT INTO business_unit (name) VALUES ('BUFC');

-- Insert the process into the process table, Art and Development Lab
DECLARE @business_unit_id INT;
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Art and Development Lab')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Art and Development Lab');
END

-- enter machines in A&DL
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 18 AND number = 26014)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (18, 26014);
END

-- ENTER PROCESS PLATE MAKING
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Plate Making')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Plate Making');
END

-- CHECKING ---
-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;

-- ENTER PROCESS Cutting and Creasing
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Cutting and Creasing')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Cutting and Creasing');
END
 

-- enter machines in cnc
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21303)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21303);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21308)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21308);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21312)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21312);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21309)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21309);
END

-- has sub areas:

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21328)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21328);
END

-- Get the id of Machine no: 21328
DECLARE @machine_id_21328 INT;
SELECT @machine_id_21328 = id FROM machine WHERE number = 21328;

-- Insert sub areas for Machine no: 21328
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21328, 'Feed Pile Station 21328'),
(@machine_id_21328, 'Feeder Table 21328'),
(@machine_id_21328, 'Infeed 21328'),
(@machine_id_21328, 'Die Cutting Unit 21328'),
(@machine_id_21328, 'Stripping Waste Unit 21328'),
(@machine_id_21328, 'Delivery Unit 21328');


-- run from here 10:59AM
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21330)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21330);
END

-- Get the id of Machine no: 21330
DECLARE @machine_id_21330 INT;
SELECT @machine_id_21330 = id FROM machine WHERE process_id = 20 AND number = 21330;

-- Insert sub areas for Machine no: 21330
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21330, 'Pile Station 21330'),
(@machine_id_21330, 'Feeder Head 21330'),
(@machine_id_21330, 'Feeder Table 21330'),
(@machine_id_21330, 'Infeed 21330'),
(@machine_id_21330, 'Die Cutting Unit 21330'),
(@machine_id_21330, 'Stripping & HFS Unit 21330'),
(@machine_id_21330, 'Delivery Unit 21330');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21323)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21323);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21331)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21331);
END

-- Get the id of Machine no: 21331
DECLARE @machine_id_21331 INT;
SELECT @machine_id_21331 = id FROM machine WHERE process_id = 20 AND number = 21331;

-- Insert sub areas for Machine no: 21331
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21331, 'Pile Station 21331'),
(@machine_id_21331, 'Feeder Head 21331'),
(@machine_id_21331, 'Feeder Table 21331'),
(@machine_id_21331, 'Infeed & Power Register 21331'),
(@machine_id_21331, 'Die Cutting Unit 21331'),
(@machine_id_21331, 'Stripping Unit 21331'),
(@machine_id_21331, 'Delivery Unit 21331');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21335)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21335);
END

-- Get the id of Machine no: 21335
DECLARE @machine_id_21335 INT;
SELECT @machine_id_21335 = id FROM machine WHERE process_id = 20 AND number = 21335;

-- Insert sub areas for Machine no: 21335
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21335, 'Feed Pile Station 21335'),
(@machine_id_21335, 'Feeder Head 21335'),
(@machine_id_21335, 'Feeder Table 21335'),
(@machine_id_21335, 'Infeed & Power Register 21335'),
(@machine_id_21335, 'Die Cutting Unit 21335'),
(@machine_id_21335, 'Stripping Unit 21335'),
(@machine_id_21335, 'Delivery Unit 21335');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21334)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21334);
END

-- Get the id of Machine no: 21334
DECLARE @machine_id_21334 INT;
SELECT @machine_id_21334 = id FROM machine WHERE process_id = 20 AND number = 21334;

-- Insert sub areas for Machine no: 21334
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21334, 'Feed Pile Station 21334'),
(@machine_id_21334, 'Feeder Head 21334'),
(@machine_id_21334, 'Feeder Table 21334'),
(@machine_id_21334, 'Infeed 21334'),
(@machine_id_21334, 'Die Cutting Unit 21334'),
(@machine_id_21334, 'Stripping Unit 21334'),
(@machine_id_21334, 'Delivery Unit 21334'),
(@machine_id_21334, 'Auxiliaries 21334');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21333)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21333);
END

-- Get the id of Machine no: 21333
DECLARE @machine_id_21333 INT;
SELECT @machine_id_21333 = id FROM machine WHERE process_id = 20 AND number = 21333;

-- Insert sub areas for Machine no: 21333
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21333, 'Feed Pile Station 21333'),
(@machine_id_21333, 'Feeder Head 21333'),
(@machine_id_21333, 'Feeder Table 21333'),
(@machine_id_21333, 'Infeed 21333'),
(@machine_id_21333, 'Die Cutting Unit 21333'),
(@machine_id_21333, 'Stripping Unit 21333'),
(@machine_id_21333, 'Delivery Unit 21333'),
(@machine_id_21333, 'Auxiliaries 21333');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 20 AND number = 21336)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (20, 21336);
END

-- Get the id of Machine no: 21336
DECLARE @machine_id_21336 INT;
SELECT @machine_id_21336 = id FROM machine WHERE process_id = 20 AND number = 21336;

-- Insert sub areas for Machine no: 21336
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21336, 'Feed Pile Station 21336'),
(@machine_id_21336, 'Feeder Head 21336'),
(@machine_id_21336, 'Feeder Table 21336'),
(@machine_id_21336, 'Infeed & Power Register 21336'),
(@machine_id_21336, 'Die Cutting Unit 21336'),
(@machine_id_21336, 'Stripping & Blanking Unit 21336'),
(@machine_id_21336, 'Delivery Unit 21336'),
(@machine_id_21336, 'Waste Conveyor System 21336'),
(@machine_id_21336, 'Auxiliaries 21336');


-- PROCESS FOLDING AND GLUING

DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Folding & Gluing')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Folding & Gluing');
END

-- CHECKING ---
-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;

-- run from here 11:33

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 21 AND number = 21402)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (21, 21402);
END

-- Get the id of Machine no: 21402
DECLARE @machine_id_21402 INT;
SELECT @machine_id_21402 = id FROM machine WHERE process_id = 21 AND number = 21402;

-- Insert sub areas for Machine no: 21402
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21402, 'Feeder 21402'),
(@machine_id_21402, '1st and 3rd Crease Unit 21402'),
(@machine_id_21402, '2nd and 4th Crease Unit 21402'),
(@machine_id_21402, 'Ejector Unit 21402'),
(@machine_id_21402, 'Press 21402'),
(@machine_id_21402, 'Handy-pack 21402');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 21 AND number = 21422)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (21, 21422);
END

-- Get the id of Machine no: 21422
DECLARE @machine_id_21422 INT;
SELECT @machine_id_21422 = id FROM machine WHERE process_id = 21 AND number = 21422;

-- Insert sub areas for Machine no: 21422
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21422, 'Feeder 21422'),
(@machine_id_21422, 'Positioning unit 21422'),
(@machine_id_21422, 'Gluing unit 21422'),
(@machine_id_21422, 'Film patching unit 21422'),
(@machine_id_21422, 'Delivery conveyer 21422');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 21 AND number = 21404)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (21, 21404);
END

-- Get the id of Machine no: 21404
DECLARE @machine_id_21404 INT;
SELECT @machine_id_21404 = id FROM machine WHERE process_id = 21 AND number = 21404;

-- Insert sub areas for Machine no: 21404
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21404, 'Feeder 21404'),
(@machine_id_21404, '1st and 3rd Crease Unit 21404'),
(@machine_id_21404, '2nd and 4th Crease Unit 21404'),
(@machine_id_21404, 'Ejector Unit 21404'),
(@machine_id_21404, 'Press 21404'),
(@machine_id_21404, 'Handy-pack 21404');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 21 AND number = 21423)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (21, 21423);
END

-- Get the id of Machine no: 21423
DECLARE @machine_id_21423 INT;
SELECT @machine_id_21423 = id FROM machine WHERE process_id = 21 AND number = 21423;

-- Insert sub areas for Machine no: 21423
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21423, 'Feeder 21423'),
(@machine_id_21423, '1st and 3rd Crease Unit 21423'),
(@machine_id_21423, '2nd and 4th Crease Unit 21423'),
(@machine_id_21423, 'Ejector Unit 21423'),
(@machine_id_21423, 'Pressing Unit 21423'),
(@machine_id_21423, 'Handy-pack 21423');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 21 AND number = 21424)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (21, 21424);
END

-- Get the id of Machine no: 21424
DECLARE @machine_id_21424 INT;
SELECT @machine_id_21424 = id FROM machine WHERE process_id = 21 AND number = 21424;

-- Insert sub areas for Machine no: 21424
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21424, 'Feeder 21424'),
(@machine_id_21424, '1st and 3rd Crease Unit 21424'),
(@machine_id_21424, '2nd and 4th Crease Unit 21424'),
(@machine_id_21424, 'Ejector Unit 21424'),
(@machine_id_21424, 'Pressing Unit 21424'),
(@machine_id_21424, 'Handy-pack 21424');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 21 AND number = 21425)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (21, 21425);
END

-- Get the id of Machine no: 21425
DECLARE @machine_id_21425 INT;
SELECT @machine_id_21425 = id FROM machine WHERE process_id = 21 AND number = 21425;

-- Insert sub areas for Machine no: 21425
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21425, 'Feeder 21425'),
(@machine_id_21425, '1st and 3rd Crease Unit 21425'),
(@machine_id_21425, '2nd and 4th Crease Unit 21425'),
(@machine_id_21425, 'Ejector Unit 21425'),
(@machine_id_21425, 'Pressing Unit 21425'),
(@machine_id_21425, 'Handy-pack 21425');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 21 AND number = 21427)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (21, 21427);
END

-- Get the id of Machine no: 21427
DECLARE @machine_id_21427 INT;
SELECT @machine_id_21427 = id FROM machine WHERE process_id = 21 AND number = 21427;

-- Insert sub areas for Machine no: 21427
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21427, 'Feeder Unit 21427'),
(@machine_id_21427, '1st and 3rd Crease Unit 21427'),
(@machine_id_21427, 'Glue Application System 21427'),
(@machine_id_21427, 'Ejector Section/Unit 21427'),
(@machine_id_21427, 'Pressing Station/System 21427'),
(@machine_id_21427, 'Handy-pack 21427');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 21 AND number = 21421)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (21, 21421);
END

-- Get the id of Machine no: 21421
DECLARE @machine_id_21421 INT;
SELECT @machine_id_21421 = id FROM machine WHERE process_id = 21 AND number = 21421;

-- Insert sub areas for Machine no: 21421
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21421, 'Feeder Unit 21421'),
(@machine_id_21421, 'Feed Table 21421'),
(@machine_id_21421, 'Glue Application Unit 21421'),
(@machine_id_21421, 'Chains & Drive 21421'),
(@machine_id_21421, 'Folding Unit & Mould 21421'),
(@machine_id_21421, 'Delivery Unit 21421');

-- CHECKING ---
-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;

-- PROCESS LEMANIC ROTO PRINTING

DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Lemanic Roto Printing')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Lemanic Roto Printing');
END

--adding machines in process id 22
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 22 AND number = 21501)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (22, 21501);
END

-- Get the id of Machine no: 21501
DECLARE @machine_id_21501 INT;
SELECT @machine_id_21501 = id FROM machine WHERE process_id = 22 AND number = 21501;

-- Insert sub areas for Machine no: 21501
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21501, 'Reel Stand 21501'),
(@machine_id_21501, 'Web Guide Infeed 21501'),
(@machine_id_21501, 'Infeed Nip 21501'),
(@machine_id_21501, 'Web Cleaning Unit 21501'),
(@machine_id_21501, 'Printing Unit # 1 21501'),
(@machine_id_21501, 'Printing Unit # 2 21501'),
(@machine_id_21501, 'Printing Unit # 3 21501'),
(@machine_id_21501, 'Printing Unit # 4 21501'),
(@machine_id_21501, 'Printing Unit # 5 21501'),
(@machine_id_21501, 'Printing Unit # 6 21501'),
(@machine_id_21501, 'Printing Unit # 7 21501'),
(@machine_id_21501, 'Printing Unit # 8 21501'),
(@machine_id_21501, 'Printing Unit # 9 21501'),
(@machine_id_21501, 'Embossing Unit 21501'),
(@machine_id_21501, 'IQ-300 21501'),
(@machine_id_21501, 'Eccentric Feed System 21501'),
(@machine_id_21501, 'Platen Press/Die Cutting 21501'),
(@machine_id_21501, 'Sheet Separator/Tab Breaker 21501'),
(@machine_id_21501, 'Delivery Belts 21501'),
(@machine_id_21501, 'Delivery Stacker 21501');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 22 AND number = 21502)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (22, 21502);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 22 AND number = 21505)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (22, 21505);
END
-- Get the id of Machine no: 21505
DECLARE @machine_id_21505 INT;
SELECT @machine_id_21505 = id FROM machine WHERE process_id = 22 AND number = 21505;

-- Insert sub areas for Machine no: 21505
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21505, 'Reel Stand 21505'),
(@machine_id_21505, 'Web Guide Infeed 21505'),
(@machine_id_21505, 'Infeed Nip 21505'),
(@machine_id_21505, 'Web Cleaning Unit 21505'),
(@machine_id_21505, 'Printing Unit # 1 21505'),
(@machine_id_21505, 'Printing Unit # 2 21505'),
(@machine_id_21505, 'Printing Unit # 3 21505'),
(@machine_id_21505, 'Printing Unit # 4 21505'),
(@machine_id_21505, 'Printing Unit # 5 21505'),
(@machine_id_21505, 'Printing Unit # 6 21505'),
(@machine_id_21505, 'Printing Unit # 7 21505'),
(@machine_id_21505, 'Printing Unit # 8 21505'),
(@machine_id_21505, 'Printing Unit # 9 21505'),
(@machine_id_21505, 'Printing Unit # 10 21505'),
(@machine_id_21505, 'DR-67 Unit 21505'),
(@machine_id_21505, 'Vacuum Table 21505'),
(@machine_id_21505, 'Tab Breaker 21505'),
(@machine_id_21505, 'Speed Flow 21505'),
(@machine_id_21505, 'Auxiliaries 21505');

-- PROCESS OFFSET PRINTING

DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Offset Printing')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Offset Printing');
END

-- run from here 2:12PM: 

-- machines in offset printing
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 23 AND number = 21219)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (23, 21219);
END

-- Get the id of Machine no: 21219
DECLARE @machine_id_21219 INT;
SELECT @machine_id_21219 = id FROM machine WHERE process_id = 23 AND number = 21219;

-- Insert sub areas for Machine no: 21219
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21219, 'Feeder 21219'),
(@machine_id_21219, 'Feed Table 21219'),
(@machine_id_21219, 'Infeed 21219'),
(@machine_id_21219, 'Printing Unit # 1 21219'),
(@machine_id_21219, 'Printing Unit # 2 21219'),
(@machine_id_21219, 'Printing Unit # 3 21219'),
(@machine_id_21219, 'Printing Unit # 4 21219'),
(@machine_id_21219, 'Printing Unit # 5 21219'),
(@machine_id_21219, 'Printing Unit # 6 21219'),
(@machine_id_21219, 'Coating Unit 21219'),
(@machine_id_21219, 'Delivery Unit 21219'),
(@machine_id_21219, 'Auxiliaries 21219'),
(@machine_id_21219, 'Main Panel Of KBA 21219');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 23 AND number = 21227)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (23, 21227);
END
-- Get the id of Machine no: 21227
DECLARE @machine_id_21227 INT;
SELECT @machine_id_21227 = id FROM machine WHERE process_id = 23 AND number = 21227;

-- Insert sub areas for Machine no: 21227
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21227, 'Feeder 21227'),
(@machine_id_21227, 'Feed Table 21227'),
(@machine_id_21227, 'Infeed 21227'),
(@machine_id_21227, 'Printing Unit # 1 21227'),
(@machine_id_21227, 'Printing Unit # 2 21227'),
(@machine_id_21227, 'Printing Unit # 3 21227'),
(@machine_id_21227, 'Printing Unit # 4 21227'),
(@machine_id_21227, 'Printing Unit # 5 21227'),
(@machine_id_21227, 'Printing Unit # 6 21227'),
(@machine_id_21227, 'Printing Unit # 7 21227'),
(@machine_id_21227, 'Coating Unit # 1 21227'),
(@machine_id_21227, 'Dryer Unit # 1 21227'),
(@machine_id_21227, 'Dryer Unit # 2 21227'),
(@machine_id_21227, 'Coating Unit # 2 21227'),
(@machine_id_21227, 'Delivery Unit 21227'),
(@machine_id_21227, 'Auxiliaries 21227');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 23 AND number = 21228)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (23, 21228);
END

-- Get the id of Machine no: 21228
DECLARE @machine_id_21228 INT;
SELECT @machine_id_21228 = id FROM machine WHERE process_id = 23 AND number = 21228;

-- Insert sub areas for Machine no: 21228
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21228, 'Feeder 21228'),
(@machine_id_21228, 'Feed Table 21228'),
(@machine_id_21228, 'Infeed 21228'),
(@machine_id_21228, 'Printing Unit # 1 21228'),
(@machine_id_21228, 'Printing Unit # 2 21228'),
(@machine_id_21228, 'Printing Unit # 3 21228'),
(@machine_id_21228, 'Printing Unit # 4 21228'),
(@machine_id_21228, 'Printing Unit # 5 21228'),
(@machine_id_21228, 'Printing Unit # 6 21228'),
(@machine_id_21228, 'Printing Unit # 7 21228'),
(@machine_id_21228, 'Coating Unit # 1 21228'),
(@machine_id_21228, 'Dryer Unit # 1 21228'),
(@machine_id_21228, 'Dryer Unit # 2 21228'),
(@machine_id_21228, 'Coating Unit # 2 21228'),
(@machine_id_21228, 'Delivery Unit 21228'),
(@machine_id_21228, 'Auxiliaries 21228'),
(@machine_id_21228, 'Feeder Table Unit 21228');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 23 AND number = 21230)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (23, 21230);
END

-- Get the id of Machine no: 21230
DECLARE @machine_id_21230 INT;
SELECT @machine_id_21230 = id FROM machine WHERE process_id = 23 AND number = 21230;

-- Insert sub areas for Machine no: 21230
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21230, 'Infeed Unit 21230'),
(@machine_id_21230, 'Feeder Table Unit 21230'),
(@machine_id_21230, 'Printing Unit # 1 21230'),
(@machine_id_21230, 'Printing Unit # 2 21230'),
(@machine_id_21230, 'Printing Unit # 3 21230'),
(@machine_id_21230, 'Printing Unit # 4 21230'),
(@machine_id_21230, 'Printing Unit # 5 21230'),
(@machine_id_21230, 'Printing Unit # 6 21230'),
(@machine_id_21230, 'Coating Unit # 1 21230'),
(@machine_id_21230, 'Coating Unit # 2 21230'),
(@machine_id_21230, 'Drying Unit # 1 21230'),
(@machine_id_21230, 'Drying Unit # 2 21230'),
(@machine_id_21230, 'Delivery Unit 21230'),
(@machine_id_21230, 'Auxiliaries 21230');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 23 AND number = 21241)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (23, 21241);
END

-- PROCESS CUP MAKING

DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Cup Making')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Cup Making');
END

-- entering machines in cup making

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 24 AND number = 21601)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (24, 21601);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 24 AND number = 21602)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (24, 21602);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 24 AND number = 21604)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (24, 21604);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 24 AND number = 21605)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (24, 21605);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 24 AND number = 21606)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (24, 21606);
END

-- Get the id of Machine no: 21606
DECLARE @machine_id_21606 INT;
SELECT @machine_id_21606 = id FROM machine WHERE process_id = 24 AND number = 21606;

-- Insert sub areas for Machine no: 21606
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21606, 'Feeding Station/Unit 21606'),
(@machine_id_21606, 'Paper Gripper Unit 21606'),
(@machine_id_21606, 'Bottom Die Unit 21606'),
(@machine_id_21606, 'Turn Table-1/Mandrel Turret 21606'),
(@machine_id_21606, 'Bottom Heating Station 21606'),
(@machine_id_21606, 'Bottom Knurling/Finishing Station 21606'),
(@machine_id_21606, 'Turn Table-2/Packet Turret 21606'),
(@machine_id_21606, 'Grooving Station 21606'),
(@machine_id_21606, 'Delivery Transfer System 21606');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 24 AND number = 21607)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (24, 21607);
END

-- Get the id of Machine no: 21607
DECLARE @machine_id_21607 INT;
SELECT @machine_id_21607 = id FROM machine WHERE process_id = 24 AND number = 21607;

-- Insert sub areas for Machine no: 21607
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_21606, 'Feeding Station/Unit 21607'),
(@machine_id_21606, 'Paper Gripper Unit 21607'),
(@machine_id_21606, 'Bottom Die Unit 21607'),
(@machine_id_21606, 'Turn Table-1/Mandrel Turret 21607'),
(@machine_id_21606, 'Bottom Heating Station 21607'),
(@machine_id_21606, 'Bottom Knurling/Finishing Station 21607'),
(@machine_id_21606, 'Turn Table-2/Packet Turret 21607'),
(@machine_id_21606, 'Grooving Station 21607'),
(@machine_id_21606, 'Delivery Transfer System 21607');

-- Process Poly Lamination
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Poly Lamination')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Poly Lamination');
END

-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;

-- entering machines into process poly lamination
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 25 AND number = 21801)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (25, 21801);
END

-- process UTILITIES
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Utilities')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Utilities');
END


-- entering machines into process utilities
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 26 AND number = 21324)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (26, 21324);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 26 AND number = 21200)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (26, 21200);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 26 AND number = 26013)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (26, 26013);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 26 AND number = 21500)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (26, 21500);
END


-- process QC Lab
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'QC Lab')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'QC Lab');
END

-- entering machines 

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 27 AND number = 20668)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (27, 20668);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 27 AND number = 20680)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (27, 20680);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 27 AND number = 20681)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (27, 20681);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 27 AND number = 20682)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (27, 20682);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 27 AND number = 20683)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (27, 20683);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 27 AND number = 20684)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (27, 20684);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 27 AND number = 20685)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (27, 20685);
END

-- process Waste Blowers and Conveyors
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 4;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Waste Blowers and Conveyors')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Waste Blowers and Conveyors');
END

-- entering machines into above process
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 28 AND number = 20753)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (28, 20753);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 28 AND number = 20754)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (28, 20754);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 28 AND number = 20755)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (28, 20755);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 28 AND number = 20756)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (28, 20756);
END

-- ####################################################################################################################################

--    @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                  CREATING BU BUCP             @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;

-- Insert new business unit named 'BUFC'
INSERT INTO business_unit (name) VALUES ('BUCP');

-- process Facial Section
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 5;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Facial Section')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Facial Section');
END

-- entering machines in facial section
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 29 AND number = 32241)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (29, 32241);
END

-- Get the id of Machine no: 32241
DECLARE @machine_id_32241 INT;
SELECT @machine_id_32241 = id FROM machine WHERE process_id = 29 AND number = 32241;

-- Insert sub areas for Machine no: 32241
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32241, 'Heaters 32241'),
(@machine_id_32241, 'Sealing Belt Motor 32241'),
(@machine_id_32241, 'Blower Motor 32241');


-- run from here 10:06am

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 29 AND number = 32242)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (29, 32242);
END

-- Get the id of Machine no: 32242
DECLARE @machine_id_32242 INT;
SELECT @machine_id_32242 = id FROM machine WHERE process_id = 29 AND number = 32242;

-- Insert sub areas for Machine no: 32242
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32242, 'Heaters 32242'),
(@machine_id_32242, 'Sealing Belt Motor 32242'),
(@machine_id_32242, 'Blower Motor 32242');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 29 AND number = 32203)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (29, 32203);
END

-- Get the id of Machine no: 32203
DECLARE @machine_id_32203 INT;
SELECT @machine_id_32203 = id FROM machine WHERE process_id = 29 AND number = 32203;

-- Insert sub areas for Machine no: 32203
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32203, 'Unwinder Unit 32203'),
(@machine_id_32203, 'Lotion Applicator Unit 32203'),
(@machine_id_32203, 'Interfolder Unit 32203'),
(@machine_id_32203, 'Log Saw Feed Conveyor # 1 32203'),
(@machine_id_32203, 'Log Saw Feed Conveyor # 2 32203'),
(@machine_id_32203, 'Log Saw Feed Conveyor # 3 32203'),
(@machine_id_32203, 'Log Saw Unit 32203'),
(@machine_id_32203, 'Transfer Unit 32203'),
(@machine_id_32203, 'Cartooner Unit 32203'),
(@machine_id_32203, 'Soft Pack M/C 32203'),
(@machine_id_32203, 'Transfer Unit Feed Conveyor # 1 32203'),
(@machine_id_32203, 'Transfer Unit Feed Conveyor # 2 32203'),
(@machine_id_32203, 'Soft Pack M/C 32203');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 29 AND number = 32204)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (29, 32204);
END

-- Get the id of Machine no: 32204
DECLARE @machine_id_32204 INT;
SELECT @machine_id_32204 = id FROM machine WHERE process_id = 29 AND number = 32204;

-- Insert sub areas for Machine no: 32204
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32204, 'Unwinder Unit # 1 32204'),
(@machine_id_32204, 'Unwinder Unit # 2 32204'),
(@machine_id_32204, 'Interfolding Unit 32204'),
(@machine_id_32204, 'Unwinder Unit # 1 32204'),
(@machine_id_32204, 'Log Saw Feed Conveyor # 1 32204'),
(@machine_id_32204, 'Log Saw Feed Conveyor # 2 32204'),
(@machine_id_32204, 'Log Saw Feed Conveyor # 3 32204'),
(@machine_id_32204, 'Log Saw Unit 32204'),
(@machine_id_32204, 'Transfer Unit Feed Conveyor # 1 32204'),
(@machine_id_32204, 'Transfer Unit Feed Conveyor # 2 32204'),
(@machine_id_32204, 'Transfer Unit 32204'),
(@machine_id_32204, 'Cartooner Unit 32204');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 29 AND number = 32235)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (29, 32235);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 29 AND number = 32205)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (29, 32205);
END

-- Get the id of Machine no: 32205
DECLARE @machine_id_32205 INT;
SELECT @machine_id_32205 = id FROM machine WHERE process_id = 29 AND number = 32205;

-- Insert sub areas for Machine no: 32205
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32205, 'Unwinder Unit # 1 32205'),
(@machine_id_32205, 'Unwinder Unit # 2 32205'),
(@machine_id_32205, 'Diverter Unit Of 32205'),
(@machine_id_32205, 'Cartoner Unit 32205'),
(@machine_id_32205, 'Vacuum Pump 32205'),
(@machine_id_32205, 'Log Saw Sheet Cutter Unit 32205'),
(@machine_id_32205, 'Conveyors 32205'),
(@machine_id_32205, 'Inter-folder Unit 32205');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 29 AND number = 32235)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (29, 32235);
END

-- Get the id of Machine no: 32235
DECLARE @machine_id_32235 INT;
SELECT @machine_id_32235 = id FROM machine WHERE process_id = 29 AND number = 32235;

-- Insert sub areas for Machine no: 32235
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32235, 'Unwinder Unit 32235'),
(@machine_id_32235, 'Interfolder Unit 32235'),
(@machine_id_32235, 'Blade Unit 32235'),
(@machine_id_32235, 'Transfer Unit 32235'),
(@machine_id_32235, 'Wrapper Unit 32235'),
(@machine_id_32235, 'Bundler Unit 32235');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 29 AND number = 32243)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (29, 32243);
END

-- Get the id of Machine no: 32243
DECLARE @machine_id_32243 INT;
SELECT @machine_id_32243 = id FROM machine WHERE process_id = 29 AND number = 32243;

-- Insert sub areas for Machine no: 32243
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32243, 'Feeding Unit 32243'),
(@machine_id_32243, 'Sealing Unit 32243'),
(@machine_id_32243, 'Heaters 32243'),
(@machine_id_32243, 'Outfeed Conveyor 32243'),
(@machine_id_32243, 'Stickering Unit 32243');

-- process Table Napkin
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 5;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Table Napkin')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Table Napkin');
END

-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;

-- run from here 10:40am

-- entering machines in table napkin
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 30 AND number = 32236)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (30, 32236);
END

-- Get the id of Machine no: 32236
DECLARE @machine_id_32236 INT;
SELECT @machine_id_32236 = id FROM machine WHERE process_id = 30 AND number = 32236;

-- Insert sub areas for Machine no: 32243
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32236, 'Main Motor 32236');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 30 AND number = 32211)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (30, 32211);
END

-- Get the id of Machine no: 32236
DECLARE @machine_id_32211 INT;
SELECT @machine_id_32211 = id FROM machine WHERE process_id = 30 AND number = 32211;

-- Insert sub areas for Machine no: 32211
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32211, 'Interfolder Unit 32211'),
(@machine_id_32211, 'Log Saw Unit 32211'),
(@machine_id_32211, 'Wrapping Unit 32211');

-- 32216

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 30 AND number = 32216)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (30, 32216);
END

-- Get the id of Machine no: 32216
DECLARE @machine_id_32216 INT;
SELECT @machine_id_32216 = id FROM machine WHERE process_id = 30 AND number = 32216;

-- Insert sub areas for Machine no: 32216
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32216, 'Main Motor 32216'),
(@machine_id_32216, 'Blade Rotation 32216');

--32217
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 30 AND number = 32217)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (30, 32217);
END

-- Get the id of Machine no: 32217
DECLARE @machine_id_32217 INT;
SELECT @machine_id_32217 = id FROM machine WHERE process_id = 30 AND number = 32217;

-- Insert sub areas for Machine no: 32216
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32217, 'Main Motor 32216'),
(@machine_id_32217, 'Blade Rotation 32216'),
(@machine_id_32217, 'Wrapper Unit 32216');

-- 32237 

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 30 AND number = 32237)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (30, 32237);
END

-- 32220

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 30 AND number = 32220)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (30, 32220);
END

-- Get the id of Machine no: 32220
DECLARE @machine_id_32220 INT;
SELECT @machine_id_32220 = id FROM machine WHERE process_id = 30 AND number = 32220;

-- Insert sub areas for Machine no: 32220
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32220, 'Unwinder Unit 32220'),
(@machine_id_32220, 'Printing Unit 32220'),
(@machine_id_32220, 'Folding Cylinder Unit 32220'),
(@machine_id_32220, 'Transfer Unit 32220'),
(@machine_id_32220, 'Embosser Unit 32220'),
(@machine_id_32220, 'Wrapping Unit 32220'),
(@machine_id_32220, 'Conveyor System 32220'),
(@machine_id_32220, 'Blade Unit 32220'),
(@machine_id_32220, 'Main Drive Gear Box 32220');

-- 32272

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 30 AND number = 32272)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (30, 32272);
END

-- Get the id of Machine no: 32272
DECLARE @machine_id_32272 INT;
SELECT @machine_id_32272 = id FROM machine WHERE process_id = 30 AND number = 32272;

-- Insert sub areas for Machine no: 32272
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32272, 'Unwinding Unit 32272'),
(@machine_id_32272, 'Printing Unit 32272'),
(@machine_id_32272, 'Folding Unit 32272'),
(@machine_id_32272, 'Embosser Unit 32272'),
(@machine_id_32272, 'Transfer Unit 32272'),
(@machine_id_32272, 'Wrapper Unit 32272'),
(@machine_id_32272, 'Conveyors System 32272'),
(@machine_id_32272, 'Blade Unit 32272');

-- 32212

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 30 AND number = 32212)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (30, 32212);
END

-- Get the id of Machine no: 32212
DECLARE @machine_id_32212 INT;
SELECT @machine_id_32212 = id FROM machine WHERE process_id = 30 AND number = 32212;

-- Insert sub areas for Machine no: 32212
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32212, 'Unwinder Unit 32212'),
(@machine_id_32212, 'Glue Unit 32212'),
(@machine_id_32212, 'Embosser Unit 32212'),
(@machine_id_32212, 'Interfolding Unit 32212'),
(@machine_id_32212, 'Band Wrapper Unit 32212'),
(@machine_id_32212, 'Log Saw Unit 32212'),
(@machine_id_32212, 'Wrapping Unit 32212');


-- process non tissue

DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 5;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Non Tissue')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Non Tissue');
END

-- run from here 11:24am
-- entering machines in non tissue
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32249)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32249);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32250)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32250);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32268)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32268);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32264)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32264);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32251)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32251);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32252)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32252);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32253)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32253);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32254)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32254);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32255)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32255);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32256)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32256);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32257)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32257);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32258)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32258);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32259)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32259);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32260)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32260);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32269)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32269);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32265)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32265);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 31 AND number = 32238)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (31, 32238);
END


-- View the business_unit table
SELECT * FROM business_unit;

-- View the process table
SELECT * FROM process;

-- View the machine table
SELECT * FROM machine;

-- View the sub_area table
SELECT * FROM sub_area;

-- process party pack
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 5;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Party Pack')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Party Pack');
END

-- run from here:

-- entering machines party pack

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 32 AND number = 32232)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (32, 32232);
END

-- Get the id of Machine no: 32232
DECLARE @machine_id_32232 INT;
SELECT @machine_id_32232 = id FROM machine WHERE process_id = 32 AND number = 32232;

-- Insert sub areas for Machine no: 32232
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32232, 'Sealing Belt Motor 32232'),
(@machine_id_32232, 'Sealing Heater 32232');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 32 AND number = 32231)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (32, 32231);
END

-- Get the id of Machine no: 32231
DECLARE @machine_id_32231 INT;
SELECT @machine_id_32231 = id FROM machine WHERE process_id = 32 AND number = 32231;

-- Insert sub areas for Machine no: 32231
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32231, 'Log Saw Unit 32231'),
(@machine_id_32231, 'Rewinding Unit 32231'),
(@machine_id_32231, 'Unwinder Unit # 1 32231'),
(@machine_id_32231, 'Unwinder Unit # 2 32231'),
(@machine_id_32231, 'Embosser Unit 32231'),
(@machine_id_32231, 'Wrapper Unit 32231'),
(@machine_id_32231, 'Plateform Unit 32231');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 32 AND number = 32239)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (32, 32239);
END

-- Get the id of Machine no: 32239
DECLARE @machine_id_32239 INT;
SELECT @machine_id_32239 = id FROM machine WHERE process_id = 32 AND number = 32239;

-- Insert sub areas for Machine no: 32239
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32239, 'Unwinder Unit # 1 32239'),
(@machine_id_32239, 'Unwinder Unit # 2 32239'),
(@machine_id_32239, 'Embosser Unit 32239'),
(@machine_id_32239, 'Rewinding Unit 32239'),
(@machine_id_32239, 'Plateform Unit 32239'),
(@machine_id_32239, 'Linear Cutter Plateform Unit 32239'),
(@machine_id_32239, 'Conveyors 32239'),
(@machine_id_32239, 'Log Saw Unit 32239'),
(@machine_id_32239, 'Wrapping Unit 32239');

-- process toilet roll
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 5;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Toilet Roll')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Toilet Roll');
END

-- entering machines in toilet roll
IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32214)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32214);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32207)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32207);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32209)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32209);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 43758)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 43758);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32261)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32261);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32262)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32262);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32263)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32263);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32210)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32210);
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32261)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32261);
END


IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32266)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32266);
END

-- Get the id of Machine no: 32266
DECLARE @machine_id_32266 INT;
SELECT @machine_id_32266 = id FROM machine WHERE process_id = 33 AND number = 32266;

-- Insert sub areas for Machine no: 32266
INSERT INTO sub_area (machine_id, name) VALUES 
(@machine_id_32266, 'Unwinder Unit # 1 32266'),
(@machine_id_32266, 'Unwinder Unit # 2 32266'),
(@machine_id_32266, 'Rewinder Unit 32266'),
(@machine_id_32266, 'Tail Seal Unit 32266'),
(@machine_id_32266, 'Diverter Unit 32266'),
(@machine_id_32266, 'Conveyors 32266'),
(@machine_id_32266, 'Embosser Unit 32266');

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 33 AND number = 32267)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (33, 32267);
END

-- process Femcare
DECLARE @business_unit_id INT; 
SELECT @business_unit_id = id FROM business_unit WHERE id = 5;

IF NOT EXISTS (SELECT 1 FROM process WHERE business_unit_id = @business_unit_id AND name = 'Femcare')
BEGIN
    INSERT INTO process (business_unit_id, name) VALUES (@business_unit_id, 'Femcare');
END

IF NOT EXISTS (SELECT 1 FROM machine WHERE process_id = 34 AND number = 32701)
BEGIN
    INSERT INTO machine (process_id, number) VALUES (34, 32701);
END
