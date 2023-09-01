FIELD,DATATYPE,LENGTH,DEFAULT,IDENTITY,START,INCREMENT,NULLS,INDEX,UNIQUE,PK,FK,,REFERENCES,COMMENTS
,,,,,,,,,,,,,,
Employee,,,,,,,,,,,,,,
EmployeeID,int,,,yes,100000,1,no,yes,yes,yes,,,,identity
FirstName,nvarchar,50,no,,,,no,,,,,,,
LastName,nvarchar,50,no,,,,no,,,,,,,
PhoneNumber,nvarchar,11,no,,,,no,,,,,,,
Email,nvarchar,250,no,,,,no,yes,yes,,,,,username for login
PasswordHash,nvarchar,100, see comments,,,,no,,,,,,,SHA256 - default is hash value for newuser
Active,bit,,1,,,,no ,,,,,,,deactivate rather than delete
,,,,,,,,,,,,,,
Role,(lookup table),,,,,,,,,,,,,
RoleID,nvarchar,50,no,,,,no,yes,yes,yes,,,,role name is used as ID
,,,,,,,,,,,,,,
EmployeeRole,(join table),,,,,,,,,,,,,
EmployeeID,int,,no,,,,no,yes,,yes,yes,,Employee.EmployeeID,compound primary key
RoleID,nvarchar,50,no,,,,no,yes,,yes,yes,,Role.RoleID,compound primary key
,,,,,,,,,,,,,,
TourGuide,(join table),,,,,,,,,,,,,
EmployeeID,int,,yes,,,,no,yes,,yes,yes,,Employee.EmployeeID,compound primary key
RentalID,int,,no,,,,no,yes,,yes,yes,,Rental.RentalID,compound primary key
,,,,,,,,,,,,,,
Prep,,,,,,,,,,,,,,
PrepID,int,,no,yes,100000,1,no,yes,yes,yes,,,,
EmployeeID,int,,no,,,,no,,,,yes,,Employee.EmployeeID,
SegwayID,,,,,,,no,,,,yes,,Segway.SegwayID,
,,,,,,,,,,,,,,
Maintenance,,,,,,,,,,,,,,
MaintenanceID,int,,no,yes,100000,1,no,yes,yes,yes,no,,,
EmployeeID,int,,no,,,,no,,,,yes,,Employee.EmployeeID,
,,,,,,,,,,,,,,
Mline,(join table),,,,,,,,,,,,,
MaintenanceID ,int,,no,,,,no,yes,yes,yes,yes,,Maintenance.MaintenanceID,compound primary key
SegwayID,int,,no,,,,no,yes,yes,yes,yes,,Segway.SegwayID,compound primary key
,,,,,,,,,,,,,,
Checkin,,,,,,,,,,,,,,
CheckInID,int,,no,yes,100000,1,no,yes,yes,yes,,,,
EmployeeID,int,,no,,,,no,,,,yes,,Employee.EmployeeID,
SegwayID,int,,no,,,,no,,,,yes,,Segway.SegwayID,
,,,,,,,,,,,,,,
Customer,,,,,,,,,,,,,,
CustomerID,int,,no,yes,100000,1,no,yes,yes,yes,yes,,,
,,,,,,,,,,,,,,
Rental,,,,,,,,,,,,,,
RentalID,int,,no,yes,100000,1,no,yes,yes,yes,,,,
CustomerID,int,,no,,,,no,,,,yes,,Customer.CustomerID,
EmployeeID,int,,no,,,,no,,,,yes,,Employee.EmployeeID,
,,,,,,,,,,,,,,
Line,(join table),,,,,,,,,,,,,
RentalID,int,,no,,,,no,yes,yes,yes,yes,,Rental.RentalID,compound primary key
SegwayID,nvarchar,25,no,,,,no,yes,yes,yes,yes,,Segway.SegwayID,compound primary key
,,,,,,,,,,,,,,
Segway,,,,,,,,,,,,,,
SegwayID,nvarchar,25,no,,,,no,yes,yes,yes,,,,serial number
TypeID,nvarchar,25,no,,,,,,,,yes,,Type.TypeID,
StatusID,nvarchar,25,"""prep""",,,,,,,,yes,,Status.StatusID,
,,,,,,,,,,,,,,
Type,(lookup table),,,,,,,,,,,,,
TypeID,nvarchar,25,no,,,,no,yes,yes,yes,,,,
,,,,,,,,,,,,,,
Status,(lookup table),,,,,,,,,,,,,
StatusID,nvarchar,25,no,,,,no,yes,yes,yes,,,,
/*
FILE: Segway.sql
DATE: 2023
AUTHOR: Liam Easton
Description
	 
*/
/*******************************************************************************/

-- Standard pattern for creating a database.
DROP DATABASE IF EXISTS Segway;
CREATE DATABASE Segway;
USE Segway;

/* **************************************************************************** 
 	 Building table 
 ***************************************************************************** */