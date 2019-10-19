CREATE TABLE [users].[Permissions_Map]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[Permission_ID]	[dbo].[UUID_Type]		NOT NULL
	,	[User_ID]		[dbo].[UUID_Type]		NOT NULL
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Lifetime_Start] [dbo].[DateTime_Type] GENERATED ALWAYS AS ROW START
	,	[Lifetime_End] [dbo].[DateTime_Type] GENERATED ALWAYS AS ROW END
	,	CONSTRAINT [PK_Users_Permissions_Map_ID] PRIMARY KEY ([Permission_ID], [User_ID])
	,	CONSTRAINT [PK_Users_Permissions_Map_Role_ID] FOREIGN KEY ([Permission_ID]) REFERENCES [users].[Permissions]([ID])
	,	CONSTRAINT [PK_Users_Permissions_Map_User_ID] FOREIGN KEY ([User_ID]) REFERENCES [users].[Users]([ID])
	,	PERIOD FOR SYSTEM_TIME ([Lifetime_Start], [Lifetime_End])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [users].[PermissionsMapHistory]));