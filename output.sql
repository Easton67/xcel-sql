/*
FILE: Segway
DATE: 
AUTHOR: Liam Easton
Description
	 
*/
/*******************************************************************************/

-- Standard pattern for creating a database.
DROP DATABASE IF EXISTS ;
CREATE DATABASE ;
USE ;

/* **************************************************************************** 
 	 Building table */

  FIELD DATATYPE(LENGTH)  DEFAULT DEFAULT , /* COMMENTS */
  Employee (MAX)   , 
  EmployeeID int(MAX) NOT NULL  IDENTITY(100000, 1), /* identity */
  FirstName nvarchar(50) NOT NULL DEFAULT no , 
  LastName nvarchar(50) NOT NULL DEFAULT no , 
  PhoneNumber nvarchar(11) NOT NULL DEFAULT no , 
  Email nvarchar(250) NOT NULL DEFAULT no , /* username for login */
  PasswordHash nvarchar(100) NOT NULL DEFAULT see comments , /* SHA256 - default is hash value for newuser. */
  Active bit(MAX) NOT NULL DEFAULT 1 , /* deactivate rather than delete. */
CREATE TABLE Role (
  RoleID nvarchar(50) NOT NULL DEFAULT no , /* role name is used as ID. */
  EmployeeRole (join table)(MAX)   , 
  EmployeeID int(MAX) NOT NULL DEFAULT no , /* compound primary key. */
  RoleID nvarchar(50) NOT NULL DEFAULT no , /* compound primary key. */
  TourGuide (join table)(MAX)   , 
  EmployeeID int(MAX) NOT NULL DEFAULT yes , /* compound primary key. */
  RentalID int(MAX) NOT NULL DEFAULT no , /* compound primary key. */
  Prep (MAX)   , 
  PrepID int(MAX) NOT NULL DEFAULT no IDENTITY(100000, 1), 
  EmployeeID int(MAX) NOT NULL DEFAULT no , 
  SegwayID (MAX) NOT NULL  , 
  Maintenance (MAX)   , 
  MaintenanceID int(MAX) NOT NULL DEFAULT no IDENTITY(100000, 1), 
  EmployeeID int(MAX) NOT NULL DEFAULT no , 
  Mline (join table)(MAX)   , 
  MaintenanceID int(MAX) NOT NULL DEFAULT no , /* compound primary key. */
  SegwayID int(MAX) NOT NULL DEFAULT no , /* compound primary key. */
  Checkin (MAX)   , 
  CheckInID int(MAX) NOT NULL DEFAULT no IDENTITY(100000, 1), 
  EmployeeID int(MAX) NOT NULL DEFAULT no , 
  SegwayID int(MAX) NOT NULL DEFAULT no , 
  Customer (MAX)   , 
  CustomerID int(MAX) NOT NULL DEFAULT no IDENTITY(100000, 1), 
  Rental (MAX)   , 
  RentalID int(MAX) NOT NULL DEFAULT no IDENTITY(100000, 1), 
  CustomerID int(MAX) NOT NULL DEFAULT no , 
  EmployeeID int(MAX) NOT NULL DEFAULT no , 
  Line (join table)(MAX)   , 
  RentalID int(MAX) NOT NULL DEFAULT no , /* compound primary key. */
  SegwayID nvarchar(25) NOT NULL DEFAULT no , /* compound primary key. */
  Segway (MAX)   , 
  SegwayID nvarchar(25) NOT NULL DEFAULT no , /* serial number. */
  TypeID nvarchar(25)  DEFAULT no , 
  StatusID nvarchar(25)  DEFAULT "prep" , 
);

CREATE TABLE Type (
  TypeID nvarchar(25) NOT NULL DEFAULT no , 
);

CREATE TABLE Status (
  StatusID nvarchar(25) NOT NULL DEFAULT no , 
);
