use master;

CREATE  Table Temperature(
	id INT,
	record_date date not null,
	temperature int not null
);


Insert INTO [master].[dbo].[Temperature] ([id], [record_date], [teamperature])
	values ('1', '2015-01-01', '10'),
		   ('2', '2015-01-02', '25'),
		   ('3', '2015-01-03', '20'),
		   ('4', '2015-01-04', '30'); 
	  