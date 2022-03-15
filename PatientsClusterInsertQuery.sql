-- Patient Entity

Use MindYourOwnMolars

INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(1,'Mark','Smith','6676696969','msmith@gmail.com','2005/9/29','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(2,'Anthony','Rodriguez','6676696970','arod@gmail.com','1996/9/30','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(1,'Donald','Brown','6676696971','dbrown@gmail.com','1993/10/1','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(2,'Steve','Davis','6676696972','daviss@gmail.com','1998/10/2','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(3,'Andrew','Wilson','6676696973','andywil@gmail.com','1989/10/3','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(4,'Joshua','Thomas','6676696974','josht@gmail.com','1995/10/4','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(1,'George','Taylor','6676696975','georgetay@gmail.com','2007/10/5','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(5,'Edward','Lee','6676696976','lee.ed@gmail.com','1996/10/6','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(1,'Jason','Thompson','6676696977','jason.thompson@gmail.com','1986/10/7','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(2,'Ryan','White','6676696978','ryanwhite@gmail.com','1979/10/8','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(5,'Jacob','Scott','6676696979','jscott@gmail.com','2009/10/9','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(4,'Gary','Nguyen','6676696980','nguyern.gary@gmail.com','1976/10/10','Male');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(6,'Mary','Baker','6676696981','baker.m@gmail.com','1986/10/11','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(2,'Susan','Hall','6676696982','susanhall@gmail.com','1983/10/12','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(2,'Lisa','Campbell','6676696983','lisa.c@gmail.com','2007/10/13','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(1,'Ashley','Turner','6676696984','turner.ash@gmail.com','1997/10/14','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(3,'Laura','Parker','6676696985','laurapark@gmail.com','1988/10/15','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(2,'Amy','Collins','6676696986','collins.amy@gmail.com','1978/10/16','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(3,'Shirley','Stewart','6676696987','shirley.s@gmail.com','1977/10/17','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(3,'Debra','Cooper','6676696988','debra.coop@gmail.com','1970/10/18','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(2,'Leighton','Sanders','6676696989','leightons@gmail.com','1990/10/19','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(2,'Diane','Long','6676696990','dianelong@gmail.com','1992/10/20','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(1,'Bella','Patel','6676696991','patel.bella@gmail.com','2007/10/21','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(1,'Olivia','Foster','6676696992','oliviaf98@gmail.com','1999/10/22','Female');
INSERT INTO Patient (PrimaryDentistId,FirstName,LastName,PhoneNo,Email,DOB,Gender) 
VALUES(5,'Whitney','Soprano','6676696993','soprano.whit@gmail.com','2000/10/23','Female');

--PatientInfo Entity
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(1,'10900 Wilshire Blvd','02115','Sarah ','Marshall','889891301');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(2,'14 Vine St','36104','Blair','Waldorf','889891302');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(3,'815 Woodland St','99801','Serena','Van der Woodsen','889891303');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(4,'33 Lakeshore Drive','85001','Nate','Archibald','889891304');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(6,'3 Chapel St','95814','Daniel','Humphrey','889891306');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(7,'933 Amerige Lane','29217','Gregory','Hirsch','889891307');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(8,'60 W Surrey Isl.','06103','Tom','Wambsgams','889891308');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(5,'93 Garden Dr.','78701','Charles','Bass','889891305');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(9,'66 Vernon St','65101','Nicholas','Murray','889891309');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(10,'8 W. Sugar St','59623','Monica','Scott','889891310');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(11,'76 Greystone Court','68502','Rachel','Nguyen','889891311');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(12,'8 Bedford Ave','96813','Thomas','Baker','889891312');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(13,'14 Gartner Ave','08608','Kimberly','Hall','889891313');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(14,'31 Ivy Cir','87501','Ashlee','Campbell','889891314');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(15,'22 Maple Grove Rd','12207','Ron','Turner','889891315');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(16,'1176 Olive Ave','27601','Camilla','Parker','889891316');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(17,'12 Alder St','72201','Phil','Collins','889891317');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(18,'1 Cheyenne St','80202','Robert','Stewart','889891318');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(19,'44 Greyback Dr','19901','Nick','Cooper','889891319');
INSERT INTO PatientInfo(PatientId,AddressFirstLine,ZipCode,EmergencyFirstName,EmergencyLastName,EmergencyPhoneNo) 
VALUES(20,'77 Alder St','32301','Jake','Sanders','889891320');

--Companion Info
INSERT INTO CompanionInfo (PatientId,CompanionFirstName,CompanionLastName,CompanionPhoneNo,Relationship)
VALUES (1,'Martin','Smith','6676696969','Father');
INSERT INTO CompanionInfo (PatientId,CompanionFirstName,CompanionLastName,CompanionPhoneNo,Relationship)
VALUES (7,'Phoebe','Taylor','6676696975','Mother');
INSERT INTO CompanionInfo (PatientId,CompanionFirstName,CompanionLastName,CompanionPhoneNo,Relationship)
VALUES (15,'Gloria','Campbell','6676696983','Mother');
INSERT INTO CompanionInfo (PatientId,CompanionFirstName,CompanionLastName,CompanionPhoneNo,Relationship)
VALUES (23,'Bina','Patel','6676696991','Mother');
INSERT INTO CompanionInfo (PatientId,CompanionFirstName,CompanionLastName,CompanionPhoneNo,Relationship)
VALUES (11,'Jason','Scott','6676696979','Father');

--Consent Entity
INSERT INTO Consent (PatientId,Signed,Date) VALUES (1,0,'2021/9/19');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (2,1,'2021/9/20');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (3,1,'2021/9/21');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (4,1,'2021/9/22');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (5,1,'2021/9/23');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (6,1,'2021/9/24');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (7,1,'2021/9/25');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (10,1,'2021/9/26');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (12,1,'2021/9/26');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (17,1,'2021/9/26');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (23,1,'2021/9/26');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (16,1,'2021/10/2');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (17,1,'2021/10/2');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (14,1,'2021/10/2');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (11,1,'2021/10/3');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (9,1,'2021/10/3');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (15,1,'2021/10/3');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (13,1,'2021/10/3');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (18,1,'2021/10/3');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (8,0,'2021/10/3');
INSERT INTO Consent (PatientId,Signed,Date) VALUES (24,1,'2021/10/3');

select * from consent

--Medical History Entity
select * from MedicalHistory

INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (1,0,1,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (2,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (3,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (4,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (5,1,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (6,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (7,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (8,0,0,0,0,1);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (9,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (10,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (11,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (12,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (13,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (14,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (15,1,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (16,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (17,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (18,0,0,0,0,1);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (19,0,0,0,0,0);
INSERT INTO MedicalHistory (PatientId,[Covid-19],Diabetes,Chemotherapy,HIV,HighCholestrol) 
VALUES (20,1,0,0,0,0);


-- Other Medications Entity


INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (2,'Allegra','Allergies');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (2,'Prozac','Anti depressant');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (2,'Ibuprofen','Cold');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (4,'Allegra','Allergies');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (24,'Calcimax','Calcium Deficiency');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (6,'Zoloft','Anti depressant');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (7,'Lexapro','Anxiety medication');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (10,'Ibuprofen','Common Cold');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (12,'Zoloft','Anti Depressant');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (17,'Zoloft','Anti Depressant');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (23,'Prozac','Anti Depressant');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (17,'Cetirizine','Cold');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (14,'Zoloft','Anti depressant');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (11,'Lexapro','Anxiety medication');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (9,'Loratadine','Allergy');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (12,'Cetirizine','Cold');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (10,'Zoloft','Anti Depressant');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (18,'Prozac','Anti Depressant');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (8,'Lexapro','Anxiety medication');
INSERT INTO OtherMedications (PatientId,Medicine,Purpose) VALUES (23,'Allegra','Allergies');

--Dental History Entity
select * from DentalHistory

INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (1,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (2,0,1,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (3,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (4,0,1,1);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (5,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (6,0,0,0); 
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (7,1,1,1);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (8,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (9,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (10,1,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (11,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (12,1,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (13,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (14,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (15,1,0,1);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (16,0,0,1);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (17,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (18,1,0,1);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (19,0,0,0);
INSERT INTO DentalHistory (PatientId,TopicalFluorideApplication,Fluoridated_Water,Fluoride_Supplement_Diet) 
VALUES (20,0,0,0);


