
ALTER PROC [dbo].[Opportunity_Insert]

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
		,@UserIdCreated nvarchar(128)
		,@DateTimePickerStart datetime2(7) = null
		,@DateTimePickerEnd datetime2(7) = null
		,@Id int OUTPUT

AS 


/* 		TEST CODE

	Declare @Id int = 0;

	Declare @Name nvarchar(50) = 'Science Fair'
			,@Description nvarchar(500) = 'Fun'
			,@ContactPersonFirstName nvarchar(50) = 'Martin'
			,@ContactPersonLastName nvarchar(50) = 'McFly'
			,@Email nvarchar(50) = 'marty@mcfly.com'
			,@Phone nvarchar(50) = '(818)-555-1954'
			,@Address1 nvarchar(50) = 'Orange Blvd.'
			,@Address2 nvarchar(50) = NULL 
			,@City nvarchar(50) = 'Pasadena'
			,@StateProvinceId int = 9
			,@PostalCode nvarchar(10) = 91695
			,@CountryId int = 247
			,@UserIdCreated nvarchar(128) = '0008'
			,@DateTimePickerStart datetime2(7) = '1991-01-02 12:01:59'
			,@DateTimePickerEnd datetime2(7) = '1991-02-02 13:03:23'

	Execute dbo.Opportunity_Insert
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
			,@Id OUTPUT

			Select @Id

			Select	*
			From	dbo.Opportunity
			Where	Id = @Id

*/ 

BEGIN 

	INSERT INTO dbo.Opportunity
				(Name
				,Description
				,ContactPersonFirstName
				,ContactPersonLastName
				,Email
				,Phone
				,Address1
				,Address2
				,City
				,StateProvinceId
				,PostalCode
				,CountryId
				,UserIdCreated
				,DateTimePickerStart
				,DateTimePickerEnd)
		 VALUES
				(@Name 
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
				,@DateTimePickerEnd )

			   SET @Id = SCOPE_IDENTITY()
		   
END

