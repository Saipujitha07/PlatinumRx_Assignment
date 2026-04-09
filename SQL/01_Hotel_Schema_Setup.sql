CREATE TABLE users (
    user_id VARCHAR(50),
    name VARCHAR(100),
    phone_number VARCHAR(20),
    mail_id VARCHAR(100),
    billing_address VARCHAR(255)
);

CREATE TABLE bookings (
    booking_id VARCHAR(50),
    booking_date DATETIME,
    room_no VARCHAR(50),
    user_id VARCHAR(50)
);

CREATE TABLE booking_commercials (
    id VARCHAR(50),
    booking_id VARCHAR(50),
    bill_id VARCHAR(50),
    bill_date DATETIME,
    item_id VARCHAR(50),
    item_quantity FLOAT
);

CREATE TABLE items (
    item_id VARCHAR(50),
    item_name VARCHAR(100),
    item_rate FLOAT
);

INSERT INTO users VALUES
('U1', 'John Doe', '9876543210', 'john@example.com', 'Delhi'),
('U2', 'Alice Smith', '9123456780', 'alice@example.com', 'Mumbai'),
('U3', 'Bob Lee', '9988776655', 'bob@example.com', 'Hyderabad');

INSERT INTO bookings VALUES
('B1', '2021-11-10 10:00:00', 'R101', 'U1'),
('B2', '2021-11-15 12:00:00', 'R102', 'U1'),
('B3', '2021-10-05 09:00:00', 'R201', 'U2'),
('B4', '2021-10-20 18:00:00', 'R202', 'U3');

INSERT INTO items VALUES
('I1', 'Tawa Paratha', 20),
('I2', 'Paneer Butter Masala', 150),
('I3', 'Tea', 10);

INSERT INTO booking_commercials VALUES
('C1', 'B1', 'BL1', '2021-11-10', 'I1', 5),
('C2', 'B1', 'BL1', '2021-11-10', 'I2', 2),
('C3', 'B2', 'BL2', '2021-11-15', 'I3', 10),
('C4', 'B3', 'BL3', '2021-10-05', 'I2', 8),
('C5', 'B3', 'BL3', '2021-10-05', 'I1', 10),
('C6', 'B4', 'BL4', '2021-10-20', 'I3', 50);