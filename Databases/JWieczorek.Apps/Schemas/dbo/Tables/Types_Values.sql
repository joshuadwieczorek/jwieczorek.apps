CREATE TABLE [dbo].[Types_Values]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[Key_ID]		[dbo].[UUID_Type]		NOT NULL
	,	[Value]			[dbo].[Value_Type]		NOT NULL	
	,	[Description]	VARCHAR(1000)			NULL
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	CONSTRAINT [PK_Dbo_Types_Values_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Dbo_Types_Values_Key_ID] FOREIGN KEY ([Key_ID]) REFERENCES [dbo].[Types_Keys]([ID])
	,	CONSTRAINT [FK_Dbo_Types_Values_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Dbo_Types_Values_Updated_By] FOREIGN KEY ([Updated_By]) REFERENCES [users].[Users]([ID])
);