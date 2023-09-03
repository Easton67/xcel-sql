FIELD DATATYPE LENGTH DEFAULT IDENTITY START INCREMENT NULLS INDEX UNIQUE PK FK  REFERENCES COMMENTS
***************************************************************************** */ 
DROP TABLE IF EXISTS Employee;
CREATE TABLE;
CREATE TABLE(
RoleID nvarchar 50 no    no yes yes yes    role name is used as ID.
;

/* *****************************************************************************
	Building table
***************************************************************************** */ 
DROP TABLE IF EXISTS EmployeeRole;
CREATE TABLE( 
EmployeeID int  no    no yes  yes yes  Employee.EmployeeID compound primary key.
;

/* *****************************************************************************
	Building table
RoleID nvarchar 50 no    no yes  yes yes  Role.RoleID compound primary key.
;

/* *****************************************************************************
	Building table
***************************************************************************** */ 
DROP TABLE IF EXISTS TourGuide;
CREATE TABLE( 
EmployeeID int  yes    no yes  yes yes  Employee.EmployeeID compound primary key.
;

/* *****************************************************************************
	Building table
RentalID int  no    no yes  yes yes  Rental.RentalID compound primary key.
;

/* *****************************************************************************
	Building table
***************************************************************************** */ 
DROP TABLE IF EXISTS Prep;
CREATE TABLE;
CREATE TABLE(
MaintenanceID  int  no    no yes yes yes yes  Maintenance.MaintenanceID compound primary key.
;

/* *****************************************************************************
	Building table
SegwayID int  no    no yes yes yes yes  Segway.SegwayID compound primary key.
;

/* *****************************************************************************
	Building table
***************************************************************************** */ 
DROP TABLE IF EXISTS Checkin;
CREATE TABLE;
CREATE TABLE(
RentalID int  no    no yes yes yes yes  Rental.RentalID compound primary key.
;

/* *****************************************************************************
	Building table
SegwayID nvarchar 25 no    no yes yes yes yes  Segway.SegwayID compound primary key.
;

/* *****************************************************************************
	Building table
***************************************************************************** */ 
DROP TABLE IF EXISTS Segway;
CREATE TABLE;
CREATE TABLE(
TypeID nvarchar 25 no    no yes yes yes    
***************************************************************************** */ 
DROP TABLE IF EXISTS Status;
CREATE TABLE( 
StatusID nvarchar 25 no    no yes yes yes    
