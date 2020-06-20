INSERT INTO invoice (invoice_number, invoice_date, car_id, customer_id, staff_id )
VALUES ('852399038', '2018/08/22', '0', '1', '3'),
('731166526', '2018/12/31', '3', '0', '5'),
('271135104', '2019/01/22', '2', '2', '7');

INSERT INTO car (car_id, manufacturer, model, car_year, color )
VALUES ('0', 'Volkswagen', 'Triguan', 2019, 'Blue'),
('1', 'Peugeot', 'Rifter', 2019, 'Red'),
('2', 'Toyota', 'RAV4', 2018, 'Silver'),
('3', 'Ford', 'Fusion', 2018, 'White'),
('4', 'Volvo', 'V60', 2019, 'Gray'),
('5', 'Volvo', 'V60 Cross Country', 2019, 'Gray');

ALTER TABLE car
DROP COLUMN brand;


INSERT INTO customer (customer_id, customer_name, phone, address, customer_city, customer_state, customer_country, customer_zip )
VALUES ('0', 'Pablo Picasso', '+34 636 17 63 82', 'Paseo de la Chopera, 14', 'Madrid','Madrid','Spain',28045),
('1', 'Abraham Lincoln', '+1 305 907 7086', '120 SW 8th St', 'Miami','Florida','United States',33130),
('2', 'Napoleon Bonaparte', '+33 1 79 75 40 00', '40 Rue du Colisée', 'Paris','Île-de-France','France',75008);

INSERT INTO salesperson (staff_id, salesperson_name, store)
VALUES ('0', 'Petey Cruiser', 'Madrid'),
('1', 'Anna Sthesia', 'Barcelona'),
('2', 'Paul Molive', 'Berlin'),
('3', 'Paige Turner', 'Miami'),
('4', 'Bob Frapples', 'Mexico City'),
('5', 'Walter Melon', 'Amsterdam'),
('6', 'Shonda Leer', 'Sao Paulo'),
('7', 'Pedro Di Gianni', 'Sao Paulo');

SELECT * FROM customer