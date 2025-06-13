CREATE TABLE RegisteredUsers(
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Fname VARCHAR(50) NOT NULL,
	Lname VARCHAR(50) NOT NULL,
	Dob VARCHAR(50) NOT NULL,
	Gender CHAR NOT NULL,
	ContactNumber BIGINT NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Password VARCHAR(20) NOT NULL,
	UserName VARCHAR(20),
	Role VARCHAR(30),
	IsActive VARCHAR(20)
);

ALTER TABLE RegisteredUsers ALTER COLUMN Password VARCHAR(20) NOT NULL;

INSERT INTO RegisteredUsers (Fname, Lname, Dob, Gender, ContactNumber, Email, Password, UserName, Role)
 VALUES('Vrushabh', 'Gawas','15 Jan', 'M', '9321569235','gawasvrushabh@gmail.com','1212','Vrushabh','Developer');


INSERT INTO RegisteredUsers (Fname, Lname, Dob, Gender, ContactNumber, Email, Password, UserName, Role)
 VALUES('Yash', 'Mayekar','21 Sep', 'M', '9321569235','yash@gmail.com','1212','Yash','User'),
		('Om', 'Gaikwad','25 Oct', 'M', '9321569235','om@gmail.com','1212','Om','Supervisor'),
		('Sumit', 'Mule','29 Feb', 'M', '9321569235','sumit@gmail.com','1212','Sumit','User');