CREATE FUNCTION [dbo].[fnDateTimeToUTC]
(
	@DateTime [dbo].[DateTime_Type] = NULL
)
RETURNS [dbo].[DateTime_Type]
AS
BEGIN

	DECLARE @OutDate [dbo].[DateTime_Type];
	
	IF(@DateTime IS NULL)
		SELECT @OutDate = GETDATE();
	ELSE
		SELECT @OutDate = @DateTime;
	
	RETURN DATEADD(SS, -1 * DATEDIFF(SS, GETUTCDATE(), GETDATE()), @OutDate);

END