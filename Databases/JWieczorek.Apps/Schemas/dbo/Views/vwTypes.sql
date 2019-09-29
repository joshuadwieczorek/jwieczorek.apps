CREATE VIEW [dbo].[vwTypes]
AS
SELECT		[K].[Keys_ID]
		,	[K].[Schema_Name]
		,	[K].[Key_Name]
		,	[V].[Value] AS [Key_Value]
		,	[K].[Key_Description]
		,	[V].[Description] AS [Value_Description]
FROM		[dbo].[Types_Values] [V] (NOLOCK)
OUTER APPLY	(
				SELECT	[ID] AS [Keys_ID]
					,	[Schema_Name] AS [Schema_Name]
					,	[Name] AS [Key_Name]
					,	[Description] AS [Key_Description]
				FROM	[dbo].[Types_Keys] (NOLOCK)
			) AS [K]