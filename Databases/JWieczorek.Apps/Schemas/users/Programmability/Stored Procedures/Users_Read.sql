CREATE PROCEDURE [users].[Users_Read]
(
		@UserID [dbo].[UUID_Type] = NULL
	,	@Username [dbo].[Name_Type] = NULL
)
AS
BEGIN

	SELECT	[ID]			
		,	[Username]		
		,	[First_Name]	
		,	[Last_Name]		
		,	[Status_Type]	
		,	[Created_By]	
		,	[Updated_By]
		,	[Time_Last_Login]
		,	[Time_Created]	
		,	[Time_Updated]	
	FROM	[users].[Users] (NOLOCK)
	WHERE	(
				(
					(
						@UserID IS NULL
						AND
						[Username] = @Username
					) OR (
						@Username IS NULL
						AND
						[ID] = @UserID
					)
				)
				OR
				(
					@UserID IS NULL
					AND 
					@Username IS NULL
				)
			)		
		AND	[Status_Type] <> 4;

END