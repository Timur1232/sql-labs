\i drop_all.sql

CREATE TABLE departments (
    sifer INTEGER NOT NULL,
    department_name VARCHAR(30) NOT NULL,
    PRIMARY KEY (sifer)
);

CREATE TABLE positions (
    name VARCHAR(30) NOT NULL,
    salary INTEGER NOT NULL,
    CHECK (salary > 0),
    PRIMARY KEY (name)
);

CREATE TABLE employees (
    personnel_number INTEGER NOT NULL,
    full_name VARCHAR(30) NOT NULL,
    IIN CHAR(12) NOT NULL,
    gender CHAR(1) NOT NULL DEFAULT 'ж',
    birthday_date DATE NOT NULL,
    department INTEGER,
    position VARCHAR(30),
    date_of_receipt DATE,
    previous_experience INTEGER NOT NULL,
    CHECK (gender IN ('м', 'ж')),
    PRIMARY KEY (personnel_number),
    FOREIGN KEY (department) REFERENCES departments (sifer)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (position) REFERENCES positions (name)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE working_book (
    employee INTEGER NOT NULL,
    department INTEGER NOT NULL,
    position VARCHAR(30) NOT NULL,
    date_of_receipt DATE NOT NULL,
    FOREIGN KEY (employee) REFERENCES employees (personnel_number)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (department) REFERENCES departments (sifer)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (position) REFERENCES positions (name)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE bonuses (
    full_name VARCHAR(30) NOT NULL,
    experience INTEGER NOT NULL,
    bonus_size INTEGER NOT NULL,
    accrual_date DATE
);

\i generators.sql
\i functions.sql
\i triggers.sql

\i data.sql
