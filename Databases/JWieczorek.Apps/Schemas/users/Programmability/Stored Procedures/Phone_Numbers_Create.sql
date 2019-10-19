CREATE PROCEDURE [users].[Phone_Numbers_Create]
(
		@UserID [dbo].[UUID_Type]		
	,	@Number VARCHAR(30)				
	,	@Extension VARCHAR(15) = NULL	
	,	@CountryCode VARCHAR(10) = NULL
	,	@IsPrimary BIT = 1						
	,	@PhoneType [dbo].[Type_ID_Type] = 1	
	,	@StatusType [dbo].[Type_ID_Type] = 1
	,	@CreatedBy [dbo].[UUID_Type]	= NULL	
	,	@DateTime [dbo].[DateTime_Type] = NULL	
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	DECLARE @PhoneID [dbo].[UUID_Type] = NEWID();

	INSERT INTO [users].[Phone_Numbers]
	(
			[ID]			
		,	[User_ID]		
		,	[Number]	
		,	[Extension]	
		,	[Country_Code]	
		,	[Is_Primary]	
		,	[Phone_Type]	
		,	[Status_Type]	
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	)
	VALUES
	(
			@PhoneID
		,	@UserID
		,	@Number
		,	@Extension
		,	@CountryCode
		,	@IsPrimary
		,	@PhoneType
		,	@StatusType
		,	@CreatedBy
		,	@CreatedBy
		,	@DateTime
		,	@DateTime
	);

	EXEC [users].[Phone_Numbers_Read] @PhoneID;
	
END