CREATE PROCEDURE [users].[Meta_Read]
(
		@UserID [dbo].[UUID_Type]
	,	@InProfile BIT = 1
)
AS
BEGIN
	
	SELECT	[User_ID]
		,	[Key_Name]
		,	[Key_Value]
		,	[In_Profile]
		,	[Time_Created]
		,	[Time_Updated]
	FROM	[users].[vwMeta_Data]
	WHERE	[User_ID] = @UserID
		AND	[In_Profile] = @InProfile;

END