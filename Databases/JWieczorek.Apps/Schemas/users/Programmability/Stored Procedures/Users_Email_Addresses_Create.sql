CREATE PROCEDURE [users].[Users_Email_Addresses_Create]
(
		@EmailAddres [dbo].[Email_Type]
	,	@UserID [dbo].[UUID_Type]
	,	@EmailType [dbo].[Type_ID_Type] = 1
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	INSERT INTO [users].[Email_Addresses]
	(
			s
	)

END