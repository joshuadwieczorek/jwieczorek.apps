CREATE FUNCTION [dbo].[fnDateTimeToUTC]
(
	@DateTime [dbo].[DateTime_Type]
)
RETURNS [dbo].[DateTime_Type]
AS
BEGIN
	RETURN DATEADD(SS,-1 * DATEDIFF(SS, GETUTCDATE(), GETDATE()), @DateTime);
END