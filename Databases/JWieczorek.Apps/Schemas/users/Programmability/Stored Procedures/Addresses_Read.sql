CREATE PROCEDURE [users].[Addresses_Read]
(
		@AddressID [dbo].[UUID_Type] = NULL
	,	@UserID [dbo].[UUID_Type] = NULL
	,	@IsPrimary BIT = 1
)
AS
BEGIN

	SELECT	[ID]			
		,	[User_ID]		
		,	[Address_1]		
		,	[Address_2]		
		,	[Address_3]		
		,	[City]			
		,	[State_ID]		
		,	[Zip]			
		,	[Zip4]			
		,	[Country_ID]	
		,	[Is_Primary]	
		,	[Address_Type]	
		,	[Status_Type]	
		,	[Created_By]	
		,	[Updated_By]	
		,	[Time_Created]	
		,	[Time_Updated]	
	FROM	[users].[Addresses] (NOLOCK)
	WHERE	(
				(
					@AddressID IS NOT NULL
					AND
					[ID] = @AddressID
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