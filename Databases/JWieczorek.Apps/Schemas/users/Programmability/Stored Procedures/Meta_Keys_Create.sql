CREATE PROCEDURE [users].[Meta_Keys_Create]
(
		@Name [dbo].[Name_Type]
	,	@InProfile BIT = 0
	,	@StatusType [dbo].[Type_ID_Type] = 1
	,	@CreatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	DECLARE @KeyID [dbo].[UUID_Type] = NEWID();

	INSERT INTO [users].[Meta_Keys]
	(
			[ID]			
		,	[Name]			
		,	[In_Profile]	
		,	[Status_Type]	
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	)
	VALUES
	(
			@KeyID
		,	@Name
		,	@InProfile
		,	@StatusType
		,	@CreatedBy
		,	@CreatedBy
		,	@DateTime
		,	@DateTime
	);

	EXEC [users].[Meta_Keys_Read];
	
END