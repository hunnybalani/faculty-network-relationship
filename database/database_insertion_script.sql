DROP DATABASE IF EXISTS researchanalytics;
CREATE DATABASE researchanalytics;
USE researchanalytics;

SHOW TABLES;
DROP TABLE IF EXISTS faculty_research_network;
DROP TABLE IF EXISTS faculty_group_network;
DROP TABLE IF EXISTS faculties;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS research_groups;
DROP TABLE IF EXISTS research_keywords;

CREATE TABLE departments(
	department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(255)
);

CREATE TABLE research_groups(
	research_group_id INT PRIMARY KEY AUTO_INCREMENT,
    research_group VARCHAR(255)
);

CREATE TABLE research_keywords(
	research_keyword_id INT PRIMARY KEY AUTO_INCREMENT,
    reasearch_keyword VARCHAR(255)
);

CREATE TABLE faculties(
	faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    faculty_name VARCHAR(255) NOT NULL,
    department_id INT,
    faculty_type ENUM('teaching', 'research') NOT NULL,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

CREATE TABLE faculty_group_network(
	faculty_id INT,
    research_group_id INT,
    PRIMARY KEY(faculty_id, research_group_id),
	FOREIGN KEY (faculty_id) REFERENCES faculties(faculty_id),
	FOREIGN KEY (research_group_id) REFERENCES research_groups(research_group_id)
);

CREATE TABLE faculty_research_network(
	faculty_id INT,
    research_keyword_id INT,
    PRIMARY KEY(faculty_id, research_keyword_id),
	FOREIGN KEY (faculty_id) REFERENCES faculties(faculty_id),
	FOREIGN KEY (research_keyword_id) REFERENCES research_keywords(research_keyword_id)
);

INSERT INTO departments (department_name) VALUES ('Communication'), ('Journalism and Media Studies'), ('Library and Information Science'), ('Professional Development Studies');

INSERT INTO research_groups (research_group) VALUES ('Active Surveillance Of Policy Ecosystems And Networks'), ('Behavioral Informatics Lab'), ('Center for Communication and Health Issues'), ('Center for International Scholarship in School Libraries'), ('Community Design for Health and Wellness'), ('Community Health Action Lab'), ('Computational Social Science Lab'), ('Digital Ethnography Working Group'), ('Family Communication & Relationship Lab'), ('HCI Lab for Health and Sustainability'), ('Health and Wellness Cluster'), ('Health Humanities Communications And Informatics'), ('IAPP-Greece: Advancing Health Communication Across the Health Professions'), ('Laboratory for the Study of Applied Language Technology and Society'), ('Media Inequality and Change Center'), ('NetSCI Lab'), ('Power and Inequality in Media and Technology Working Group'), ('Rutgers Center for Organizational Leadership'), ('Rutgers University Conversation Analysis Lab'), ('SC&I Youth Cluster'), ('Social Media & Society Cluster');

INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Mark Aakhus', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Warren Allen', '3', 'teaching');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Tawfiq Ammari', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Melissa Aronczyk', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Marc Aronson', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Le Anne Barclay-Platenburg', '3', 'teaching');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Louise Barkhuus', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Mark Beal', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Neal Bennett', '2', 'teaching');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Galina Bolden', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Brenda Boyer', '3', 'teaching');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Jack Z. Bratich', '2', 'research');
INSERT INTO faculties (faculty_name, faculty_type) VALUES ('Mary Chayko', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Jessica Yi-Yun Cheng', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Erin Christie', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Kaitlin L. Costello', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Mary D’Ambrosio', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Marija Dalbello', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Marya Doerfel', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Richard Dool', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Lauren Feldman', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Suchinthi Fernando', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('J. Sophia Fu', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Venkata Rama Kiran Garimella', '3', 'research');
INSERT INTO faculties (faculty_name, faculty_type) VALUES ('Roxane Gay', 'teaching');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Ralph A. Gigliotti', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('David Greenberg', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Kathryn Greene', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Alexa Hepburn', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Brian Householder', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Shawnika Hull', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Shagun Jhaver', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Amy Jordan', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Susan Keith', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Goun-ho Kim', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Sunyoung Kim', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Youngrim Kim', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Nancy Kranich', '3', 'teaching');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Deepa Kumar', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Jeffrey Lane', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('E.E. Lawrence', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Dafna Lemish', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Nick Linardopoulos', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('David Love', '2', 'teaching');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Jenny Mandelbaum', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Regina Marchi', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Matthew Matsaganis', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Lisa Mikesell', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Steven Miller', '2', 'teaching');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Katherine Ognyanova', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Britt S. Paris', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('John V. Pavlik', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Lilia Pavlovsky', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Caitlin Petre', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Jonathan Potter', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Marie L. Radford', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Rebecca Reynolds', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Yonaira Rivera', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Brent Ruben', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Kristina Scharp', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Jorge Reina Schement', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Charles Senteio', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Sarah Shugars', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Vivek K. Singh', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Anselm Spoerri', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Lea P. Stewart', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Jennifer Theiss', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Kaushal Trivedi', '3', 'teaching');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Joyce Valenza', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Maria Venetis', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Nina Wacholder', '3', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Matthew Weber', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Khadijah Costley White', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Todd Wolfson', '2', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('DaJung Woo', '1', 'research');
INSERT INTO faculties (faculty_name, department_id, faculty_type) VALUES ('Itzhak Yanovitzky', '1', 'research');

INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('1', '5'), ('1', '8'), ('1', '14'), ('1', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('3', '2'), ('3', '7'), ('3', '12');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('4', '8');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('5', '4'), ('5', '20');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('7', '10'), ('7', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('10', '11'), ('10', '19');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('12', '20'), ('12', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('13', '2'), ('13', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('16', '2'), ('16', '5'), ('16', '11'), ('16', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('19', '16'), ('19', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('21', '2'), ('21', '11');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('22', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('23', '7'), ('23', '11'), ('23', '16'), ('23', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('24', '7'), ('24', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('26', '18');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('27', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('28', '3'), ('28', '11'), ('28', '20');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('29', '11'), ('29', '19'), ('29', '20'), ('29', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('31', '6'), ('31', '11'), ('31', '12');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('32', '7'), ('32', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('33', '20');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('34', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('36', '2'), ('36', '5'), ('36', '10'), ('36', '11'), ('36', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('37', '8');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('40', '8'), ('40', '15'), ('40', '20'), ('40', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('41', '17');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('42', '11'), ('42', '17'), ('42', '20');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('45', '19');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('46', '17'), ('46', '20'), ('46', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('47', '11'), ('47', '13');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('48', '6'), ('48', '11'), ('48', '19');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('50', '7'), ('50', '12'), ('50', '16'), ('50', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('51', '17');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('52', '17'), ('52', '20'), ('52', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('54', '8'), ('54', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('55', '19');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('56', '8'), ('56', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('57', '4'), ('57', '17'), ('57', '20'), ('57', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('58', '8'), ('58', '11'), ('58', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('59', '18'), ('59', '11');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('60', '3'), ('60', '9'), ('60', '11');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('61', '17');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('62', '2'), ('62', '3'), ('62', '5'), ('62', '6'), ('62', '11'), ('62', '12');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('63', '7'), ('63', '16'), ('63', '17'), ('63', '19'), ('63', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('64', '2'), ('64', '7'), ('64', '10'), ('64', '12'), ('64', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('66', '3'), ('66', '11');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('67', '9'), ('67', '11');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('69', '4'), ('69', '20'), ('69', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('70', '3'), ('70', '6'), ('70', '11'), ('70', '12');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('71', '14');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('72', '1'), ('72', '7'), ('72', '16'), ('72', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('73', '12'), ('73', '17'), ('73', '21');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('74', '21'), ('74', '20'), ('74', '15');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('75', '16');
INSERT INTO faculty_group_network (faculty_id, research_group_id) VALUES ('76', '1'), ('76', '3'), ('76', '11');


SELECT * FROM faculties f 
JOIN research_groups r 
JOIN faculty_group_network n 
WHERE f.faculty_id = n.faculty_id 
AND r.research_group_id = n.research_group_id ;


SELECT * FROM faculty_research_network;
SELECT * FROM  faculty_group_network;
SELECT * FROM  faculties;
SELECT * FROM  departments;
SELECT * FROM  research_groups;
SELECT * FROM  research_keywords;
