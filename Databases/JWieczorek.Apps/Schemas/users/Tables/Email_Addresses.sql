﻿CREATE TABLE [users].[Email_Addresses]
(
		[ID]			[dbo].[UUID_Type]		NOT NULL	DEFAULT NEWID()
	,	[User_ID]		[dbo].[UUID_Type]		NOT NULL
	,	[Email_Address]	[dbo].[Email_Type]		NOT NULL
	,	[Is_Primary]	BIT						NOT NULL	DEFAULT 0
	,	[Email_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0
	,	[Status_Type]	[dbo].[Type_ID_Type]	NOT NULL	DEFAULT 0	
	,	[Created_By]	[dbo].[UUID_Type]		NULL
	,	[Updated_By]	[dbo].[UUID_Type]		NULL
	,	[Time_Created]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Time_Updated]	[dbo].[DateTime_Type]	NOT NULL	DEFAULT [dbo].[fnDateTimeToUTC](GETDATE())
	,	[Lifetime_Start] [dbo].[DateTime_Type] GENERATED ALWAYS AS ROW START
	,	[Lifetime_End] [dbo].[DateTime_Type] GENERATED ALWAYS AS ROW END
	,	CONSTRAINT [PK_Users_Email_Addresses_ID] PRIMARY KEY ([ID])
	,	CONSTRAINT [FK_Users_Email_Addresses_User_ID] FOREIGN KEY ([User_ID]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Email_Addresses_Created_By] FOREIGN KEY ([Created_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [FK_Users_Email_Addresses_Updated_By] FOREIGN KEY ([Updated_By]) REFERENCES [users].[Users]([ID])
	,	CONSTRAINT [AK_Users_Email_Addresses_Email_Address] UNIQUE ([Email_Address])
	,	CONSTRAINT [CK_Users_Email_Addresses_Status_Type] CHECK ([dbo].[fnTypeValueExits]('users', 'status_type', [Status_Type]) = 1)
	,	CONSTRAINT [CK_Users_Email_Addresses_Email_Type] CHECK ([dbo].[fnTypeValueExits]('users', 'email_type', [Email_Type]) = 1)
	,	PERIOD FOR SYSTEM_TIME ([Lifetime_Start], [Lifetime_End])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [users].[EmailAddressesHistory]));