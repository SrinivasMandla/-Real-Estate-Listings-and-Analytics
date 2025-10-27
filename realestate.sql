create database realestate;
use realestate;

CREATE TABLE Agents (
    agent_id int PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE Buyers (
    buyer_id int PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);

CREATE TABLE Properties (
    property_id int PRIMARY KEY,
    address TEXT,
    city VARCHAR(50),
    state VARCHAR(50),
    zip_code VARCHAR(10),
    property_type VARCHAR(50),
    area_sqft INT,
    listed_price DECIMAL(12,2),
    listed_date DATE,
    agent_id INT REFERENCES Agents(agent_id)
);

CREATE TABLE Transactions (
    transaction_id int PRIMARY KEY,
    property_id INT REFERENCES Properties(property_id),
    buyer_id INT REFERENCES Buyers(buyer_id),
    sale_price DECIMAL(12,2),
    sale_date DATE
);

---2. Insert Mock Property Data

INSERT INTO Agents (agent_id,name, email, phone) VALUES
(1,'Aarav Mehta', 'aarav@realestate.com', '9876543210'),
(2,'Sneha Reddy', 'sneha@realestate.com', '9876543211');

select * from Agents;

INSERT INTO Buyers (buyer_id,name, email, phone) VALUES
(1,'Rohan Das', 'rohan@buyer.com', '9876543212'),
(2,'Meera Iyer', 'meera@buyer.com', '9876543213');

select * from Buyers;

INSERT INTO Properties (property_id,address, city, state, zip_code, property_type, area_sqft, listed_price, listed_date, agent_id) VALUES
(1,'123 MG Road', 'Bangalore', 'Karnataka', '560001', 'Apartment', 1200, 8500000, '2025-01-15', 1),
(2,'456 Jubilee Hills', 'Hyderabad', 'Telangana', '500033', 'Villa', 2500, 15000000, '2025-02-10', 2);

select * from  Properties; 

INSERT INTO Transactions (transaction_id,property_id, buyer_id, sale_price, sale_date) VALUES
(1,1, 1, 8300000, '2025-03-01'),
(2,2, 2, 14800000, '2025-03-15');

select * from  Transactions ;

---3. Analyze Average Prices by Region

SELECT city, ROUND(AVG(sale_price), 2) AS avg_price
FROM Properties p
JOIN Transactions t ON p.property_id = t.property_id
GROUP BY city
ORDER BY avg_price DESC;

---4. Create Views for High-Demand Areas

CREATE VIEW High_Demand_Areas AS
SELECT city, COUNT(*) AS total_sales, ROUND(AVG(sale_price), 2) AS avg_price
FROM Properties p
JOIN Transactions t ON p.property_id = t.property_id
GROUP BY city
HAVING COUNT(*) > 1 AND AVG(sale_price) > 10000000;

---5. Price Trend Reports Using Window Functions
SELECT city, DATE_add('month', sale_date) AS month,
       ROUND(AVG(sale_price), 2) AS avg_monthly_price,
       ROUND(AVG(sale_price) OVER (PARTITION BY city ORDER BY DATE_TRUNC('month', sale_date)
            ROWS BETWEEN 2 PRECEDING AND CURRENT ROW), 2) AS rolling_avg
FROM Properties p
JOIN Transactions t ON p.property_id = t.property_id
GROUP BY city, month
ORDER BY city, month;