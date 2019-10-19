CREATE PROCEDURE [users].[Roles_Create]
(
		@Name [dbo].[Name_Type]
	,	@CreatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

	INSERT INTO [users].[Roles]
	(
			[Name]			
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	)
	VALUES
	(
			@Name
		,	@CreatedBy
		,	@CreatedBy
		,	@DateTime
		,	@DateTime
	);

	EXEC [users].[Roles_Read];
	
END