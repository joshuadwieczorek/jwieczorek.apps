CREATE PROCEDURE [users].[Meta_Create]
(
		@UserID [dbo].[UUID_Type]
	,	@KeyName [dbo].[Name_Type]
	,	@Value [dbo].[Value_Type]
	,	@CreatedBy [dbo].[UUID_Type] = NULL
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
		
		INSERT INTO [users].[Meta_Values]
		(
				[User_ID]		
			,	[Key_ID]		
			,	[Value]			
			,	[Status_Type]	
			,	[Created_By]	
			,	[Updated_By]	
			,	[Time_Created]	
			,	[Time_Updated]	
		)
		VALUES
		(
				@UserID
			,	@KeyID
			,	@Value
			,	1
			,	@CreatedBy
			,	@CreatedBy
			,	@DateTime
			,	@DateTime
		);

		EXEC [users].[Meta_Read] @UserID, 0;

	END
	ELSE
	BEGIN
		DECLARE @ErrorMessage NVARCHAR(MAX) = CONCAT('[users].[Meta_Create] -> invalid @KeyName=''', @KeyName, ''' parameter!');
		RAISERROR(@ErrorMessage, 16, 1);
	END

END