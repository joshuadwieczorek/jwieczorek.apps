CREATE PROCEDURE [users].[Email_Addresses_Read]
(
		@EmailID [dbo].[UUID_Type] = NULL
	,	@UserID [dbo].[UUID_Type] = NULL
	,	@IsPrimary BIT = 1
)
AS
BEGIN

	SELECT	[ID]			
		,	[User_ID]		
		,	[Email_Address]	
		,	[Is_Primary]		
		,	[Email_Type]	
		,	[Status_Type]	
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	FROM	[users].[Email_Addresses] (NOLOCK)
	WHERE	(
				(
					@EmailID IS NOT NULL
					AND
					[ID] = @EmailID
				) OR (
					@UserID IS NOT NULL
					AND
					[User_ID] = @UserID
					AND	
					[Is_Primary] = @IsPrimary
				)
			)
		AND	[Status_Type] <> 4;

END