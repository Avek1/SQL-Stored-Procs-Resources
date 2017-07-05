
ALTER PROC [dbo].[Opportunity_SelectAll]

AS

/* 		TEST CODE

	Execute dbo.Opportunity_SelectAll
				--@CurrentPage
				--,@ItemsPerPage
*/

BEGIN

	SELECT	o.Id
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
			,COUNT(*) OVER () TotalRows
			FROM dbo.Opportunity AS o
			LEFT JOIN StateProvince AS sp	ON o.StateProvinceId = sp.Id
			LEFT JOIN Country AS c	ON o.CountryId = c.Id
			ORDER BY o.Name

END

