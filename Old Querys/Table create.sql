CREATE TABLE Family(
      Staff_ID VARCHAR(5) PRIMARY KEY,
      Name CHAR(30),
      Address VARCHAR(50),
      FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE Outpatient(
      Record_ID VARCHAR(5) PRIMARY KEY,
      ODate DATE
      FOREIGN KEY (Record_ID) REFERENCES Record(Record_ID)
);

CREATE TABLE Department_Lab (
    Department_ID VARCHAR(4),
    Laboratory_ID VARCHAR(4),
    PRIMARY KEY (Department_ID,Laboratory_ID),
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
    FOREIGN KEY (Laboratory_ID) REFERENCES Laboratory(Laboratory_ID)
);

CREATE TABLE Patient (
    Patient_ID VARCHAR(6) PRIMARY KEY,
    Name VARCHAR(20),
    State VARCHAR(4),
    Address VARCHAR(40),
    Gender VARCHAR(8),
    DOB DATE,
    Room_ID VARCHAR(5),
    Department_ID VARCHAR(4),
    Doctor_ID VARCHAR(5),
    FOREIGN KEY (Room_ID) REFERENCES Laboratory(Laboratory_ID)
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Laboratory(Laboratory_ID)
);

CREATE TABLE Inpatient (
    Record_ID  VARCHAR(5) PRIMARY KEY,
    Admit_Date DATE,
    Discharge_Date DATE,
    FOREIGN KEY (Record_ID) REFERENCES Record(Record_ID)
);

CREATE TABLE Word_boy (
    Word_boy_ID  VARCHAR(5) PRIMARY KEY,
    Staff_ID VARCHAR(5)
    FOREIGN KEY (Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE Nurse_Assign (
    Nurse_ID VARCHAR(6),
    Room_ID VARCHAR(6),
    NADate DATE,
    NATime TIME,
    PRIMARY KEY (Nurse_ID,Room_ID);
    FOREIGN KEY (Nurse_ID) REFERENCES Nures(Nures_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

CREATE TABLE Doctor(
    Doctor_ID VARCHAR(5) PRIMARY KEY,
    Staff_ID VARCHAR(5),
    DType CHAR(20),
    FOREIGN KEY(Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE Pharmacy(
    Pharmacy_ID VARCHAR(5) PRIMARY KEY,
    Name CHAR(20),
    Location VARCHAR(30),
    Contact_No VARCHAR(11)
);

CREATE TABLE Nurse(
    Nurse_ID VARCHAR(5) PRIMARY KEY,
    Staff_ID VARCHAR(5),
    FOREIGN KEY(Staff_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE Patient_Contact(
    Patient_ID VARCHAR(6),
    Contact VARCHAR(11),
    PRIMARY KEY(Patient_ID,Contact),
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE Bill(
    Bill_ID VARCHAR(6) PRIMARY KEY,
    Doctor_Charges DECIMAL(6,2),
    Treatment_Charges DECIMAL(6,2),
    Medicine_Charges DECIMAL(6,2),
    BDate,
    Patient_ID VARCHAR(6),
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE Ward_boy_Assign(
   Ward_boy_ID VARCHAR(6),
   Room_ID VARCHAR(6),
   WADate DATE,
   WATime TIME,
   PRIMARY KEY(Ward_boy_ID,Room_ID),
   FOREIGN KEY(Ward_boy_ID) REFERENCES Word_boy(Ward_boy_ID)
);

CREATE TABLE Paid_by(
    Bill_ID VARCHAR(6)
    Method_ID VARCHAR(6)
    PdDate DATE,
    PdTime TIME,
    PRIMARY KEY(Bill_ID,Method_ID),
    FOREIGN KEY Bill_ID REFERENCES Bill(Bill_ID)
);

CREATE TABLE Room(
    Room_ID VARCHAR(5) PRIMARY KEY,
    RType VARCHAR(20),
    Department_ID VARCHAR(4),
    FOREIGN KEY(Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Staff(
    Staff_ID VARCHAR(5),
    Name CHAR(30),
    Salary DECIMAL(10,2),
    Department_ID VARCHAR(4),
    PRIMARY KEY(Staff_ID),
    FOREIGN KEY(Department_ID) REFERENCES Department(Department_ID)
);

CREATE TABLE Medicine(
    Medicine_ID VARCHAR(5),
    Name VARCHAR(30),
    Quantity INT(5),
    Pharmacy_ID VARCHAR(5),
    PRIMARY KEY(Medicine_ID),
    FOREIGN KEY(Pharmacy_ID) REFERENCES Pharmacy(Pharmacy_ID)
);

CREATE TABLE Gives(
    Patient_ID VARCHAR(6),
    Medicine_ID VARCHAR(5),
    G_Date DATE,
    G_Time TIME,
    PRIMARY KEY(Patient_ID,Medicine_ID),
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY(Medicine_ID) REFERENCES Medicine(Medicine_ID)
);

CREATE TABLE Doctor_treat(
    Doctor_ID VARCHAR(5),
    Patient__ID VARCHAR(6),
    Treatment_Name VARCHAR(30),
    D_Date DATE,
    D_Time TIME,
    Test_Result VARCHAR(20),
    PRIMARY KEY(Doctor_ID,Patient__ID),
    FOREIGN KEY(Doctor_ID) REFERENCES Doctor(Doctor_ID),
    FOREIGN KEY(Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE Laboratory (
    Laboratory_ID VARCHAR(4) PRIMARY KEY,
    Name VARCHAR(20)
);

CREATE TABLE Department (
    Department_ID VARCHAR(4) PRIMARY KEY,
    Name CHAR(30)
);

CREATE TABLE Record (
    Record_ID VARCHAR(6) PRIMARY KEY, 
    Patient_ID VARCHAR(6),
    Weight VARCHAR(6),
    Blood-Group VARCHAR(4),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE Payment_Method(
    Method_ID VARCHAR(6) PRIMARY KEY,
    PMType VARCHAR(20)
);

