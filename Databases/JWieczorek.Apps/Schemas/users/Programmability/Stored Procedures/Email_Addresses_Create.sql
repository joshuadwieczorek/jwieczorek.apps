CREATE PROCEDURE [users].[Email_Addresses_Create]
(
		@UserID [dbo].[UUID_Type]
	,	@EmailAddres [dbo].[Email_Type]
	,	@Primary BIT = 0
	,	@EmailType [dbo].[Type_ID_Type] = 1
	,	@CreatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	DECLARE @EmailID [dbo].[UUID_Type] = NEWID();

	INSERT INTO [users].[Email_Addresses]
	(
			[ID]
		,	[User_ID]		
		,	[Email_Address]	
		,	[Is_Primary]
		,	[Email_Type]	
		,	[Status_Type]		
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	)
	VALUES
	(
			@EmailID
		,	@UserID
		,	@EmailAddres
		,	@Primary
		,	1
		,	1
		,	@CreatedBy
		,	@CreatedBy
		,	@DateTime
		,	@DateTime
	);

	EXEC [users].[Email_Addresses_Read] @EmailID;

END