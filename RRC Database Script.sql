/* Database creation script */
drop database
	rupert_roof_conversions;
    
/* Checks if the database exists and drops it to creata a new one */

Create database
	rupert_roof_conversions;
use 
rupert_roof_conversions;

-- 1. Jobe type talble --

Create table Job_type (
	Jobtype_id integer auto_increment,
	Jobtype varchar (100) Not null,
    Daily_rate decimal(5,2) not null,
    primary key (Jobtype_id)
    );
    
-- 2. Customer table --

create table Customers (
	Customer_id int not null default (001),
    Customer_name varchar(50) not null,
    Street varchar(100) not null,
    Area varchar(50) not null,
    City varchar(50) not null,
    Postcode varchar(50),
    primary key (Customer_id)
    );
    
    
-- 3. Staff table --

create table Staff (
	Staff_id varchar(10) Not null,
    Staff_name varchar(50) Not null,
    Contact varchar(15) not null,
    primary key(Staff_id)
    );
    
-- 4. Jobs table--

create table Jobs (
	Job_id int auto_increment Not null,
    Customer_id int not null,
    Jobtype_id int not null,
    Days numeric not null,
    Date_started date,
    Date_completed date,
    primary key(Job_id),
    FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_id),
    FOREIGN KEY (Jobtype_id) REFERENCES Job_type(Jobtype_id),
    CHECK (Date_Completed >= Date_Started OR Date_Completed IS NULL)
    );
    
/* 5. Materials table */

create table Materials (
	Material_id int auto_increment not null,
    Material_name varchar(255) not null,
    Measure varchar(20) not null,
    Unit_price decimal(10,2) not null,
    primary key(Material_id)
    );

/* 6. Job staff  (junction table)
indicates the jobs and the staff members assigned to each on */

create table job_staff (
	Job_id int auto_increment not null,
    Staff_id varchar(10) not null,
	FOREIGN KEY (Job_id) REFERENCES Jobs(Job_id),
    FOREIGN KEY (Staff_id) REFERENCES Staff(Staff_id)
    );

/* 7. Job material table (Junction tables)
indicates the different jobs and the materials used in each */

create table Job_Material (
    Job_iD int,
    Material_iD int,
    Quantity_Used DECIMAL(10,2) NOT NULL CHECK (Quantity_Used > 0),
    PRIMARY KEY (Job_id, Material_ID),
    FOREIGN KEY (Job_id) REFERENCES Jobs(Job_id),
    FOREIGN KEY (Material_id) REFERENCES Materials(Material_id)
);

/* 8. Invoices */

CREATE TABLE Invoice (
    Invoice_ID INT AUTO_INCREMENT,
    Job_ID INT NOT NULL,
    Invoice_Date DATE NOT NULL,
    VAT_Rate DECIMAL(5,4) NOT NULL DEFAULT 0.2000,  -- Store rate for historical accuracy --
    
    PRIMARY KEY (Invoice_ID),
    FOREIGN KEY (Job_ID) REFERENCES Jobs(Job_ID),
    UNIQUE (Job_ID)  -- One invoice per job -- 
);
    

