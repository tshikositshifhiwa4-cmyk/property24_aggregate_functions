--CREATE TABLE property24_2 AS SELECT * FROM read_csv_auto ('property24');
Select * FROM property24_2; 

-- SECTION 1 – COUNT Aggregations (10 Questions)

-- 1. How many total properties are in the database?
SELECT COUNT(*) AS total_properties FROM property24_2;
-- 2. How many properties are listed in each province?
SELECT province, COUNT(*) AS property_count FROM property24_2 GROUP BY province;

-- 3. How many properties are listed in each city?
SELECT city, COUNT(*) AS property_count FROM property24_2 GROUP BY city;

-- 4. How many properties have more than 2 bedrooms?
SELECT COUNT(*) AS properties_with_more_than_2_bedrooms FROM property24_2 WHERE bedrooms > 2;

-- 5. How many properties have 2 or more bathrooms?
SELECT COUNT(*) AS properties_with_2_or_more_bathrooms FROM property24_2 WHERE bathrooms >= 2;

-- 6. How many properties have parking for at least 2 cars?
SELECT COUNT(*) AS properties_with_2_or_more_parking_spaces FROM property24_2 WHERE parking >= 2;
-- 7. How many properties are priced above R3,000,000?
SELECT COUNT(*) AS properties_above_R3M FROM property24_2 WHERE property_price > 3000000;

-- 8. How many properties are in Gauteng?
SELECT COUNT(*) AS properties_in_gauteng FROM property24_2 WHERE province = 'Gauteng';

-- 9. How many properties per province have floor size greater than 200?
SELECT province, COUNT(*) AS properties_with_floor_size_over_200 FROM property24_2 WHERE floor_size > 200 GROUP BY province;

-- 10. How many distinct provinces are in the table?
SELECT COUNT(DISTINCT province) AS distinct_provinces FROM property24_2;

-- SECTION 2 – SUM Aggregations (10 Questions)

-- 11. What is the total value of all properties combined?
SELECT SUM(property_price) AS total_property_value FROM property24_2;

-- 12. What is the total property value per province?
SELECT province, SUM(property_price) AS total_property_value_per_province FROM property24_2 GROUP BY province;

-- 13. What is the total property value per city?
SELECT city, SUM(property_price) AS total_property_value_per_city FROM property24_2 GROUP BY city;

-- 14. What is the total monthly repayment for all properties?
SELECT SUM(monthly_repayment) AS total_monthly_repayment FROM property24_2;

-- 15. What is the total monthly repayment per province?
SELECT province, SUM(monthly_repayment) AS total_monthly_repayment_per_province FROM property24_2 GROUP BY province;

-- 16. What is the total once-off cost for all properties?
SELECT SUM(Total_Once_off_Costs) AS total_once_off_cost FROM property24_2;

-- 17. What is the total once-off cost per province?
SELECT province, SUM(Total_Once_off_Costs) AS total_once_off_cost_per_province FROM property24_2 GROUP BY province;

-- 18. What is the total property value for Gauteng?
SELECT SUM(property_price) AS total_property_value_for_gauteng FROM property24_2 WHERE province = 'Gauteng';

-- 19. What is the total property value for properties priced above R4,000,000?
SELECT SUM(property_price) AS total_property_value_above_R4M FROM property24_2 WHERE property_price > 4000000;

-- 20. What is the total minimum gross monthly income required per province?
SELECT province, SUM(min_gross_monthly_income) AS total_minimum_gross_monthly_income_per_province FROM property24_2 GROUP BY province; 

-- SECTION 3 – AVG Aggregations (10 Questions)

-- 21. What is the average property price overall?
SELECT AVG(property_price) AS average_property_price FROM property24_2;

-- 22. What is the average property price per province?
SELECT province, AVG(property_price) AS average_property_price_per_province FROM property24_2 GROUP BY province;

-- 23. What is the average property price per city?
SELECT city, AVG(property_price) AS average_property_price_per_city FROM property24_2 GROUP BY city;

-- 24. What is the average number of bedrooms per province?
SELECT province, AVG(bedrooms) AS average_number_of_bedrooms_per_province FROM property24_2 GROUP BY province;

-- 25. What is the average number of bathrooms per province?
SELECT province, AVG(bathrooms) AS average_number_of_bathrooms_per_province FROM property24_2 GROUP BY province;

-- 26. What is the average floor size per province?
SELECT province, AVG(floor_size) AS average_floor_size_per_province FROM property24_2 GROUP BY province;

-- 27. What is the average monthly repayment per province?
SELECT province, AVG(monthly_repayment) AS average_monthly_repayment_per_province FROM property24_2 GROUP BY province;

-- 28. What is the average once-off cost per province?
SELECT province, AVG(Total_Once_off_Costs) AS average_once_off_cost_per_province FROM property24_2 GROUP BY province;

-- 29. What is the average minimum gross monthly income per province?
SELECT province, AVG(min_gross_monthly_income) AS average_minimum_gross_monthly_income_per_province FROM property24_2 GROUP BY province;

-- 30. What is the average property price for properties above R3,000,000?
SELECT AVG(property_price) AS average_property_price_above_R3M FROM property24_2 WHERE property_price > 3000000;

-- SECTION 4 – GROUP BY + Filtering (10 Questions)

-- 31. Which province has the highest average property price?
SELECT province, AVG(property_price) AS average_property_price FROM property24_2 GROUP BY province ORDER BY average_property_price DESC LIMIT 1;

-- 32. Which province has the lowest average property price?
SELECT province, AVG(property_price) AS average_property_price FROM property24_2 GROUP BY province ORDER BY average_property_price ASC LIMIT 1;

-- 33. Which city has the highest total property value?
SELECT city, SUM(property_price) AS total_property_value FROM property24_2 GROUP BY city ORDER BY total_property_value DESC LIMIT 1;

-- 34. Which city has the lowest average property price?
SELECT city, AVG(property_price) AS average_property_price FROM property24_2 GROUP BY city ORDER BY average_property_price ASC LIMIT 1;

-- 35. How many properties per province are priced above R2,000,000?
SELECT province, COUNT(*) AS number_of_properties_above_R2M FROM property24_2 WHERE property_price > 2000000 GROUP BY province;

-- 36. What is the average floor size per province for properties above R3,000,000?
SELECT province, AVG(floor_size) AS average_floor_size FROM property24_2 WHERE property_price > 3000000 GROUP BY province;

-- 37. What is the total property value per province for properties with 3 or more bedrooms?
SELECT province, SUM(property_price) AS total_property_value FROM property24_2 WHERE bedrooms >= 3 GROUP BY province;

-- 38. What is the average monthly repayment per province for properties above R4,000,000?
SELECT province, AVG(monthly_repayment) AS average_monthly_repayment FROM property24_2 WHERE property_price > 4000000 GROUP BY province;

-- 39. How many properties per city have parking for 2 or more cars?
SELECT city, COUNT(*) AS number_of_properties_with_parking_for_2_or_more_cars FROM property24_2 WHERE parking >= 2 GROUP BY city;

-- 40. What is the average minimum gross monthly income per province for properties above R5,000,000?
SELECT province, AVG(min_gross_monthly_income) AS average_minimum_gross_monthly_income FROM property24_2 WHERE property_price > 5000000 GROUP BY province;