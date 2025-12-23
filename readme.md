# 🚗 Vehicle Rental Management System (SQL Project)

## 📌 Project Overview

This project demonstrates a **Vehicle Rental Management System** using SQL. The system manages users, vehicles, and bookings, and answers common business-related queries such as booking details, vehicle availability, and rental statistics.

The project focuses on:

- Database schema design
- Use of constraints and enums
- Writing meaningful SQL queries
- Data retrieval using joins, subqueries, and aggregations

## 🛠️ Technologies Used

- **PostgreSQL**
- **SQL**

## 📂 Project Structure

```
📁 project-root
 ├── queries.sql
 └── README.md
```

- `queries.sql` → Contains all database schemas, insert statements, and SQL queries
- `README.md` → Project explanation and query documentation

## 🧱 Database Schema Explanation

### 🔹 Enum Types

**user_role:** Defines user roles
- `Customer`
- `Admin`

**bookingStatus:** Represents booking lifecycle
- `pending`
- `confirmed`
- `completed`
- `cancelled`

### 🔹 Tables

#### Users Table

Stores customer and admin information.

| Column | Description |
|--------|-------------|
| `user_id` | Primary key |
| `name` | User name |
| `email` | Unique email |
| `password` | Encrypted password |
| `phone` | Contact number |
| `role` | User role (enum) |

#### Vehicles Table

Stores vehicle details available for rent.

| Column | Description |
|--------|-------------|
| `vehicle_id` | Primary key |
| `name` | Vehicle name |
| `type` | Car, bike, or truck |
| `model` | Model year |
| `registration_number` | Unique vehicle number |
| `rental_price` | Rental cost |
| `status` | Available, rented, or maintenance |

#### Bookings Table

Stores rental booking information.

| Column | Description |
|--------|-------------|
| `booking_id` | Primary key |
| `user_id` | References users |
| `vehicle_id` | References vehicles |
| `start_date` | Rental start date |
| `end_date` | Rental end date |
| `status` | Booking status |
| `total_cost` | Total rental cost |

## 📊 Query Explanations (queries.sql)

### ✅ Query 1: Booking Details with Customer and Vehicle Information

```sql
SELECT booking_id, u.name AS customer_name, v.name AS vehicle_name,
       start_date, end_date, b.status
FROM bookings b
INNER JOIN users u ON b.user_id = u.user_id
INNER JOIN vehicles v ON b.vehicle_id = v.vehicle_id;
```

**📌 Purpose:** Retrieves all booking details along with the customer name and vehicle name using INNER JOINs.

---

### ✅ Query 2: Vehicles That Have Never Been Booked

```sql
SELECT *
FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1
  FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
);
```

**📌 Purpose:** Finds vehicles that do not appear in the bookings table using a subquery with NOT EXISTS.

---

### ✅ Query 3: Available Cars

```sql
SELECT *
FROM vehicles
WHERE type = 'car' AND status = 'available';
```

**📌 Purpose:** Retrieves all vehicles that are cars and currently available for rent.

---

### ✅ Query 4: Vehicles Booked More Than Two Times

```sql
SELECT v.name, COUNT(b.booking_id)
FROM vehicles v
INNER JOIN bookings b ON v.vehicle_id = b.vehicle_id
GROUP BY v.vehicle_id
HAVING COUNT(b.booking_id) > 2;
```

**📌 Purpose:** Identifies vehicles that have been booked more than two times, using GROUP BY and HAVING.

## 🚀 Getting Started

### Prerequisites

- PostgreSQL installed on your system
- Basic knowledge of SQL

### Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/vehicle-rental-sql.git
   cd vehicle-rental-sql
   ```

2. **Create the database**
   ```bash
   psql -U postgres
   CREATE DATABASE vehicle_rental;
   \c vehicle_rental
   ```

3. **Run the SQL file**
   ```bash
   psql -U postgres -d vehicle_rental -f queries.sql
   ```

4. **Verify the setup**
   ```sql
   \dt  -- List all tables
   SELECT * FROM users;
   SELECT * FROM vehicles;
   SELECT * FROM bookings;
   ```

## 💡 Key Features

- **Relational Database Design** with proper normalization
- **Enum Types** for consistent data values
- **Foreign Key Constraints** maintaining referential integrity
- **Complex SQL Queries** demonstrating joins, subqueries, and aggregations
- **Business Logic Implementation** through SQL queries

## 📈 Learning Outcomes

This project demonstrates:

- ✅ Creating and managing relational databases
- ✅ Implementing constraints and data types
- ✅ Writing complex SQL queries with multiple joins
- ✅ Using aggregate functions and GROUP BY clauses
- ✅ Implementing subqueries and EXISTS clauses
- ✅ Designing practical database schemas for real-world applications

## 🤝 Contributing

Contributions are welcome! Feel free to:

1. Fork the project
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License.

## 👨‍💻 Author

**Your Name**

- GitHub: [@yourusername](https://github.com/yourusername)
- LinkedIn: [Your Name](https://linkedin.com/in/yourprofile)
- Email: your.email@example.com

## 🔗 GitHub Repository

📎 **Repository Link:** 👉 [https://github.com/yourusername/vehicle-rental-sql](https://github.com/yourusername/vehicle-rental-sql)

---

⭐ If you find this project helpful, please give it a star on GitHub!

Made with ❤️ and SQL