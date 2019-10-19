CREATE PROCEDURE [users].[Users_Read_Authorization]
(
	@UserID [dbo].[UUID_Type]
)
AS
BEGIN
	
	EXEC [users].[Users_Read] @UserID;

	EXEC  [users].[Email_Addresses_Read] @UserID=@UserID;
	
	EXEC [users].[Passwords_Read] @UserID=@UserID;

	EXEC [users].[Roles_Read_User] @UserID;

END