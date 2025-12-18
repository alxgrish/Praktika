-- DDL for erwin Data Modeler import
-- Target DBMS: PostgreSQL (adjust for SQL Server if needed)

CREATE TABLE Groups (
    group_id SERIAL PRIMARY KEY,
    group_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL
);

CREATE TABLE Parents (
    parent_id SERIAL PRIMARY KEY,
    full_name VARCHAR(150) NOT NULL
);

CREATE TABLE ParentMeetings (
    meeting_id SERIAL PRIMARY KEY,
    protocol_number VARCHAR(50) NOT NULL,
    group_id INT NOT NULL,
    meeting_date DATE NOT NULL,
    attendees_count INT CHECK (attendees_count >= 0),
    chairman_name VARCHAR(100) NOT NULL,
    secretary_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE AgendaItems (
    agenda_id SERIAL PRIMARY KEY,
    meeting_id INT NOT NULL,
    item_text TEXT NOT NULL,
    item_order INT NOT NULL DEFAULT 1
);

CREATE TABLE Speeches (
    speech_id SERIAL PRIMARY KEY,
    meeting_id INT NOT NULL,
    speaker_name VARCHAR(100) NOT NULL,
    speech_text TEXT NOT NULL,
    speech_order INT NOT NULL DEFAULT 1
);

CREATE TABLE Decisions (
    decision_id SERIAL PRIMARY KEY,
    meeting_id INT NOT NULL,
    decision_text TEXT NOT NULL,
    votes_for INT CHECK (votes_for >= 0),
    votes_against INT CHECK (votes_against >= 0),
    abstained INT CHECK (abstained >= 0),
    decision_order INT NOT NULL DEFAULT 1
);

CREATE TABLE PreventiveTalks (
    talk_id SERIAL PRIMARY KEY,
    talk_date DATE NOT NULL,
    student_id INT NOT NULL,
    group_id INT NOT NULL,
    parent_id INT,
    reason TEXT NOT NULL,
    student_explanation TEXT,
    decision TEXT NOT NULL,
    parent_consent BOOLEAN NOT NULL DEFAULT FALSE,
    student_consent BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Foreign Key Constraints (обязательны для корректного импорта связей в erwin)
ALTER TABLE ParentMeetings ADD CONSTRAINT fk_meeting_group
    FOREIGN KEY (group_id) REFERENCES Groups(group_id) ON DELETE CASCADE;

ALTER TABLE AgendaItems ADD CONSTRAINT fk_agenda_meeting
    FOREIGN KEY (meeting_id) REFERENCES ParentMeetings(meeting_id) ON DELETE CASCADE;

ALTER TABLE Speeches ADD CONSTRAINT fk_speech_meeting
    FOREIGN KEY (meeting_id) REFERENCES ParentMeetings(meeting_id) ON DELETE CASCADE;

ALTER TABLE Decisions ADD CONSTRAINT fk_decision_meeting
    FOREIGN KEY (meeting_id) REFERENCES ParentMeetings(meeting_id) ON DELETE CASCADE;

ALTER TABLE PreventiveTalks ADD CONSTRAINT fk_talk_student
    FOREIGN KEY (student_id) REFERENCES Students(student_id) ON DELETE CASCADE;

ALTER TABLE PreventiveTalks ADD CONSTRAINT fk_talk_group
    FOREIGN KEY (group_id) REFERENCES Groups(group_id) ON DELETE CASCADE;

ALTER TABLE PreventiveTalks ADD CONSTRAINT fk_talk_parent
    FOREIGN KEY (parent_id) REFERENCES Parents(parent_id) ON DELETE SET NULL;