# RUPERT ROOF CONVERSIONS

## Database Design & Development – Documentation

**Prepared by:** Risper Wahito Wanjugu,
Data analyst.
**Date:** 15 April 2026.

---

## Task scenario:

Rupert Roof Conversions is a company based in London, in the United Kingdom. They specialize in turning attics in houses into habitable rooms. Jobs vary between simply fitting floorboards to full conversions with dormer windows, electrical fittings and staircases. When a customer contacts Rupert Roof Conversions for an initial quote and estimate, the job they want is classified by job type. One or more workers will be assigned to the job. Each job will be allocated equipment and materials. Jobs are charged at a rate determined by the job type and how many days are needed to complete the job.

---

## Problem Statement

Rupert Roof Conversions requires a relational database system to manage their roof conversion business operations. The database must track:

1. Customer Information: Store customer details including name and full address to maintain a customer record and enable repeat business tracking.
2. Job Management: Record all conversion projects with their classification (Full Conversion, Semi Conversion, Floor Boarding), duration, and completion dates to track business operations and project history.
3. Staff Allocation: Track which staff members work on which jobs, accommodating multiple staff per job and staff working across multiple concurrent projects.
4. Materials and Equipment: Maintain an inventory catalog of materials (floorboards, electrical components, stairs packs) and record the specific quantities used on each job for accurate cost calculation and inventory management.
5. Pricing and Invoicing: Calculate job costs based on job type daily rates, project duration, and materials used, then generate VAT-inclusive invoices with complete itemization.

---

## Data Dictionary

The database contains six tables as listed below:

### 1. Job type

**Description**

* Primary key:
* Contains Information on the job type and the daily rates

| Column name | Data Type  | Constraints      | Example          |
| ----------- | ---------- | ---------------- | ---------------- |
| Jobtype_id  | Varchar 3  | Not null, unique | ‘Jt1’            |
| Jobtype     | Varchar 50 | Not null         | ‘Semi conversion |
| Daily_rate  | Currency   | Not null         | ’90.00’          |

---

### 2. Customer

**Description**

* Primary Key: Customer_Id
* Contains the customer details

| Column name   | Data type  | Constraints | Examples        |
| ------------- | ---------- | ----------- | --------------- |
| Customer_Id   | Integer    | Not null    | ‘C001’          |
| Customer_name | Varchar 50 | Not null    | ‘Colin Clark’   |
| Street        | Integer    | Not null    | 67              |
| Area          | Varchar 50 | Not null    | ‘church street’ |
| City          | Varchar    | Not null    | London          |
| Postal Code   | **         |             |                 |

---

### 3. Staff

**Description**

* Primary key: Material_Id
* Contains the details of all the staff members

| Column name | Data type   | Constraints                     | Example          |
| ----------- | ----------- | ------------------------------- | ---------------- |
| Staff_Id    | Varchar 10  | Not null, unique auto increment | ‘S100’           |
| Staff_name  | Varchar 100 | Not null                        | ‘Ronald smith’   |
| Contact     | Varchar 20  | Not null                        | ‘+91 1234566789’ |

---

### 4. Jobs

**Description**

* Primary key: Job_id.
* Foreign keys: customer name (customer), jobtype (jobtype)
* Contains the different jobs that are to be/ are being undertaken by the company

| Column name    | Data type   | Constraints                      | Example           |
| -------------- | ----------- | -------------------------------- | ----------------- |
| Job_id         | Integer     | Not null, Unique, Auto increment | ‘28434’           |
| Customer_name  | Varchar 255 | Not null                         | ‘Colin Clark’     |
| Job type       | Varchar 255 | Not null                         | ‘Semi conversion’ |
| Number of days | Number      | Not null                         | ‘2’               |
| Date           | Date & time | Not null                         | ‘15/4/26’         |

---

### 5. Staff on job

**Description**

* Foreign keys: staff_number (staff), staff name (Staff), Job_id (Jobs)
* Contains the details of jobs and the staff members assigned to each

| Column name  | Data type | Example        |
| ------------ | --------- | -------------- |
| Job_id       | Integer   | ‘28434’        |
| Staff_number | varchar   | ‘s100’         |
| Staff_name   | String    | ‘Ronald smith’ |

---

### 6. Invoice

**Description**

* Primary key:
* Contains the invoices of each job.

| Column name | Data type | Example           |
| ----------- | --------- | ----------------- |
| Invoice_id  | Integer   | ‘I001’            |
| Job type    | String    | ‘Semi conversion’ |
| Daily_rate  | Currency  | 90.00             |
| Days        | number    | 2                 |
| Subtotal    | Currency  | **                |

---

## Relationship

| From table    | From column | To table | To column     | Type        |
| ------------- | ----------- | -------- | ------------- | ----------- |
| Customer      | Customer_id | Jobs     | Customer_name | One – many  |
| Staff on jobs | Job_id      | Staff    | Staff_number  | Many – many |
| Invoice       | Job type    | Job type | job type      | Many – one  |

---

