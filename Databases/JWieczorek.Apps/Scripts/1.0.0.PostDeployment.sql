
EXEC [dbo].[Types_Create] 'users', 'status_type', '0', 'Statuses', 'Inactive';
EXEC [dbo].[Types_Create] 'users', 'status_type', '1', 'Statuses', 'Active';
EXEC [dbo].[Types_Create] 'users', 'status_type', '2', 'Statuses', 'Suspended';
EXEC [dbo].[Types_Create] 'users', 'status_type', '3', 'Statuses', 'Locked';
EXEC [dbo].[Types_Create] 'users', 'status_type', '4', 'Statuses', 'Deleted';
EXEC [dbo].[Types_Create] 'users', 'email_type', '0', 'Email Types', 'None';
EXEC [dbo].[Types_Create] 'users', 'email_type', '1', 'Email Types', 'Personal';
EXEC [dbo].[Types_Create] 'users', 'email_type', '2', 'Email Types', 'Work';
EXEC [dbo].[Types_Create] 'users', 'address_type', '0', 'Address Types', 'None';
EXEC [dbo].[Types_Create] 'users', 'address_type', '1', 'Address Types', 'Home';
EXEC [dbo].[Types_Create] 'users', 'address_type', '2', 'Address Types', 'Work';
EXEC [dbo].[Types_Create] 'users', 'phone_type', '0', 'Phone Types', 'None';
EXEC [dbo].[Types_Create] 'users', 'phone_type', '1', 'Phone Types', 'Home';
EXEC [dbo].[Types_Create] 'users', 'phone_type', '2', 'Phone Types', 'Mobile';
EXEC [dbo].[Types_Create] 'users', 'phone_type', '3', 'Phone Types', 'Work';




EXEC [users].[Roles_Create] 'Super Admin';
EXEC [users].[Roles_Create] 'User Admin';
EXEC [users].[Roles_Create] 'Admin';
EXEC [users].[Roles_Create] 'Customer Service';
EXEC [users].[Roles_Create] 'Subscriber';

EXEC [users].[Permissions_Create] 'user_create';
EXEC [users].[Permissions_Create] 'user_delete';
EXEC [users].[Permissions_Create] 'user_read';
EXEC [users].[Permissions_Create] 'user_update';


CREATE TABLE #RolesTable 
(
		[ID]			UNIQUEIDENTIFIER
	,	[Name]			VARCHAR(200)
	,	[Status_Type]	SMALLINT
	,	[Created_By]	UNIQUEIDENTIFIER
	,	[Updated_By]	UNIQUEIDENTIFIER
	,	[Time_Created]	DATETIME2(7)	
	,	[Time_Updated]	DATETIME2(7)	
);
INSERT INTO #RolesTable
EXEC [users].[Roles_Read];


CREATE TABLE #UsersTable 
(
		[ID]			UNIQUEIDENTIFIER		
	,	[Username]		VARCHAR(200)	
	,	[First_Name]	VARCHAR(200)
	,	[Last_Name]		VARCHAR(200)
	,	[Status_Type]	SMALLINT
	,	[Created_By]	UNIQUEIDENTIFIER		
	,	[Updated_By]	UNIQUEIDENTIFIER		
	,	[Time_Last_Login] DATETIME2(7)
	,	[Time_Created]	DATETIME2(7)
	,	[Time_Updated]	DATETIME2(7)	
);
INSERT INTO #UsersTable
EXEC [users].[Users_Create] 'SysAdmin', 'Systems', 'Administrator', 1;

INSERT INTO #UsersTable
EXEC [users].[Users_Create] 'useradmin', 'Bob', 'Jones', 1;

INSERT INTO #UsersTable
EXEC [users].[Users_Create] 'subscriber', 'Tim', 'Allen', 1;


DECLARE @UserID [dbo].[UUID_Type]
	,	@RolesTblVar [dbo].[UUID_Table_Type];

SELECT TOP 1 @UserID = [ID]
	FROM #UsersTable;


EXEC [users].[Email_Addresses_Create] @UserID, 'sysadmin@noemail.com', 1;


EXEC [users].[Passwords_Create] @UserID, 'zCAmF/h7QD/RyJamF6jUYVQI6zO5GQCG1UoT9xVCJyLptlOuUAra7PGDWTI1PWNhh4Tg6IxuYjSIXyu5TD3YJIofc/LYbyw7jITxPOctS6V87eOQqK+rleQAMu4nU5ng1Gso1h1EFP/hW7jP/bd7IVxGiy7LYUcOaRSQUhEM6bRBCjxdElizxhMXzud58UDp3+gz2YUarQ4sYDLWWoTC/4PBkUBpbliXJci8ZULI+jQDUq8p5wdAjTjR084vymZb7/jQ8ykOerw=';


INSERT INTO @RolesTblVar
SELECT [ID]
FROM #RolesTable
WHERE [Name] IN ('Super Admin', 'User Admin');


EXEC [users].[Roles_Sync] @UserID, @RolesTblVar;
