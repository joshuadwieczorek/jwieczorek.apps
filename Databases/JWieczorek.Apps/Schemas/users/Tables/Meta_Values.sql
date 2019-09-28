CREATE TABLE [users].[Meta_Values]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[User_ID]		[dbo].[UUID_Type]		NOT NULL
	,	[Key_ID]		[dbo].[UUID_Type]		NOT NULL
	,	[Value]			[dbo].[Value_Type]		NOT NULL
	,	[Status_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0	
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	CONSTRAINT [PK_Users_Meta_Values_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [FK_Users_Meta_Values_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Meta_Values_Updated_By] FOREIGN KEY ([Updated_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Meta_Values_User_ID] FOREIGN KEY ([User_ID]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Meta_Values_Key_ID] FOREIGN KEY ([Key_ID]) REFERENCES [users].[Meta_Keys]([ID])
);