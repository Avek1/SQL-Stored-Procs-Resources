
ALTER PROC	[dbo].[Opportunity_Update]
			@Name nvarchar(50)
			,@Description nvarchar(500)
			,@ContactPersonFirstName nvarchar(50)
			,@ContactPersonLastName nvarchar(50)
			,@Email nvarchar(50)
			,@Phone nvarchar(50) = null
			,@Address1 nvarchar(50) = null
			,@Address2 nvarchar(50) = null
			,@City nvarchar(50) = null
			,@StateProvinceId int = null
			,@PostalCode nvarchar(10) = null
			,@CountryId int = null
			,@UserIdCreated nvarchar(128) = null
			,@DateTimePickerStart datetime2(7) = null
			,@DateTimePickerEnd datetime2(7) = null
			,@Id int

AS 


/*  	TEST CODE 

	Declare  @Name nvarchar(50) = 'Test Name A'
			,@Description nvarchar(500) = 'Test description.'
			,@ContactPersonFirstName nvarchar(50) = 'Test'
			,@ContactPersonLastName nvarchar(50) = 'Ting'
			,@Email nvarchar(50) = 'testing@gmail.com'
			,@Phone nvarchar(50) = '(818)-321-4321'
			,@Address1 nvarchar(50) = '662 Code Court'
			,@Address2 nvarchar(50) = NULL
			,@City nvarchar(50) = 'Pleasantville'
			,@StateProvinceId int = 1001
			,@PostalCode nvarchar(10) = 92001
			,@CountryId int = 2001
			,@UserIdCreated nvarchar(128) = '0001'
			,@DateTimePickerStart datetime2(7) = '1991-01-02 12:01:59'
			,@DateTimePickerEnd datetime2(7) = '1991-02-02 13:03:23'
			,@Id int = 22


	Select	*
	From	dbo.Opportunity
	Where	Id = @Id

	Execute dbo.Opportunity_Update
			@Name 
			,@Description 
			,@ContactPersonFirstName 
			,@ContactPersonLastName 
			,@Email 
			,@Phone 
			,@Address1 
			,@Address2 
			,@City 
			,@StateProvinceId 
			,@PostalCode 
			,@CountryId 
			,@UserIdCreated 
			,@DateTimePickerStart
			,@DateTimePickerEnd
			,@Id 


	Select	*
	From	dbo.Opportunity
	Where	Id = @Id

*/ 

BEGIN 

	Declare @datNow datetime2 = getutcdate();

	UPDATE		dbo.Opportunity
	SET        	Name = @Name 
				,Description = @Description
				,ContactPersonFirstName = @ContactPersonFirstName
				,ContactPersonLastName = @ContactPersonLastName
				,Email = @Email
				,Phone = @Phone
				,Address1 = @Address1
				,Address2 = @Address2
				,City = @City
				,StateProvinceId = @StateProvinceId
				,PostalCode = @PostalCode
				,CountryId = @CountryId
				,UserIdCreated = @UserIdCreated
				,DateTimePickerStart = @DateTimePickerStart
				,DateTimePickerEnd = @DateTimePickerEnd


	WHERE Id = @Id

END

