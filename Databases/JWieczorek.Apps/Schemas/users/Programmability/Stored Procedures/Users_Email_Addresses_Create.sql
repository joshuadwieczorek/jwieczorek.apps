CREATE PROCEDURE [users].[Users_Email_Addresses_Create]
(
		@EmailAddres [dbo].[Email_Type]
	,	@UserID [dbo].[UUID_Type]
	,	@EmailType [dbo].[Type_ID_Type] = 1
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	INSERT INTO [users].[Email_Addresses]
	(
			[User_ID]		
		,	[Email_Address]	
		,	[Email_Type]	
		,	[Status_Type]		
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	)
	VALUES
	(
			@UserID
		,	@EmailAddres
		,	1
		,	1
		,	@UserID
		,	@UserID
		,	@DateTime
		,	@DateTime
	);

END