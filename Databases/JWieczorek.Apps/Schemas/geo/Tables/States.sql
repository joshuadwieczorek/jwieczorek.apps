CREATE TABLE [geo].[States]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[Country_ID]	[dbo].[UUID_Type]		NOT NULL
	,	[Name]			[dbo].[Name_Type]		NOT NULL
	,	[Status_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0	
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Lifetime_Start] [dbo].[DateTime_Type] GENERATED ALWAYS AS ROW START
	,	[Lifetime_End] [dbo].[DateTime_Type] GENERATED ALWAYS AS ROW END
	,	CONSTRAINT [PK_Geo_States_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [AK_Geo_States_Name] UNIQUE ([Name])
	,	CONSTRAINT [FK_Geo_States_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Geo_States_Updated_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Geo_States_Country_ID] FOREIGN KEY ([Country_ID]) REFERENCES [geo].[Countries]([ID])
	,	PERIOD FOR SYSTEM_TIME ([Lifetime_Start], [Lifetime_End])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [geo].[StatesHistory]));