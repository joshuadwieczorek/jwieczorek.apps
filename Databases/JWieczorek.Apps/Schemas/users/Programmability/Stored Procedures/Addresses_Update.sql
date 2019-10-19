CREATE PROCEDURE [users].[Addresses_Update]
(
		@AddressID [dbo].[UUID_Type] 
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
	,	@UpdatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN
	
	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	UPDATE	[users].[Addresses] 
		SET	[Address_1] = COALESCE(@Address1, [Address_1])
		,	[Address_2] = COALESCE(@Address2, [Address_2])
		,	[Address_3] = COALESCE(@Address3, [Address_3])
		,	[City] = COALESCE(@City, [City])
		,	[State_ID] = COALESCE(@StateID, [State_ID])
		,	[Zip] = COALESCE(@Zip, [Zip])
		,	[Zip4] = COALESCE(@Zip4, [Zip4])
		,	[Country_ID] = COALESCE(@CountryID, [Country_ID])
		,	[Is_Primary] = COALESCE(@IsPrimary, [Is_Primary])
		,	[Address_Type] = COALESCE(@AddressType, [Address_Type])
		,	[Updated_By] = COALESCE(@UpdatedBy, [Updated_By])
		,	[Time_Updated] = @DateTime
	WHERE	[ID] = @AddressID;

	EXEC [users].[Addresses_Read] @AddressID;

END