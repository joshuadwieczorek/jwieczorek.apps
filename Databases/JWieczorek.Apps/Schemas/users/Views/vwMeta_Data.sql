CREATE VIEW [users].[vwMeta_Data]
AS
SELECT		[U].[ID] AS [User_ID]
		,	[UMK].[Key_Name]
		,	[UMV].[Value] AS [Key_Value]
		,	[UMK].[In_Profile]
		,	[UMV].[Time_Created]
		,	[UMV].[Time_Updated]
FROM		[users].[Users] [U] (NOLOCK)
CROSS APPLY	(
				SELECT	[ID]
					,	[Name] AS [Key_Name]
					,	[In_Profile]
				FROM	[users].[Meta_Keys] (NOLOCK)
				WHERE	[Status_Type] <> 4
			) [UMK]
OUTER APPLY	(
				SELECT	[User_ID]
					,	[Value]
					,	[Time_Created]
					,	[Time_Updated]
				FROM	[users].[Meta_Values] (NOLOCK)
				WHERE	[Key_ID] = [UMK].[ID]
					AND	[User_ID] = [U].[ID]
			) [UMV];