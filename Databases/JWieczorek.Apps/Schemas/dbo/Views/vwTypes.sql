CREATE VIEW [dbo].[vwTypes]
AS
SELECT		[K].[Key_ID]
		,	[K].[Schema_Name]
		,	[K].[Key_Name]
		,	[V].[Value] AS [Key_Value]
		,	[K].[Key_Description]
		,	[V].[Description] AS [Value_Description]
FROM		[dbo].[Types_Values] [V] (NOLOCK)
CROSS APPLY	(
				SELECT	[ID] AS [Key_ID]
					,	[Schema_Name] AS [Schema_Name]
					,	[Name] AS [Key_Name]
					,	[Description] AS [Key_Description]
				FROM	[dbo].[Types_Keys] (NOLOCK)
				WHERE	[ID] = [V].[Key_ID]
			) AS [K]