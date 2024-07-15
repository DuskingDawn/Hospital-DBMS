USE Hospital;

CREATE ROLE 'admin_role';
CREATE ROLE 'doctor_role';
CREATE ROLE 'receptionist_role';
CREATE ROLE 'nurse_role';
CREATE ROLE 'pharmacist_role';
CREATE ROLE 'lab_technician_role';
CREATE ROLE 'billing_staff_role';

GRANT ALL PRIVILEGES ON Hospital.* TO 'admin_role';
GRANT SELECT, INSERT, UPDATE ON Hospital.Patient TO 'doctor_role';
GRANT SELECT, INSERT, UPDATE ON Hospital.Appointment TO 'doctor_role';
GRANT SELECT, INSERT, UPDATE ON Hospital.MedicalRecord TO 'doctor_role';
GRANT SELECT, UPDATE ON Hospital.Patient TO 'nurse_role';
GRANT SELECT, INSERT, UPDATE ON Hospital.MedicalRecord TO 'nurse_role';
GRANT SELECT, INSERT, UPDATE ON Hospital.Patient TO 'receptionist_role';
GRANT SELECT, INSERT, UPDATE ON Hospital.Appointment TO 'receptionist_role';
GRANT SELECT ON Hospital.Patient TO 'pharmacist_role';
GRANT SELECT ON Hospital.MedicalRecord TO 'pharmacist_role';
GRANT SELECT, INSERT, UPDATE ON Hospital.MedicalRecord TO 'lab_technician_role';
GRANT SELECT ON Hospital.Patient TO 'billing_staff_role';

