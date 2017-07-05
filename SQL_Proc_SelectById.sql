
ALTER PROC [dbo].[Opportunity_SelectById]
			@Id int

AS

/* 		TEST CODE 

	Declare @Id int = 13;

	Execute dbo.Opportunity_SelectById @Id

*/

BEGIN

	SELECT 	o.Id
			,o.Name
			,Description
			,ContactPersonFirstName
			,ContactPersonLastName
			,Email
			,Phone
			,Address1
			,Address2
			,City
			,StateProvinceId
			,sp.StateProvinceCode
			,sp.Name StateName
			,PostalCode      
			,o.CountryId
			,c.Name CountryName
			,c.Code CountryCode
			,c.LongCode CountryLongCode
			,DateTimePickerStart
			,DateTimePickerEnd

			FROM dbo.Opportunity AS o
			LEFT JOIN StateProvince AS sp	ON o.StateProvinceId = sp.Id
			LEFT JOIN Country AS c			ON o.CountryId = c.Id
			WHERE o.Id = @Id

END

