## Tables and Structure

### 1. Job_type

| Column Name | Key Type | Description                               |
| ----------- | -------- | ----------------------------------------- |
| Jobtype_id  | PK       | Unique identifier for each job type       |
| Jobtype     |          | Type of job (e.g., Full, Semi conversion) |
| Daily_rate  |          | Cost per day for the job type             |

---

### 2. Customers

| Column Name   | Key Type | Description                         |
| ------------- | -------- | ----------------------------------- |
| Customer_id   | PK       | Unique identifier for each customer |
| Customer_name |          | Customer full name                  |
| Street        |          | Street address                      |
| Area          |          | Area/location                       |
| City          |          | City                                |
| Postcode      |          | Postal code                         |

---

### 3. Staff

| Column Name | Key Type | Description                 |
| ----------- | -------- | --------------------------- |
| Staff_id    | PK       | Unique identifier for staff |
| Staff_name  |          | Staff full name             |
| Contact     |          | Contact details             |

---

### 4. Jobs

| Column Name    | Key Type | Description                       |
| -------------- | -------- | --------------------------------- |
| Job_id         | PK       | Unique identifier for each job    |
| Customer_id    | FK       | References Customers(Customer_id) |
| Jobtype_id     | FK       | References Job_type(Jobtype_id)   |
| Days           |          | Number of days required           |
| Date_started   |          | Job start date                    |
| Date_completed |          | Job completion date               |

---

### 5. Materials

| Column Name   | Key Type | Description                    |
| ------------- | -------- | ------------------------------ |
| Material_id   | PK       | Unique identifier for material |
| Material_name |          | Name of material               |
| Measure       |          | Unit of measurement            |
| Unit_price    |          | Price per unit                 |

---

### 6. job_staff (Junction Table)

| Column Name | Key Type | Description                |
| ----------- | -------- | -------------------------- |
| Job_id      | FK       | References Jobs(Job_id)    |
| Staff_id    | FK       | References Staff(Staff_id) |

---

### 7. Job_Material (Junction Table)

| Column Name   | Key Type | Description                       |
| ------------- | -------- | --------------------------------- |
| Job_id        | PK, FK   | References Jobs(Job_id)           |
| Material_id   | PK, FK   | References Materials(Material_id) |
| Quantity_Used |          | Quantity of material used         |

---

### 8. Invoice

| Column Name  | Key Type | Description                |
| ------------ | -------- | -------------------------- |
| Invoice_ID   | PK       | Unique invoice identifier  |
| Job_ID       | FK       | References Jobs(Job_ID)    |
| Invoice_Date |          | Date invoice was issued    |
| VAT_Rate     |          | VAT applied to the invoice |

---

## Relationships

| From Table | From Column | To Table     | To Column   | Relationship Type |
| ---------- | ----------- | ------------ | ----------- | ----------------- |
| Customers  | Customer_id | Jobs         | Customer_id | One-to-Many       |
| Job_type   | Jobtype_id  | Jobs         | Jobtype_id  | One-to-Many       |
| Jobs       | Job_id      | job_staff    | Job_id      | One-to-Many       |
| Staff      | Staff_id    | job_staff    | Staff_id    | One-to-Many       |
| Jobs       | Job_id      | Job_Material | Job_id      | One-to-Many       |
| Materials  | Material_id | Job_Material | Material_id | One-to-Many       |
| Jobs       | Job_id      | Invoice      | Job_ID      | One-to-One        |

---

## Key Notes

* Junction tables (`job_staff`, `Job_Material`) resolve many-to-many relationships.
* `Job_Material` uses a composite primary key to uniquely identify material usage per job.
* Foreign keys enforce referential integrity across the database.
* Constraints such as CHECK conditions ensure valid data entry (e.g., positive quantities, valid dates).

---

This structure ensures efficient tracking of operations, accurate cost calculation, and consistency across all business processes.
