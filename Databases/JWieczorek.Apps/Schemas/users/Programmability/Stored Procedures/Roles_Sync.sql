CREATE PROCEDURE [users].[Roles_Sync]
(
		@UserID [dbo].[UUID_Type]
	,	@RoleIDs [dbo].[UUID_Table_Type] READONLY
	,	@UpdatedBy [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN
	
	BEGIN TRANSACTION;

	SET XACT_ABORT ON;

	BEGIN TRY

		DELETE FROM [users].[Roles_Map]
			WHERE [User_ID] = @UserID;

		SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

		INSERT INTO [users].[Roles_Map]
		(
				[Role_ID]		
			,	[User_ID]		
			,	[Created_By]	
			,	[Updated_By]	
			,	[Time_Created]	
			,	[Time_Updated]	
		)
		SELECT	[UUID]
			,	@UserID
			,	@UpdatedBy
			,	@UpdatedBy
			,	@DateTime
			,	@DateTime
		FROM	@RoleIDs;
		
		COMMIT;

		EXEC [users].[Roles_Read_User] @UserID;

	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH

END