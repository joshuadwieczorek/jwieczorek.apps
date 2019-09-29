CREATE TABLE [dbo].[Types_Keys]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[Schema_Name]	[dbo].[Name_Type]		NOT NULL
	,	[Name]			[dbo].[Name_Type]		NOT NULL
	,	[Description]	[dbo].[Description_Type] NULL
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	CONSTRAINT [PK_Dbo_Types_Keys_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Dbo_Types_Keys_Schema_Name_Name] UNIQUE ([Schema_Name], [Name])
	,	CONSTRAINT [FK_Dbo_Types_Keys_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Dbo_Types_Keys_Updated_By] FOREIGN KEY ([Updated_By]) REFERENCES [users].[Users]([ID])
);