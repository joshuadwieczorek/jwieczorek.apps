CREATE PROCEDURE [users].[Users_Read_Profile]
(
		@UserID [dbo].[UUID_Type] = NULL
	,	@Username [dbo].[Name_Type] = NULL
)
AS
BEGIN
	
	IF(@UserID IS NULL)
		SELECT @UserID = [ID]	
			FROM [users] (NOLOCK)
				WHERE [Username] = @Username;

	-- Read the actual user.
	EXEC [users].[Users_Read] @UserID;

	-- Read user's email addresses.
	EXEC [users].[Email_Addresses_Read] NULL, @UserID, 1;

	-- Read user's phone numbers.
	EXEC [users].[Phone_Numbers_Read] NULL, @UserID, 1;

	-- Read user's addresses.
	EXEC [users].[Addresses_Read] NULL, @UserID, 1;

	-- Read user's extra profile meta.
	EXEC [users].[Meta_Read] @UserID, 1;

	-- Read user's roles.
	EXEC [users].[Roles_Read_User] @UserID;

	-- Read user's permissions.
	EXEC [users].[Permissions_Read_User] @UserID;

END