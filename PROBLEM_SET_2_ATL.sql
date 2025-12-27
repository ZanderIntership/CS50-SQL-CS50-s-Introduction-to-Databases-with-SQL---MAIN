CREATE TABLE passengers (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT
);

CREATE TABLE airlines (
    id INTEGER PRIMARY KEY,
    name TEXT,
    section TEXT
);

CREATE TABLE flights (
    id INTEGER PRIMARY KEY,
    flight_number INTEGER,
    airline_id INTEGER,
    departure_code TEXT,
    arrival_code TEXT,
    etd DATETIME,
    eta DATETIME,
    FOREIGN KEY (airline_id) REFERENCES airlines(id)
);

CREATE TABLE check_ins (
    id INTEGER PRIMARY KEY,
    passenger_id INTEGER,
    flight_id INTEGER,
    check_in_time DATETIME,
    FOREIGN KEY (passenger_id) REFERENCES passengers(id),
    FOREIGN KEY (flight_id) REFERENCES flights(id)
);
