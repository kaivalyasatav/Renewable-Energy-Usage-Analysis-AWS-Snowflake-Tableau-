CREATE database PowerBI;

create schema PBI_Data;

create table PBI_Dataset (
Year int,	Location string,	Area	int,
Rainfall	float, Temperature	float, Soil_type string,
Irrigation	string, yeilds	int,Humidity	float,
Crops	string,price	int,Season string



);

select * from PBI_Dataset;

//drop database test;

create stage PowerBI.PBI_Data.pbi_stage
url = 's3://powerbi.project'
storage_integration = PBI_Integration

//desc stage s1

//drop stage s1;


copy into PBI_Dataset 
from @pbi_stage
file_format = (type=csv field_delimiter=',' skip_header=1 )
on_error = 'continue'

list @pbi_stage
