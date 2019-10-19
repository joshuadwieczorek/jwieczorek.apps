CREATE PROCEDURE [users].[Permissions_Read_User]
(
	@UserID [dbo].[UUID_Type]
)
AS
BEGIN

	SELECT		[PM].[User_ID]
			,	[PM].[Permission_ID]
			,	[P].[Name] AS [Permission_Name]
			,	[PM].[Created_By]
			,	[PM].[Updated_By]
			,	[PM].[Time_Created]
			,	[PM].[Time_Updated]
	FROM		[users].[Permissions_Map] [PM] (NOLOCK)
		JOIN	[users].[Permissions] [P] (NOLOCK)
			ON	[PM].[Permission_ID] = [P].[ID]
	WHERE		[PM].[User_ID] = @UserID
		AND		[P].[Status_Type] <> 4
	ORDER BY [P].[Name]

END
