CREATE TABLE patients
(
id int GENERATED ALWAYS AS IDENTITY,
	name varchar (255),
	date_of_birth date,
	PRIMARY KEY (id)
	);

CREATE TABLE medical_histories (
id int GENERATED ALWAYS AS IDENTITY,
	admitted_at timestamp,
	patient_id int,
	status varchar (255),
	PRIMARY KEY (id),
	FOREIGN KEY (patient_id) REFERENCES patients(id)
);

CREATE TABLE treatments (
id SERIAL PRIMARY KEY,
type VARCHAR(255),
name VARCHAR(255)
);

CREATE TABLE medical_history_treatments (
medical_history_id INT,
treatment_id INT,
FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id),
FOREIGN KEY (treatment_id) REFERENCES treatments(id),
PRIMARY KEY (medical_history_id, treatment_id)
);

CREATE TABLE invoices (
id int GENERATED ALWAYS AS IDENTITY,
	total_amount decimal,
	generated_at timestamp,
	payed_at timestamp,
	medical_history_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (medical_history_id) REFERENCES medical_histories(id)
);


CREATE TABLE invoice_items (
id int GENERATED ALWAYS AS IDENTITY,
	unit_price decimal,
	quantity int,
	total_price decimal,
	invoice_id int,
	treatment_id int,
	PRIMARY KEY (id),
	FOREIGN KEY (invoice_id) REFERENCES invoices(id),
	FOREIGN KEY (treatment_id) REFERENCES treatments(id)
);

-- optimization indexing 

CREATE INDEX patient_index ON medical_histories(patient_id);
CREATE INDEX medical_history_index ON medical_histories_treatments(medical_history_id);
CREATE INDEX treatment_history_index ON medical_history_treatments(treatment_id);
CREATE INDEX invoice_index ON invoices(medical_history_id);
CREATE INDEX invoice_items_index ON invoice_items(invoice_id);
CREATE INDEX invoice_items_treatments_index ON invoice_items(treatment_id);