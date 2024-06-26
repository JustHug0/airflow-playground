
CREATE SCHEMA nds;


CREATE TABLE nds.products (
    product_id SERIAL PRIMARY KEY,
    product_line VARCHAR(50),
    unit_price FLOAT
);

CREATE TABLE nds.gender (
    gender_id SERIAL PRIMARY KEY,
    gender_type VARCHAR(8)
);

CREATE TABLE nds.city (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50)
);

CREATE TABLE nds.customer_type (
    customer_type_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(25)
);

CREATE TABLE nds.branch (
    branch_id SERIAL PRIMARY KEY,
    city_id INT,
    branch VARCHAR(10),
    CONSTRAINT fk_city FOREIGN KEY (city_id) REFERENCES nds.city(city_id)
);

CREATE TABLE nds.payment_type (
    payment_id SERIAL PRIMARY KEY,
    types VARCHAR(25)
);

CREATE TABLE nds.payment (
    invoice_id VARCHAR(25) PRIMARY KEY,
    payment_type INT,
    branch_id INT,
    customer_type INT,
    total FLOAT,
    datetime TIMESTAMP,
    gender INT,
    CONSTRAINT fk_payment_type FOREIGN KEY (payment_type) REFERENCES nds.payment_type(payment_id),
    CONSTRAINT fk_branch_id FOREIGN KEY (branch_id) REFERENCES nds.branch(branch_id),
    CONSTRAINT fk_customer_type FOREIGN KEY (customer_type) REFERENCES nds.customer_type(customer_type_id),
    CONSTRAINT fk_gender FOREIGN KEY (gender) REFERENCES nds.gender(gender_id)
);

CREATE TABLE nds.invoice (
    invoice_id VARCHAR(25) PRIMARY KEY,
    tax_5 FLOAT,
    cogs FLOAT,
    gross_margin FLOAT,
    gross_income FLOAT,
    product_id INT,
    CONSTRAINT fk_product FOREIGN KEY (product_id) REFERENCES nds.products(product_id),
    CONSTRAINT fk_invoice FOREIGN KEY (invoice_id) REFERENCES nds.payment(invoice_id)
);