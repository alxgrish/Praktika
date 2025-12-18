
CREATE TABLE ParentMeeting
(
	MeetingID            INTEGER NOT NULL,
	GroupID              INTEGER NOT NULL,
	MeetingDate          datetime NOT NULL,
	ProtocolNumber       varchar(30) NOT NULL,
	Agenda               LONG VARCHAR NOT NULL,
	DecisionText         LONG VARCHAR NOT NULL
);



ALTER TABLE ParentMeeting
ADD PRIMARY KEY (MeetingID);



CREATE TABLE PreventionTalk
(
	TalkID               INTEGER NOT NULL,
	Student_ID           INTEGER NOT NULL,
	TalkDate             datetime NOT NULL,
	Reason               LONG VARCHAR NOT NULL,
	DecisionText         LONG VARCHAR NOT NULL,
	ParentAgreement      bit NOT NULL,
	StudentAgreement     bit NOT NULL
);



ALTER TABLE PreventionTalk
ADD PRIMARY KEY (TalkID);



CREATE TABLE Student
(
	Student_ID           INTEGER NOT NULL,
	LastName             varchar(50) NOT NULL,
	FirstName            varchar(50) NOT NULL,
	MiddleName           varchar(50) NULL,
	GroupID              INTEGER NOT NULL
);



ALTER TABLE Student
ADD PRIMARY KEY (Student_ID);



CREATE TABLE StudyGroup
(
	GroupID              INTEGER NOT NULL,
	GroupName            varchar(50) NOT NULL,
	Specialty            varchar(100) NOT NULL
);



ALTER TABLE StudyGroup
ADD PRIMARY KEY (GroupID);



ALTER TABLE ParentMeeting
ADD FOREIGN KEY FK_ParentMeeting_Group (GroupID) REFERENCES StudyGroup (GroupID);



ALTER TABLE PreventionTalk
ADD FOREIGN KEY FK_PreventionTalk_Student (Student_ID) REFERENCES Student (Student_ID);



ALTER TABLE Student
ADD FOREIGN KEY FK_Student_Group (GroupID) REFERENCES StudyGroup (GroupID);


