CREATE PROCEDURE [users].[Email_Addresses_Change_Status]
(
		@EmailID [dbo].[UUID_Type]
	,	@StatusType [dbo].[Type_ID_Type]
	,	@UpdatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN
	
	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);
	
	UPDATE	[users].[Email_Addresses]
		SET	[Status_Type] = @StatusType
		,	[Updated_By] = @UpdatedBy
		,	[Time_Updated] = @DateTime
	WHERE	[ID] = @EmailID;

END