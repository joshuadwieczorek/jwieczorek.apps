CREATE PROCEDURE [users].[Addresses_Change_Status]
(
		@AddressID [dbo].[UUID_Type]
	,	@StatusType [dbo].[Type_ID_Type]
	,	@UpdatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);
	
	UPDATE	[users].[Addresses]
		SET	[Status_Type] = @StatusType
		,	[Updated_By] = @UpdatedBy
		,	[Time_Updated] = @DateTime
	WHERE	[ID] = @AddressID;

END