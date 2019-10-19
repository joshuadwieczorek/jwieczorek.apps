CREATE TABLE [users].[Users]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[Username]		[dbo].[Name_Type]		NOT NULL
	,	[First_Name]	[dbo].[Name_Type]		NOT NULL
	,	[Last_Name]		[dbo].[Name_Type]		NOT NULL
	,	[Status_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0	
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Last_Login] [dbo].[DateTime_Type] NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Lifetime_Start] [dbo].[DateTime_Type] GENERATED ALWAYS AS ROW START
	,	[Lifetime_End] [dbo].[DateTime_Type] GENERATED ALWAYS AS ROW END
	,	CONSTRAINT [PK_Users_Users_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Users_Users_Username] UNIQUE ([Username])
	,	CONSTRAINT [CK_Users_Users_Status_Type] CHECK ([dbo].[fnTypeValueExits]('users', 'status_type', [Status_Type]) = 1)
	,	PERIOD FOR SYSTEM_TIME ([Lifetime_Start], [Lifetime_End])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [users].[UsersHistory])); 

GO

CREATE NONCLUSTERED INDEX [IX_Users_Users_ID] ON [users].[Users]([ID]) INCLUDE ([Username], [Status_Type], [First_Name], [Last_Name], [Created_By], [Updated_By], [Time_Last_Login], [Time_Created], [Time_Updated]);

GO

CREATE NONCLUSTERED INDEX [IX_Users_Users_Username] ON [users].[Users]([Username]) INCLUDE ([ID], [Status_Type], [First_Name], [Last_Name], [Created_By], [Updated_By], [Time_Last_Login], [Time_Created], [Time_Updated]);

GO

CREATE NONCLUSTERED INDEX [IX_Users_Users_Status_Type] ON [users].[Users]([Status_Type]) INCLUDE ([ID], [Username], [First_Name], [Last_Name], [Created_By], [Updated_By], [Time_Last_Login], [Time_Created], [Time_Updated]);