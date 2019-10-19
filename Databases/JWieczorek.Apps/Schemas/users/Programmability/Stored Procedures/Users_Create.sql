CREATE PROCEDURE [users].[Users_Create]
(
		@Username [dbo].[Name_Type]
	,	@FirstName [dbo].[Name_Type]
	,	@LastName [dbo].[Name_Type]
	,	@StatusType [dbo].[Type_ID_Type]
	,	@CreatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	DECLARE @UserID [dbo].[UUID_Type] = NEWID();

	INSERT INTO [users].[Users]
	(
			[ID]
		,	[Username]		
		,	[First_Name]	
		,	[Last_Name]		
		,	[Status_Type]
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	)
	VALUES
	(
			@UserID
		,	@Username
		,	@FirstName
		,	@LastName
		,	@StatusType
		,	@CreatedBy
		,	@CreatedBy
		,	@DateTime
		,	@DateTime
	);

	EXEC [users].[Users_Read] @UserID;

END