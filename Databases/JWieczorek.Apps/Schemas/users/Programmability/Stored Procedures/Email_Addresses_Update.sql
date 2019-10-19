CREATE PROCEDURE [users].[Email_Addresses_Update]
(
		@EmailID [dbo].[UUID_Type]
	,	@EmailAddress [dbo].[Email_Type] = NULL
	,	@IsPrimary BIT = NULL
	,	@EmailType [dbo].[Type_ID_Type] = NULL
	,	@UpdatedBy [dbo].[UUID_Type] = NULL
)
AS
BEGIN

	UPDATE	[users].[Email_Addresses] 
		SET	[Email_Address]	 = COALESCE(@EmailAddress, [Email_Address])
		,	[Is_Primary]	 = COALESCE(@IsPrimary, [Is_Primary])
		,	[Email_Type]	 = COALESCE(@EmailType, [Email_Type])
		,	[Updated_By]	 = COALESCE(@UpdatedBy, [Updated_By])
		,	[Time_Updated]	 = [dbo].[fnDateTimeToUTC](GETDATE())
	WHERE	[ID] = @EmailID;

	EXEC [users].[Email_Addresses_Read] @EmailID;

END