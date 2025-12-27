-- DATABASE DESIGN 

-- Enable FK enforcement in SQLite
PRAGMA foreign_keys = ON;

CREATE TABLE profiles (
    id INTEGER PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name  TEXT NOT NULL,
    headline   TEXT,
    about      TEXT
);


CREATE TABLE profile_creds (
    profile_id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);


CREATE TABLE skills (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);


CREATE TABLE profile_skills (
    profile_id INTEGER NOT NULL,
    skill_id   INTEGER NOT NULL,
    level TEXT,
    years INTEGER,
    PRIMARY KEY (profile_id, skill_id),
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skills(id) ON DELETE CASCADE
);


CREATE TABLE experience (
    id INTEGER PRIMARY KEY,
    profile_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    company_name TEXT NOT NULL,
    start_date TEXT,
    end_date TEXT,
    description TEXT,
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);


CREATE TABLE education (
    id INTEGER PRIMARY KEY,
    profile_id INTEGER NOT NULL,
    school TEXT NOT NULL,
    degree TEXT,
    field TEXT,
    start_date TEXT,
    end_date TEXT,
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);


CREATE TABLE certifications (
    id INTEGER PRIMARY KEY,
    profile_id INTEGER NOT NULL,
    name TEXT NOT NULL,
    issuer TEXT,
    issued_date TEXT,
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);


CREATE TABLE connections (
    requester_id INTEGER NOT NULL,
    addressee_id INTEGER NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('pending','accepted','declined','blocked')),
    requested_at TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    responded_at TEXT,
    PRIMARY KEY (requester_id, addressee_id),
    CHECK (requester_id <> addressee_id),
    FOREIGN KEY (requester_id) REFERENCES profiles(id) ON DELETE CASCADE,
    FOREIGN KEY (addressee_id) REFERENCES profiles(id) ON DELETE CASCADE
);


CREATE TABLE conversations (
    id INTEGER PRIMARY KEY,
    created_at TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP)
);


CREATE TABLE conversation_members (
    conversation_id INTEGER NOT NULL,
    profile_id INTEGER NOT NULL,
    PRIMARY KEY (conversation_id, profile_id),
    FOREIGN KEY (conversation_id) REFERENCES conversations(id) ON DELETE CASCADE,
    FOREIGN KEY (profile_id) REFERENCES profiles(id) ON DELETE CASCADE
);


CREATE TABLE messages (
    id INTEGER PRIMARY KEY,
    conversation_id INTEGER NOT NULL,
    sender_id INTEGER NOT NULL,
    sent_at TEXT NOT NULL DEFAULT (CURRENT_TIMESTAMP),
    content TEXT NOT NULL,
    FOREIGN KEY (conversation_id) REFERENCES conversations(id) ON DELETE CASCADE,
    FOREIGN KEY (sender_id) REFERENCES profiles(id) ON DELETE CASCADE
);


CREATE INDEX idx_experience_profile ON experience(profile_id);
CREATE INDEX idx_education_profile  ON education(profile_id);
CREATE INDEX idx_messages_convo_sentat ON messages(conversation_id, sent_at);
CREATE INDEX idx_connections_addressee_status ON connections(addressee_id, status);


-- QUERIES

-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- A SPECIFIC SEARCHED BASES ON THE USERS FIRST AND LAST NADE

SELECT * FROM "profiles"
WHERE first_name = 'Zander' AND last_name = 'Wepener'
ORDER BY ID DESC;

-- HOW TO GET THE USERS EXPERIENCE

SELECT title, company_name, start_date, end_date, description
FROM experience
WHERE profile_id = :me
ORDER BY COALESCE(end_date, '9999-12-31') DESC, start_date DESC;

-- HOW WE WIL BE GETTING THE USERS SKILLS

SELECT s.name, ps.level, ps.years
FROM profile_skills ps
JOIN skills s ON s.id = ps.skill_id
WHERE ps.profile_id = :me
ORDER BY s.name;


-- PEOPLE WHO HAVE THE MOST CONNECTIONS

SELECT p.id, p.first_name, p.last_name,
       (
         SELECT COUNT(*) FROM connections c
         WHERE c.status = 'accepted'
           AND (c.requester_id = p.id OR c.addressee_id = p.id)
       ) AS connection_count
FROM profiles p
ORDER BY connection_count DESC, p.last_name
LIMIT 10;
