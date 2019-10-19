CREATE PROCEDURE [users].[Meta_Keys_Read]
(
	@Name [dbo].[Name_Type] = NULL
)
AS
BEGIN
	
	SELECT	[ID]			
		,	[Name]			
		,	[In_Profile]	
		,	[Status_Type]	
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	FROM	[users].[Meta_Keys] (NOLOCK)
	WHERE	(
				(
					@Name IS NOT NULL 
					AND 
					[Name] = @Name
				)
				OR
					@Name IS NULL
			)
		AND	[Status_Type] <> 4;

END