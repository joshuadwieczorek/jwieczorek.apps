CREATE PROCEDURE [users].[Phone_Numbers_Change_Status]
(
		@PhoneID [dbo].[UUID_Type]
	,	@StatusType [dbo].[Type_ID_Type]
	,	@UpdatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN
	
	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	UPDATE	[users].[Phone_Numbers]
		SET	[Status_Type] = @StatusType
		,	[Updated_By] = @UpdatedBy
		,	[Time_Updated] = @DateTime
	WHERE	[ID] = @PhoneID;

END