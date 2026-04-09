CREATE TABLE clinics (
    cid VARCHAR(50),
    clinic_name VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50)
);

CREATE TABLE customer (
    uid VARCHAR(50),
    name VARCHAR(100),
    mobile VARCHAR(20)
);

CREATE TABLE clinic_sales (
    oid VARCHAR(50),
    uid VARCHAR(50),
    cid VARCHAR(50),
    amount FLOAT,
    datetime DATETIME,
    sales_channel VARCHAR(50)
);

CREATE TABLE expenses (
    eid VARCHAR(50),
    cid VARCHAR(50),
    description VARCHAR(100),
    amount FLOAT,
    datetime DATETIME
);

INSERT INTO clinics VALUES
('C1', 'City Clinic', 'Delhi', 'Delhi', 'India'),
('C2', 'Health Plus', 'Mumbai', 'Maharashtra', 'India'),
('C3', 'Care Hospital', 'Hyderabad', 'Telangana', 'India');

INSERT INTO customer VALUES
('CU1', 'Rahul', '9991112222'),
('CU2', 'Sneha', '8882223333'),
('CU3', 'Arjun', '7773334444');

INSERT INTO clinic_sales VALUES
('O1', 'CU1', 'C1', 5000, '2021-11-10 10:00:00', 'Online'),
('O2', 'CU2', 'C1', 7000, '2021-11-15 12:00:00', 'Offline'),
('O3', 'CU3', 'C2', 3000, '2021-10-05 09:00:00', 'Online'),
('O4', 'CU1', 'C3', 9000, '2021-10-20 18:00:00', 'Offline');

INSERT INTO expenses VALUES
('E1', 'C1', 'Medicines', 2000, '2021-11-10 11:00:00'),
('E2', 'C1', 'Staff Salary', 3000, '2021-11-15 13:00:00'),
('E3', 'C2', 'Equipment', 1500, '2021-10-05 10:00:00'),
('E4', 'C3', 'Maintenance', 4000, '2021-10-20 19:00:00');