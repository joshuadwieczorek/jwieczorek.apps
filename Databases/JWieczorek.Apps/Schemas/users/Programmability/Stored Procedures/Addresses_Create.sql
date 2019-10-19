CREATE PROCEDURE [users].[Addresses_Create]
(
		@UserID [dbo].[UUID_Type] 
	,	@Address1 VARCHAR(200)	
	,	@Address2 VARCHAR(200) = NULL
	,	@Address3 VARCHAR(200) = NULL
	,	@City VARCHAR(200)	
	,	@StateID [dbo].[UUID_Type]
	,	@Zip VARCHAR(20)		
	,	@Zip4 VARCHAR(4) = NULL
	,	@CountryID [dbo].[UUID_Type]	
	,	@IsPrimary BIT = 1
	,	@AddressType [dbo].[Type_ID_Type] = 1
	,	@StatusType [dbo].[Type_ID_Type] = 1
	,	@CreatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	DECLARE @AddressID [dbo].[UUID_Type] = NEWID();

	INSERT INTO [users].[Addresses]
	(
			[ID]		
		,	[User_ID]	
		,	[Address_1]	
		,	[Address_2]	
		,	[Address_3]	
		,	[City]		
		,	[State_ID]	
		,	[Zip]		
		,	[Zip4]		
		,	[Country_ID]
		,	[Is_Primary]
		,	[Address_Type]
		,	[Status_Type]
		,	[Created_By]
		,	[Updated_By]
		,	[Time_Created]
		,	[Time_Updated]
	)
	VALUES
	(
			@AddressID
		,	@UserID
		,	@Address1
		,	@Address2
		,	@Address3
		,	@City
		,	@StateID
		,	@Zip
		,	@Zip4
		,	@CountryID
		,	@IsPrimary
		,	@AddressType
		,	@StatusType
		,	@CreatedBy
		,	@CreatedBy
		,	@DateTime
		,	@DateTime
	);

	EXEC [users].[Addresses_Read] @AddressID;

END
