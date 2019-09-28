﻿CREATE TABLE [users].[Phone_Numbers]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[User_ID]		[dbo].[UUID_Type]		NOT NULL
	,	[Number]		VARCHAR(30)				NOT NULL
	,	[Extension]		VARCHAR(15)				NULL
	,	[Country_Code]	VARCHAR(10)				NULL
	,	[Phone_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0
	,	[Status_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0	
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	CONSTRAINT [PK_Users_Phone_Numbers_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [FK_Users_Phone_Numbers_User_ID] FOREIGN KEY ([User_ID]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Phone_Numbers_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Phone_Numbers_Updated_By] FOREIGN KEY ([Updated_By]) REFERENCES [users].[Users]([ID])
);