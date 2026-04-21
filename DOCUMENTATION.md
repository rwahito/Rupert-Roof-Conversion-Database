## Database Tables

The database contains 8 tables, listed below, along with the primary, foreign key, and other constraints.

<img width="661" height="355" alt="RRC TABLES" src="https://github.com/user-attachments/assets/aff0410d-7f19-49c1-81e6-43a5c3f204a2" />


### 1. Job_type
Stores different types of roofing jobs and their associated daily rates.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| **Jobtype_id**  | INTEGER | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for job type |
| Jobtype | VARCHAR(100) | NOT NULL | Name/description of the job type |
| Daily_rate | DECIMAL(5,2) | NOT NULL | Daily rate charged for this job type |

**Primary Key:** Jobtype_id

---

### 2. Customers
Contains customer contact and address information.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| **Customer_id**  | INT | PRIMARY KEY, NOT NULL, DEFAULT 001 | Unique identifier for customer |
| Customer_name | VARCHAR(50) | NOT NULL | Full name of the customer |
| Street | VARCHAR(100) | NOT NULL | Street address |
| Area | VARCHAR(50) | NOT NULL | Area/neighborhood |
| City | VARCHAR(50) | NOT NULL | City name |
| Postcode | VARCHAR(50) | | Postal code |

**Primary Key:** Customer_id

---

### 3. Staff
Maintains staff member information and contact details.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| **Staff_id**  | VARCHAR(10) | PRIMARY KEY, NOT NULL | Unique identifier for staff member |
| Staff_name | VARCHAR(50) | NOT NULL | Full name of staff member |
| Contact | VARCHAR(15) | NOT NULL | Contact phone number |

**Primary Key:** Staff_id

---

### 4. Jobs
Central table tracking all roofing jobs and their details.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| **Job_id**  | INT | PRIMARY KEY, AUTO_INCREMENT, NOT NULL | Unique identifier for job |
| Customer_id  | INT | FOREIGN KEY, NOT NULL | References Customers(Customer_id) |
| Jobtype_id  | INT | FOREIGN KEY, NOT NULL | References Job_type(Jobtype_id) |
| Days | NUMERIC | NOT NULL | Number of days for the job |
| Date_started | DATE | | Job start date |
| Date_completed | DATE | CHECK: >= Date_started OR NULL | Job completion date |

**Primary Key:** Job_id  
**Foreign Keys:**
- Customer_id → Customers(Customer_id)
- Jobtype_id → Job_type(Jobtype_id)

**Constraints:**
- Date_completed must be >= Date_started OR NULL

---

### 5. Materials
Catalog of materials used in roofing projects.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| **Material_id** | INT | PRIMARY KEY, AUTO_INCREMENT, NOT NULL | Unique identifier for material |
| Material_name | VARCHAR(255) | NOT NULL | Name/description of material |
| Measure | VARCHAR(20) | NOT NULL | Unit of measurement (e.g., kg, m², pieces) |
| Unit_price | DECIMAL(10,2) | NOT NULL | Price per unit |

**Primary Key:** Material_id

---

### 6. job_staff (Junction Table)
Links staff members to specific jobs, tracking which employees work on which projects.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| Job_id | INT | FOREIGN KEY, AUTO_INCREMENT, NOT NULL | References Jobs(Job_id) |
| Staff_id | VARCHAR(10) | FOREIGN KEY, NOT NULL | References Staff(Staff_id) |

**Foreign Keys:**
- Job_id → Jobs(Job_id)
- Staff_id → Staff(Staff_id)

---

### 7. Job_Material (Junction Table)
Tracks which materials are used in each job and the quantities consumed.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| **Job_id**  | INT | COMPOSITE PRIMARY KEY, FOREIGN KEY | References Jobs(Job_id) |
| **Material_id** | INT | COMPOSITE PRIMARY KEY, FOREIGN KEY | References Materials(Material_id) |
| Quantity_Used | DECIMAL(10,2) | NOT NULL, CHECK > 0 | Amount of material used |

**Primary Key:** (Job_id, Material_id) - Composite  
**Foreign Keys:**
- Job_id → Jobs(Job_id)
- Material_id → Materials(Material_id)

**Constraints:**
- Quantity_Used must be > 0

---

### 8. Invoice
Stores invoice information for completed jobs.

| Column Name | Data Type | Constraints | Description |
|------------|-----------|-------------|-------------|
| **Invoice_ID**  | INT | PRIMARY KEY, AUTO_INCREMENT | Unique identifier for invoice |
| Job_ID  | INT | FOREIGN KEY, NOT NULL, UNIQUE | References Jobs(Job_ID) |
| Invoice_Date | DATE | NOT NULL | Date invoice was generated |
| VAT_Rate | DECIMAL(5,4) | NOT NULL, DEFAULT 0.2000 | VAT rate applied (stored for historical accuracy) |

**Primary Key:** Invoice_ID  
**Foreign Key:** Job_ID → Jobs(Job_ID)  
**Unique Constraint:** Job_ID (one invoice per job)

### Relationships

1. **Job_type → Jobs** (One-to-Many)
   - One job type can be used for multiple jobs
   - Each job must have exactly one job type

2. **Customers → Jobs** (One-to-Many)
   - One customer can have multiple jobs
   - Each job belongs to exactly one customer

3. **Jobs ↔ Staff** (Many-to-Many via job_staff)
   - A job can have multiple staff members assigned
   - A staff member can work on multiple jobs
   - Junction table: `job_staff.`

4. **Jobs ↔ Materials** (Many-to-Many via Job_Material)
   - A job can use multiple materials
   - A material can be used in multiple jobs
   - Junction table: `Job_Material` (includes Quantity_Used)

5. **Jobs → Invoice** (One-to-One)
   - Each job can have exactly one invoice
   - Each invoice is linked to exactly one job

`

## 
** - Customer_id has a default value of 001
- Auto-increment is used for most ID fields to ensure uniqueness
- The database uses CHECK constraints to enforce business logic
- Junction tables enable many-to-many relationships between jobs and both staff and materials **
