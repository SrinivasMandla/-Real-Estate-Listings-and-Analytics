# 🏡 Real Estate Listings and Analytics

This project simulates a real estate analytics platform using PostgreSQL. It tracks property listings, agents, buyers, and transactions, and generates insights such as average prices by region, high-demand areas, and price trends over time.

## 📌 Objective

To design and implement a relational database system that manages real estate data and performs analytical queries to uncover market trends and pricing insights.

## 🛠️ Tools Used

- **Database Engine:** PostgreSQL  
- **Interface:** DBeaver  
- **Data Source:** Synthetic mock data  
- **Export Format:** CSV  

## 🗂️ Schema Overview

The database consists of four core tables:

- `Agents`: Real estate agents managing listings  
- `Buyers`: Customers purchasing properties  
- `Properties`: Listings with location, type, and price  
- `Transactions`: Records of property sales  

## 🧱 Steps Involved

1. **Schema Design**  
   - Created normalized tables with foreign key relationships  
   - Defined constraints for data integrity

2. **Data Insertion**  
   - Inserted mock data for agents, buyers, and properties  
   - Recorded sample transactions with sale prices and dates

3. **Analytical Queries**  
   - Average sale price by city  
   - Monthly price trends using window functions  
   - Identification of high-demand areas

4. **Views and Reports**  
   - Created views for reusable insights  
   - Exported result sets to CSV for reporting
