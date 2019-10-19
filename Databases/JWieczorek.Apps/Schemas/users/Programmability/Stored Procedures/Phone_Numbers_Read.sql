CREATE PROCEDURE [users].[Phone_Numbers_Read]
(
		@PhoneID [dbo].[UUID_Type] = NULL
	,	@UserID [dbo].[UUID_Type] = NULL
	,	@IsPrimary BIT = 1
)
AS
BEGIN
	
	SELECT	[ID]			
		,	[User_ID]		
		,	[Number]		
		,	[Extension]		
		,	[Country_Code]	
		,	[Is_Primary]	
		,	[Phone_Type]	
		,	[Status_Type]	
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	FROM	[users].[Phone_Numbers] (NOLOCK)
	WHERE	(
				(
					@PhoneID IS NOT NULL
					AND
					[ID] = @PhoneID
				) OR (
					@UserID IS NOT NULL
					AND
					[User_ID] = @UserID
					AND	[Is_Primary] = @IsPrimary
				)
			)
		AND	[Status_Type] <> 4;

END