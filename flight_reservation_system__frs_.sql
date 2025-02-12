--Flight Reservation System (FRS)

--Table creation

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    gender ENUM('Male', 'Female', 'Other'),
    phone VARCHAR(15),
    email VARCHAR(100),
    dob DATE,
    address VARCHAR(255),
    passport_number VARCHAR(20)
);

CREATE TABLE Airline (
    airline_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    contact_number VARCHAR(15),
    email VARCHAR(100),
    headquarters_address VARCHAR(255)
);

CREATE TABLE Airport (
    airport_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    code VARCHAR(3),
    city VARCHAR(100),
    country VARCHAR(100),
    contact_number VARCHAR(15)
);

CREATE TABLE Flight (
    flight_id INT PRIMARY KEY AUTO_INCREMENT,
    flight_number VARCHAR(10),
    airline_id INT,
    departure_airport_id INT,
    arrival_airport_id INT,
    departure_time DATETIME,
    arrival_time DATETIME,
    duration INT,
    total_seats INT,
    available_seats INT,
    price DECIMAL(10, 2),
    FOREIGN KEY (airline_id) REFERENCES Airline(airline_id),
    FOREIGN KEY (departure_airport_id) REFERENCES Airport(airport_id),
    FOREIGN KEY (arrival_airport_id) REFERENCES Airport(airport_id)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    passenger_id INT,
    flight_id INT,
    booking_date DATETIME,
    seat_number VARCHAR(10),
    booking_status ENUM('Confirmed', 'Cancelled', 'Pending'),
    total_price DECIMAL(10, 2),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    booking_id INT,
    payment_date DATETIME,
    payment_method ENUM('Credit Card', 'Debit Card', 'PayPal'),
    amount DECIMAL(10, 2),
    payment_status ENUM('Paid', 'Pending', 'Failed'),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);


 --Data insert into tables
 
 
INSERT INTO Passenger (passenger_id, name, gender, phone, email, dob, address, passport_number)
VALUES
(1, 'John Doe', 'Male', '1234567890', 'john.doe@example.com', '1990-01-01', '123 Main St, City, Country', 'A12345678'),
(2, 'Jane Smith', 'Female', '0987654321', 'jane.smith@example.com', '1995-05-15', '456 Elm St, City, Country', 'B98765432'),
(3, 'Alice Johnson', 'Female', '1122334455', 'alice.johnson@example.com', '1985-12-25', '789 Oak St, City, Country', 'C11223344'),
(4, 'Bob Brown', 'Male', '5566778899', 'bob.brown@example.com', '2000-07-30', '321 Pine St, City, Country', 'D55667788');


INSERT INTO Airline (airline_id, name, contact_number, email, headquarters_address)
VALUES
(1, 'Delta Airlines', '1800123456', 'info@delta.com', 'Atlanta, Georgia, USA'),
(2, 'American Airlines', '1800654321', 'info@american.com', 'Fort Worth, Texas, USA'),
(3, 'Emirates', '1800999888', 'info@emirates.com', 'Dubai, UAE'),
(4, 'British Airways', '1800111222', 'info@britishairways.com', 'London, UK');


INSERT INTO Airport (airport_id, name, code, city, country, contact_number)
VALUES
(1, 'John F. Kennedy International Airport', 'JFK', 'New York', 'USA', '1800123456'),
(2, 'Heathrow Airport', 'LHR', 'London', 'UK', '1800111222'),
(3, 'Dubai International Airport', 'DXB', 'Dubai', 'UAE', '1800999888'),
(4, 'Los Angeles International Airport', 'LAX', 'Los Angeles', 'USA', '1800654321');


INSERT INTO Flight (flight_id, flight_number, airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time, duration, total_seats, available_seats, price)
VALUES
(1, 'DL123', 1, 1, 4, '2023-10-01 10:00:00', '2023-10-01 12:00:00', 120, 150, 150, 200.00),
(2, 'AA456', 2, 2, 3, '2023-10-02 14:00:00', '2023-10-02 16:00:00', 120, 200, 200, 250.00),
(3, 'EK789', 3, 3, 1, '2023-10-03 18:00:00', '2023-10-03 20:00:00', 120, 180, 180, 300.00),
(4, 'BA101', 4, 4, 2, '2023-10-04 22:00:00', '2023-10-05 02:00:00', 240, 220, 220, 350.00);


INSERT INTO Booking (booking_id, passenger_id, flight_id, booking_date, seat_number, booking_status, total_price)
VALUES
(1, 1, 1, '2023-09-25 14:00:00', 'A1', 'Confirmed', 200.00),
(2, 2, 2, '2023-09-26 15:00:00', 'B2', 'Confirmed', 250.00),
(3, 3, 3, '2023-09-27 16:00:00', 'C3', 'Pending', 300.00),
(4, 4, 4, '2023-09-28 17:00:00', 'D4', 'Cancelled', 350.00);


INSERT INTO Payment (payment_id, booking_id, payment_date, payment_method, amount, payment_status)
VALUES
(1, 1, '2023-09-25 14:05:00', 'Credit Card', 200.00, 'Paid'),
(2, 2, '2023-09-26 15:05:00', 'Debit Card', 250.00, 'Paid'),
(3, 3, '2023-09-27 16:05:00', 'PayPal', 300.00, 'Pending'),
(4, 4, '2023-09-28 17:05:00', 'Credit Card', 350.00, 'Failed');