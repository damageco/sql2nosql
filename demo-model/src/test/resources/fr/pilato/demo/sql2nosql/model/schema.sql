-- Licensed to Tugdual Grall and David Pilato (the "Author") under one or more contributor
-- license agreements. See the NOTICE file distributed with this work for additional
-- information regarding copyright ownership. Author licenses this file to you
-- under the Apache License, Version 2.0 (the "License"); you may not use this
-- file except in compliance with the License. You may obtain a copy of the
-- License at http://www.apache.org/licenses/LICENSE-2.0 Unless required by
-- applicable law or agreed to in writing, software distributed under the License
-- is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied. See the License for the specific language
-- governing permissions and limitations under the License.

DROP TABLE META IF EXISTS;
DROP TABLE PERSON IF EXISTS;
DROP TABLE ADDRESS IF EXISTS;

CREATE TABLE PERSON (
    ID INTEGER generated by default as identity (start with 1) not null,
    name varchar(100) not null,
	CREATED timestamp,
	CONSTRAINT IDX_PERSON_ID PRIMARY KEY (ID)
);

CREATE TABLE ADDRESS (
    ID INTEGER generated by default as identity (start with 1) not null,
    PERSON_ID integer,  
    ADDRESS varchar(255),
    CITY varchar(50) not null,
    STATE varchar(50) not null,
    zipPostal varchar(30) not null,
	CREATED timestamp,
    CONSTRAINT IDX_ADDRESS_ID PRIMARY KEY (ID),
    CONSTRAINT FK_ADDRESS_PERSON_ID FOREIGN KEY (PERSON_ID) REFERENCES PERSON(ID) on delete cascade
);

