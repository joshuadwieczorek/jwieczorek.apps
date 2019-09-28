CREATE TABLE [users].[Users]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[Username]		[dbo].[Name_Type]		NOT NULL
	,	[First_Name]	[dbo].[Name_Type]		NOT NULL
	,	[Last_Name]		[dbo].[Name_Type]		NOT NULL
	,	[Status_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0	
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	CONSTRAINT [PK_Users_Users_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Users_Users_Username] UNIQUE ([Username])
);