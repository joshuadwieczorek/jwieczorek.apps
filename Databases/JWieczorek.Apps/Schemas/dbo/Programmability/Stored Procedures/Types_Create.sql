CREATE PROCEDURE [dbo].[Types_Create]
(
		@SchemaName [dbo].[Name_Type]
	,	@KeyName [dbo].[Name_Type]
	,	@Value [dbo].[Value_Type]
	,	@KeyDescription [dbo].[Description_Type] = NULL
	,	@ValueDescription [dbo].[Description_Type] = NULL
	,	@UserID [dbo].[UUID_Type] = NULL
	,	@DateTime [dbo].[DateTime_Type] = NULL
)
AS
BEGIN

	BEGIN TRANSACTION;

	BEGIN TRY

		DECLARE @KeyID [dbo].[UUID_Type];
		
		SELECT @DateTime = [dbo].[fnDateTimeToUTC](@DateTime);

		SELECT @KeyID = [Key_ID] 
			FROM [dbo].[vwTypes]
				WHERE [Schema_Name] = @SchemaName
					AND [Key_Name] = @KeyName;

		IF(@KeyID IS NULL)
		BEGIN

			SELECT @KeyID = NEWID();
		
			INSERT INTO [dbo].[Types_Keys]
			(
					[ID]			
				,	[Schema_Name]	
				,	[Name]			
				,	[Description]	
				,	[Created_By]	
				,	[Updated_By]	
				,	[Time_Created]	
				,	[Time_Updated]	
			)
			VALUES
			(
					@KeyID
				,	@SchemaName
				,	@KeyName
				,	@KeyDescription
				,	@UserID
				,	@UserID
				,	@DateTime
				,	@DateTime
			);

		END

		INSERT INTO [dbo].[Types_Values]
		(
				[Key_ID]			
			,	[Value]				
			,	[Description]	
			,	[Created_By]	
			,	[Updated_By]	
			,	[Time_Created]	
			,	[Time_Updated]	
		)
		VALUES
		(
				@KeyID
			,	@Value
			,	@ValueDescription
			,	@UserID
			,	@UserID
			,	@DateTime
			,	@DateTime
		);

		COMMIT TRANSACTION;

	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH

END