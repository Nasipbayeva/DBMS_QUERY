--QUERY #1
--Write SQL query that will display all HOSPITALS whose name starts with the letter "A" and hospital type is called "Clinics"
select * from Hospital
where hospital_name like 'A%' and hospital_type='Clinics';

--QUERY #2
--Write SQL query that will display the count of different values of the hospital mail
SELECT Count(*) AS DISTINCTEMAIL
FROM (SELECT DISTINCT HOSPITAL_EMAIL FROM HOSPITAL_CONTACT);

--QUERY #3
--Write an SQL query that will display all departments in the DEPARTMENT table sorted in ascending order by the DEPARTMENT_MANAGER column and in descending order by the DEPARTMENT_NAME column
SELECT * FROM DEPARTMENT
ORDER BY DEPARTMENT_MANAGER ASC, DEPARTMENT_NAME DESC;

--QUERY #4
--Write SQL query that will UPDATE patient_name and patient_phone

UPDATE PATIENT
SET PATIENT_NAME = 'William James', PATIENT_PHONE = '000 111 2222'
WHERE PATIENT_ID = 1;

select * from PATIENT

--QUERY #5
--Write SQL query that will delete the doctor "Bel Daniel" from the DOCTOR table
DELETE FROM DOCTOR WHERE DOCTOR_NAME='Forrester Arnow';
select * from Doctor

--QUERY #6
--Write an SQL query that will remove the DURATION column from the SURGERY table
ALTER TABLE SURGERY
DROP COLUMN DURATION

select * from SURGERY

--QUERY #7
--Write a SQL query that will display all MEDICINE_REPORTs that refer to the same SUPPLIER_ID as the SUPPLER
SELECT * FROM MEDICINE_REPORT WHERE SUPPLIER_ID IN (SELECT SUPPLIER_ID FROM SUPPLIER);

--QUERY #8
--Write an SQL query that will display all PATIENTS with PATIENT_REPORT and MEDICINE information
SELECT PATIENT.PATIENT_ID, PATIENT.PATIENT_NAME, PATIENT_REPORT.DIAGNOSE, MEDICINE.MEDICINE_NAME
FROM ((PATIENT
INNER JOIN PATIENT_REPORT ON PATIENT.PATIENT_ID = PATIENT_REPORT.PATIENT_ID)
INNER JOIN MEDICINE ON PATIENT_REPORT.MEDICINE_ID = MEDICINE.MEDICINE_ID);

--QUERY #9
--Write an SQL query that will display NURSE_NAMEs with the position of "clinical nurse specialist"
SELECT NURSE_NAME
FROM NURSE
WHERE EXISTS (SELECT EMPLOYEE_SALARY FROM PAYROLL WHERE PAYROLL.EMPLOYEE_SSN = NURSE.SSN AND NURSE_POSITION = 'Clinical Nurse Specialist');

--QUERY #10
--Write an SQL query that will display the number of block codes that each room_type contains
SELECT ROOM.ROOM_TYPE, COUNT(WARDS.BLOCKCODE) AS NUMBEROFBLOCKS FROM WARDS
LEFT JOIN ROOM ON WARDS.BLOCKFLOOR = ROOM.BLOCKFLOOR
GROUP BY ROOM_TYPE;

--QUERY #11
--Write an SQL query that will display all MEDICINES, and MEDICINE_REPORT they might have
SELECT MEDICINE_REPORT.COMPANY, MEDICINE.MEDICINE_NAME, MEDICINE.MEDICINE_TYPE
FROM MEDICINE_REPORT
RIGHT JOIN MEDICINE ON MEDICINE_REPORT.MEDICINE_ID = MEDICINE.MEDICINE_ID

--QUERY #12
--Write an SQL query that will display ALL MEDICINE_NAME if it finds ANY records in the MEDICINE_REPORT table has Quantity larger than 30
SELECT ALL MEDICINE_NAME
FROM MEDICINE
WHERE MEDICINE_ID = ANY
(SELECT MEDICINE_ID
FROM MEDICINE_REPORT
WHERE Quantity > 30);

--QUERY #13
--Write an SQL query that will display ssn that starts with the number 2 from the "NURSE" and "DOCTOR" tables
SELECT doctor_id, doctor_position FROM DOCTOR
WHERE ssn like '2%'
UNION ALL
SELECT nurse_id, nurse_position FROM NURSE
WHERE ssn like '2%'
order by doctor_id

--QUERY #14
--NULL FUNCTIONS
SELECT bill_no, (surgery_charge + room_charge)
FROM Bill;

--QUERY #15
--TRIGGER INSERT
delete from DEPARTMENT
select * from department
insert into DEPARTMENT values(1, 'Operating theatre (OT)', 'Pancho Bullent')

create or replace trigger "DEPARTMENT_T2"
AFTER
insert on "DEPARTMENT"
for each row
declare
pragma autonomous_transaction;
begin
if :new.department_name like 'General Surgery' then
insert into DEPARTMENT(department_id, department_name, department_manager) values(:new.department_id, :new.department_name, :new.department_manager);
commit;
end if;
end;


--QUERY #16
--UPDATE
update DEPARTMENT SET department_name = 'Gastroenterology department' 
where(department_name = 'Operating theatre (OT)' and department_manager = 'Pancho Bullent') 
select * from DEPARTMENT

--QUERY #17
--DELETE
delete from Department
select * from Department



