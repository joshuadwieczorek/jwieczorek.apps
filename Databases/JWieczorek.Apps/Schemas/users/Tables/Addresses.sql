CREATE TABLE [users].[Addresses]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[User_ID]		[dbo].[UUID_Type]		NOT NULL
	,	[Address_1]		VARCHAR(200)			NULL
	,	[Address_2]		VARCHAR(200)			NULL
	,	[Address_3]		VARCHAR(200)			NULL
	,	[City]			VARCHAR(200)			NULL
	,	[State_ID]		[dbo].[UUID_Type]		NULL
	,	[Zip]			VARCHAR(5)				NULL
	,	[Zip4]			VARCHAR(4)				NULL
	,	[Country_ID]	[dbo].[UUID_Type]		NULL
	,	[Primary]		BIT						NOT NULL	DEFAULT 0
	,	[Address_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0	
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	CONSTRAINT [PK_Users_Addresses_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [FK_Users_Addresses_User_ID] FOREIGN KEY ([User_ID]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Addresses_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Addresses_Updated_By] FOREIGN KEY ([Updated_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Addresses_State_ID] FOREIGN KEY ([State_ID]) REFERENCES [geo].[Countries]([ID])
	,	CONSTRAINT [FK_Users_Addresses_Country_ID] FOREIGN KEY ([Country_ID]) REFERENCES [geo].[Countries]([ID])
);