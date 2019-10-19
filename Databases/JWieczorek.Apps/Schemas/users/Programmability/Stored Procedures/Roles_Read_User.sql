CREATE PROCEDURE [users].[Roles_Read_User]
(
	@UserID [dbo].[UUID_Type]
)
AS
BEGIN

	SELECT		[RM].[User_ID]
			,	[RM].[Role_ID]
			,	[R].[Name] AS [Role_Name]
			,	[RM].[Created_By]
			,	[RM].[Updated_By]
			,	[RM].[Time_Created]
			,	[RM].[Time_Updated]
	FROM		[users].[Roles_Map] [RM] (NOLOCK)
		JOIN	[users].[Roles] [R] (NOLOCK)
			ON	[RM].[Role_ID] = [R].[ID]
	WHERE		[RM].[User_ID] = @UserID
		AND		[R].[Status_Type] <> 4
	ORDER BY [R].[Name]

END