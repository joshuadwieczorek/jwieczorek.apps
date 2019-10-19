CREATE PROCEDURE [users].[Passwords_Read]
(		
		@PasswordID [dbo].[UUID_Type] = NULL
	,	@UserID [dbo].[UUID_Type] = NULL
	,	@IsActive BIT = 1
)
AS
BEGIN
	
	SELECT	[ID]			
		,	[User_ID]		
		,	[Password]		
		,	[Is_Active]		
		,	[Status_Type]	
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	FROM	[users].[Passwords] (NOLOCK)
	WHERE	(
				@PasswordID IS NOT NULL
				AND
				[ID] = @PasswordID
			)
		OR	(
				@UserID IS NOT NULL
				AND
				[User_ID] = @UserID
				AND	[Is_Active] = @IsActive
			);

END