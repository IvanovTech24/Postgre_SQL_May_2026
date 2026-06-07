-- CREATE DATABASE project_management;

CREATE TABLE employees(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    project_id INT
);

CREATE TABLE clients(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    name VARCHAR(10) NOT NULL
);

CREATE TABLE projects(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY NOT NULL,
    client_id INT,
    project_lead_id INT,
    CONSTRAINT fk_client_id FOREIGN KEY (client_id) REFERENCES clients(id),
    CONSTRAINT fk_project_lead_id FOREIGN KEY (project_lead_id) REFERENCES employees(id)
);

ALTER TABLE
    employees
ADD CONSTRAINT fk_project_id FOREIGN KEY (project_id) REFERENCES projects(id);
