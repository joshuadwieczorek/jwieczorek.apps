CREATE PROCEDURE [users].[Roles_Read]
AS
BEGIN
	
	SELECT	[ID]			
		,	[Name]		
		,	[Status_Type]
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	FROM	[users].[Roles] (NOLOCK)
	WHERE	[Status_Type] <> 4
	ORDER BY [Name];

END