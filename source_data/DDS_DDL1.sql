CREATE schema dds;

CREATE TABLE dds.city (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50)
);

CREATE TABLE dds.customer_type (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(25)
);

CREATE table dds.product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);

CREATE TABLE dds.branch (
    branch_id SERIAL PRIMARY KEY,
    branch VARCHAR(10)
);

CREATE TABLE dds.payment_type (
    payment_id SERIAL PRIMARY KEY,
    types VARCHAR(25)
);

CREATE TABLE dds.gender (
    gender_id SERIAL PRIMARY KEY,
    gender VARCHAR(8)
);

CREATE TABLE dds.payment (
    city_id INT,
    branch_id INT,
    customer_type INT,
    payment_type INT,
    product_id INT,
    gender_id INT,
    total FLOAT,
    date date,
    quantity INT,
    tax_5 FLOAT,
    cogs FLOAT,
    gross_margin FLOAT,
    gross_income FLOAT,
    CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES dds.city(city_id),
    CONSTRAINT fk_branch FOREIGN KEY (branch_id) REFERENCES dds.branch(branch_id),
    CONSTRAINT fk_customer_type FOREIGN KEY (customer_type) REFERENCES dds.customer_type(customer_id),
    CONSTRAINT fk_payment_type FOREIGN KEY (payment_type) REFERENCES dds.payment_type(payment_id),
    CONSTRAINT fk_gender FOREIGN KEY (gender_id) REFERENCES dds.gender(gender_id),
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES dds.product(product_id)
);