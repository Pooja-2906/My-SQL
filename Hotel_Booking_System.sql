-- Create Database
CREATE DATABASE hotel_booking;
USE hotel_booking;

-- Guests Table
CREATE TABLE Guests (
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

-- Rooms Table
CREATE TABLE Rooms (
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) UNIQUE NOT NULL,
    room_type VARCHAR(50),
    price_per_night DECIMAL(10, 2)
);

-- Bookings Table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT,
    room_id INT,
    check_in DATE,
    check_out DATE,
    FOREIGN KEY (guest_id) REFERENCES Guests(guest_id),
    FOREIGN KEY (room_id) REFERENCES Rooms(room_id)
);
-- Insert into Guests
INSERT INTO Guests (full_name, email, phone)
VALUES 
('Alice Johnson', 'alice@example.com', '1234567890'),
('Michael Lee', 'michael@example.com', '9876543210'),
('Priya Desai', 'priya@example.com', '7863901624'),
('Carlos Mendez', 'carlos@example.com', '9576573210'),
('Emily Clark', 'emily@example.com', '9988776655'),
('Ravi Kumar', 'ravi@example.com', '9090909090'),
('Sophia Turner', 'sophia@example.com', '8001234567'),
('Daniel Kim', 'daniel@example.com', '8899776655'),
('Fatima Noor', 'fatima@example.com', '7778889999'),
('Liam Brien', 'liam@example.com', '9012345678');
describe Guests;

-- Insert into Rooms
INSERT INTO Rooms (room_number, room_type, price_per_night)
VALUES 
('101', 'Single', 50.00),
('102', 'Double', 80.00),
('103', 'Suite', 120.00),
('104',	'Deluxe', 100.00),
('105',	'Single', 55.00),
('106', 'Double', 85.00),
('107', 'Suite', 130.00),
('108', 'Deluxe', 105.00),
('109', 'Single', 60.00),
('110', 'Double', 90.00);


-- Insert into Bookings
INSERT INTO Bookings (guest_id, room_id, check_in, check_out)
VALUES 
(1, 1, '2025-04-01', '2025-04-04'),
(2, 2, '2025-04-02', '2025-04-05'),
(3, 3, '2025-04-03', '2025-04-06'),
(4, 4, '2025-04-04', '2025-04-08'),
(5, 5, '2025-04-05', '2025-04-07'),
(6, 6, '2025-04-06', '2025-04-09'),
(7, 7, '2025-04-07', '2025-04-10'),
(8, 8, '2025-04-08', '2025-04-12'),
(9, 9, '2025-04-09', '2025-04-11'),
(10, 10, '2025-04-10', '2025-04-13');
select * from Guests;
select * from Rooms;
select * from Bookings;
-- Delete guests no. 5 as they cancelled their booking.
DELETE FROM Bookings
WHERE booking_id = 5;
select * from Bookings;

DELETE FROM Guests
WHERE guest_id = 5;
select * from Guests;

DELETE FROM Rooms
WHERE room_id = 5;
select * from Rooms;

-- INNER JOIN: View All Bookings with Guest & Room Info

SELECT 
    b.booking_id,
    g.full_name AS guest_name,
    g.email,
    r.room_number,
    r.room_type,
    r.price_per_night,
    b.check_in,
    b.check_out
FROM Bookings b
JOIN Guests g ON b.guest_id = g.guest_id
JOIN Rooms r ON b.room_id = r.room_id;

