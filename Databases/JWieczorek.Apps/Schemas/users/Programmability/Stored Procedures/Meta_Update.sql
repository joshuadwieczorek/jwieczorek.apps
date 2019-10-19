CREATE PROCEDURE [users].[Meta_Update]
(
		@UserID [dbo].[UUID_Type]
	,	@KeyName [dbo].[Name_Type]
	,	@Value [dbo].[Value_Type]
	,	@UpdatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);
	
	DECLARE @KeyID [dbo].[UUID_Type];

	SELECT @KeyID = [ID]
		FROM [users].[Meta_Keys] (NOLOCK)
			WHERE [Name] = @KeyName
				AND [Status_Type] <> 4;

	IF(@KeyID IS NOT NULL)
	BEGIN
		
		UPDATE	[users].[Meta_Values]
			SET	[Value] = @Value
			,	[Updated_By] = COALESCE(@UpdatedBy, [Updated_By])
			,	[Time_Updated] = @DateTime
		WHERE	[User_ID] = @UserID
			AND	[Key_ID] = @KeyID;

		EXEC [users].[Meta_Read] @UserID, 0;

	END
	ELSE
	BEGIN
		DECLARE @ErrorMessage NVARCHAR(MAX) = CONCAT('[users].[Meta_Create] -> invalid @KeyName=''', @KeyName, ''' parameter!');
		RAISERROR(@ErrorMessage, 16, 1);
	END

END