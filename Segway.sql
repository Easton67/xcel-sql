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
 	 Building table */

nvarchar,50,no,,,,no,,,,,,,LastName,nvarchar,50,no,,,,no,,,,,,,PhoneNumber,nvarchar,11,no,,,,no,,,,,,,Email,nvarchar,250,no,,,,no,yes,yes,,,,,username for loginPasswordHash,nvarchar,100, see comments,,,,no,,,,,,,SHA256 - default is hash value for newuserActive,bit,,1,,,,no ,,,,,,,deactivate rather than delete
***************************************************************************** */ 
DROP TABLE IF EXISTS Role,,,,,,,,,,,,,,RoleID,nvarchar,50,no,,,,no,yes,yes,yes,,,,role name is used as ID
***************************************************************************** */ 
DROP TABLE IF EXISTS EmployeeRole,,,,,,,,,,,,,,EmployeeID,int,,no,,,,no,yes,,yes,yes,,Employee.EmployeeID,compound primary keyRoleID,nvarchar,50,no,,,,no,yes,,yes,yes,,Role.RoleID,compound primary key
***************************************************************************** */ 
DROP TABLE IF EXISTS TourGuide,,,,,,,,,,,,,,EmployeeID,int,,yes,,,,no,yes,,yes,yes,,Employee.EmployeeID,compound primary keyRentalID,int,,no,,,,no,yes,,yes,yes,,Rental.RentalID,compound primary key
***************************************************************************** */ 
DROP TABLE IF EXISTS Prep
***************************************************************************** */ 
DROP TABLE IF EXISTS PrepID,int,,no,yes,100000,1,no,yes,yes,yes,,,,EmployeeID,int,,no,,,,no,,,,yes,,Employee.EmployeeID,SegwayID,,,,,,,no,,,,yes,,Segway.SegwayID
***************************************************************************** */ 
DROP TABLE IF EXISTS ,Maintenance
***************************************************************************** */ 
DROP TABLE IF EXISTS MaintenanceID,int,,no,yes,100000,1,no,yes,yes,yes,no,,,EmployeeID,int,,no,,,,no,,,,yes,,Employee.EmployeeID
***************************************************************************** */ 
DROP TABLE IF EXISTS ,Mline,,,,,,,,,,,,,,MaintenanceID ,int,,no,,,,no,yes,yes,yes,yes,,Maintenance.MaintenanceID,compound primary keySegwayID,int,,no,,,,no,yes,yes,yes,yes,,Segway.SegwayID,compound primary key
***************************************************************************** */ 
DROP TABLE IF EXISTS Checkin
***************************************************************************** */ 
DROP TABLE IF EXISTS CheckInID,int,,no,yes,100000,1,no,yes,yes,yes,,,,EmployeeID,int,,no,,,,no,,,,yes,,Employee.EmployeeID,SegwayID,int,,no,,,,no,,,,yes,,Segway.SegwayID
***************************************************************************** */ 
DROP TABLE IF EXISTS ,Customer
***************************************************************************** */ 
DROP TABLE IF EXISTS CustomerID,int,,no,yes,100000,1,no,yes,yes,yes,yes
***************************************************************************** */ 
DROP TABLE IF EXISTS ,,,Rental
***************************************************************************** */ 
DROP TABLE IF EXISTS RentalID,int,,no,yes,100000,1,no,yes,yes,yes,,,,CustomerID,int,,no,,,,no,,,,yes,,Customer.CustomerID,EmployeeID,int,,no,,,,no,,,,yes,,Employee.EmployeeID
***************************************************************************** */ 
DROP TABLE IF EXISTS ,Line,,,,,,,,,,,,,,RentalID,int,,no,,,,no,yes,yes,yes,yes,,Rental.RentalID,compound primary keySegwayID,nvarchar,25,no,,,,no,yes,yes,yes,yes,,Segway.SegwayID,compound primary key
***************************************************************************** */ 
DROP TABLE IF EXISTS Segway
***************************************************************************** */ 
DROP TABLE IF EXISTS SegwayID,nvarchar,25,no,,,,no,yes,yes,yes,,,,serial numberTypeID,nvarchar,25,no,,,,,,,,yes,,Type.TypeID,StatusID,nvarchar,25,"""prep""",,,,,,,,yes,,Status.StatusID
***************************************************************************** */ 
DROP TABLE IF EXISTS ,Type,,,,,,,,,,,,,,TypeID,nvarchar,25,no,,,,no,yes,yes,yes
***************************************************************************** */ 
DROP TABLE IF EXISTS ,,,,Status,,,,,,,,,,,,,,StatusID,nvarchar,25,no,,,,no,yes,yes,yes,,,,