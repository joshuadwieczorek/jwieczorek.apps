CREATE PROCEDURE [users].[Users_Create]
(
		@Username [dbo].[Name_Type]
	,	@FirstName [dbo].[Name_Type]
	,	@LastName [dbo].[Name_Type]
	,	@UserID [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	INSERT INTO [users].[Users]
	(
			[Username]		
		,	[First_Name]	
		,	[Last_Name]			
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	)
	VALUES
	(
			@Username
		,	@FirstName
		,	@LastName
		,	@UserID
		,	@UserID
		,	@DateTime
		,	@DateTime
	);

END