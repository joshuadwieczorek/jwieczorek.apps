CREATE PROCEDURE [users].[Phone_Numbers_Update]
(
		@PhoneID [dbo].[UUID_Type]		
	,	@Number VARCHAR(30)				
	,	@Extension VARCHAR(15) = NULL	
	,	@CountryCode VARCHAR(10) = NULL
	,	@IsPrimary BIT = 1						
	,	@PhoneType [dbo].[Type_ID_Type] = 1	
	,	@UpdatedBy [dbo].[UUID_Type]	= NULL	
	,	@DateTime [dbo].[DateTime_Type] = NULL	
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	UPDATE	[users].[Phone_Numbers]
		SET	[Number] = COALESCE(@Number, [Number])
		,	[Extension] = COALESCE(@Extension, [Extension])
		,	[Country_Code] = COALESCE(@CountryCode, [Country_Code])
		,	[Is_Primary] = COALESCE(@IsPrimary, [Is_Primary])
		,	[Phone_Type] = COALESCE(@PhoneType, [Phone_Type])
		,	[Updated_By] = COALESCE(@UpdatedBy, [Updated_By])
		,	[Time_Updated] = COALESCE(@DateTime, [Time_Updated])
	WHERE	[ID] = @PhoneID;

	EXEC [users].[Phone_Numbers_Read] @PhoneID;

END