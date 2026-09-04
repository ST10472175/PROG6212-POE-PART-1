create database RaceDay;
use RaceDay;

create table EVENTS(event_ID varchar(10) primary key,
                    event_Name varchar(50),
                    event_Date varchar(25),
                    event_location varchar(35),
                    event_type varchar(25));

create table EVENT_ORGANISERS(organiser_ID varchar(15) primary key,
                             organiser_name varchar(50) NOT NULL,
                             organiser_contactDetails char(10));

create table PARTICIPANTS(participant_ID varchar(15) primary key,
                          participant_name varchar(50) NOT NULL,
                          participant_contactDetails varchar(10) UNIQUE);

create table CATEGORIES(category_ID varchar(20) primary key,
                      category_name varchar(40) NOT NULL,
                      event_id varchar(10),
                      FOREIGN KEY(event_id) REFERENCES EVENTS(event_ID));

create table RESULTS(results_id varchar(20) primary key,
                     finish_time int,
                     positionNumber int,
                     participant_id varchar(15),event_id varchar(10),
                     FOREIGN KEY(participant_id) REFERENCES PARTICIPANTS(participant_ID),
                     FOREIGN KEY(event_id) REFERENCES EVENTS(event_id));

create table ASSIGNMENT(entry_id int primary key,
                        event_id varchar(10),participant_id varchar(15),
                        FOREIGN KEY(participant_id) REFERENCES PARTICIPANTS(participant_ID),
                        FOREIGN KEY(event_id) REFERENCES EVENTS(event_id));

INSERT INTO EVENT_ORGANISERS(organiser_ID,organiser_name,organiser_contactDetails)
VALUES('O001','Kgothatso Masubelele','0824697891'),
      ('O002','Gift Ramavhinyana','0719656868');

INSERT INTO PARTICIPANTS(participant_ID,participant_name,participant_contactDetails)
VALUES('P001','KK Mulaudzi','0723456789'),
      ('P002','Naledi Matlala','0837894651');

INSERT INTO EVENTS(event_ID,event_Name,event_Date,event_type,event_location)
VALUES('E001','Soweto Marathon','2026/10/10','Road Running','Soweto'),
      ('E002','Cape Town Cycle Tour','2027/01/07','Cycling','Cape Town'),
      ('E003','Two Oceans Fun Walk','2026/12/04','Walking','Pietermaritzburg');

SELECT * FROM EVENTS;












use master 
drop database RaceDay
