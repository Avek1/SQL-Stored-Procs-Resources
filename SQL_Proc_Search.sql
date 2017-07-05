
ALTER PROC [dbo].[Opportunity_Search]

		@SearchString NVARCHAR(1000) = ''
		,@CurrentPage INT = 1
		,@ItemsPerPage INT = 3
		,@BeginDate datetime2(7) = null
		,@EndDate datetime2(7) = null
		,@SortByColumn nvarchar(50) = 'Name' -- 'Name' or "DateTimePickerStart".
		,@Descending bit = 0 -- 0 means asc order. 


AS  

/*		TEST CODE

	DECLARE	@SearchString NVARCHAR(1000) = '.com'
			,@CurrentPage INT = 1
			,@ItemsPerPage INT = 5
			,@BeginDate datetime2(7) = '2017-05-06 12:01:59'
			,@EndDate datetime2(7) = '2017-05-08 13:03:23'
			,@SortByColumn nvarchar(50) = 'DateTimePickerStart'
			,@Descending bit = 1 

	EXEC	dbo.Opportunity_Search
			@SearchString
			,@CurrentPage
			,@ItemsPerPage
			,@BeginDate 
			,@EndDate 
			,@SortByColumn 
			,@Descending

*/

BEGIN

	SELECT	o.Id
			,o.Name
			,o.Description
			,o.ContactPersonFirstName
			,o.ContactPersonLastName
			,o.Email
			,o.Phone
			,o.Address1
			,o.Address2
			,o.City
			,o.StateProvinceId
			,sp.StateProvinceCode
			,sp.Name StateName
			,o.PostalCode
			,o.CountryId
			,c.Name CountryName
			,c.Code CountryCode
			,c.LongCode CountryLongCode
			,o.DateTimePickerStart
			,o.DateTimePickerEnd
			,COUNT(*) OVER () TotalRows
			FROM	dbo.Opportunity o
			LEFT JOIN StateProvince sp
				ON o.StateProvinceId = sp.Id
			LEFT JOIN Country c
				ON o.CountryId = c.Id
			WHERE (
					o.Name LIKE '%' + @SearchString + '%'
					OR o.Description LIKE '%' + @SearchString + '%'
					OR o.ContactPersonFirstName LIKE '%' + @SearchString + '%'
					OR o.ContactPersonLastName LIKE +  '%' + @SearchString + '%'
					OR o.Email LIKE +  '%' + @SearchString + '%'
					OR o.City LIKE +  '%' + @SearchString + '%'
					OR o.StateProvinceId LIKE +  '%' + @SearchString + '%'
					OR o.PostalCode LIKE +  '%' + @SearchString + '%'
					OR o.CountryId LIKE +  '%' + @SearchString + '%'  
					)
					AND (
						@BeginDate IS NULL OR @BeginDate < o.DateTimePickerEnd
						)
					AND (
						@EndDate IS NULL OR @EndDate >= o.DateTimePickerStart
						) 
		
			ORDER BY 	CASE WHEN
								@sortByColumn = 'Name' AND @Descending = 0 
								THEN o.Name END,
						CASE WHEN
								 @SortByColumn = 'Name' AND @Descending = 1
								THEN o.Name END DESC, 
						CASE WHEN
								 @SortByColumn = 'DateTimePickerStart' AND @Descending = 0 
								THEN o.DateTimePickerStart END,
						CASE WHEN
								 @SortByColumn = 'DateTimePickerStart' AND @Descending = 1 
								THEN o.DateTimePickerStart END DESC

			OFFSET @ItemsPerPage * (@CurrentPage - 1) ROWS
			FETCH NEXT @ItemsPerPage ROWS ONLY

END
