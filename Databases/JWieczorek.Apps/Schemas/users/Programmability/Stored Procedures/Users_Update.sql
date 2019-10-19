CREATE PROCEDURE [users].[Users_Update]
(
		@UserID [dbo].[UUID_Type]
	,	@Username [dbo].[Name_Type] = NULL
	,	@FirstName [dbo].[Name_Type] = NULL
	,	@LastName [dbo].[Name_Type] = NULL
	,	@LastLoginTime [dbo].[DateTime_Type] = NULL
	,	@UpdatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);
	
	UPDATE	[users].[Users]
		SET	[Username] = COALESCE(@Username, [Username])
		,	[First_Name] = COALESCE(@FirstName, [First_Name])
		,	[Last_Name] = COALESCE(@FirstName, [Last_Name])
		,	[Time_Last_Login] = COALESCE([dbo].[fnDateTimeToUTC](@LastLoginTime), [Time_Last_Login])
		,	[Updated_By] = COALESCE(@UpdatedBy, [Updated_By])
		,	[Time_Updated] = @DateTime
	WHERE	[ID] = @UserID;

	EXEC [users].[Users_Read] @UserID;

END