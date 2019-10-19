CREATE PROCEDURE [users].[Passwords_Create]
(
		@UserID [dbo].[UUID_Type]
	,	@Password VARCHAR(500)
	,	@CreatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN		

	BEGIN TRANSACTION;

	SET XACT_ABORT ON;

	BEGIN TRY

		SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

		UPDATE	[users].[Passwords]
			SET	[Is_Active] = 0
			,	[Status_Type] = 0
		WHERE	[User_ID] = @UserID
			AND	[Is_Active] = 1
			AND	[Status_Type] = 1;

		DECLARE @PasswordID [dbo].[UUID_Type] = NEWID();

		INSERT INTO [users].[Passwords]
		(
				[ID]
			,	[User_ID]		
			,	[Password]		
			,	[Is_Active]		
			,	[Status_Type]	
			,	[Created_By]	
			,	[Updated_By]	
			,	[Time_Created]	
			,	[Time_Updated]	
		)
		VALUES
		(
				@PasswordID
			,	@UserID
			,	@Password
			,	1
			,	1
			,	@CreatedBy
			,	@CreatedBy
			,	@DateTime
			,	@DateTime				
		);

		COMMIT;

		EXEC [users].[Passwords_Read] @PasswordID;

	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH

END