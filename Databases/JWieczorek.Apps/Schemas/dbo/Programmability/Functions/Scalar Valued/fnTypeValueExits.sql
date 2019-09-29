CREATE FUNCTION [dbo].[fnTypeValueExits]
(
		@SchemaName [dbo].[Name_Type]
	,	@KeyName [dbo].[Name_Type]
	,	@Value [dbo].[Value_Type]
)
RETURNS BIT
AS
BEGIN
	
	DECLARE @Exists BIT = 0;

	SELECT @Exists = 1
		FROM [dbo].[vwTypes]
			WHERE [Schema_Name] = @SchemaName
				AND [Key_Name] = @KeyName
					AND [Key_Value] = @Value;

	RETURN @Exists;

END