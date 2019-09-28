CREATE TABLE [users].[Meta_Keys]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[Name]			[dbo].[Name_Type]		NOT NULL
	,	[In_Profile]	BIT						NOT NULL	DEFAULT 0
	,	[Status_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0	
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	CONSTRAINT [PK_Users_Meta_Keys_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [FK_Users_Meta_Keys_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Meta_Keys_Updated_By] FOREIGN KEY ([Updated_By]) REFERENCES [users].[Users]([ID])
);