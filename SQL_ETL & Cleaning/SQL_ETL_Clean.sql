CREATE DATABASE telecom_churn_db;
USE telecom_churn_db;

# =========== IMPORT/LOAD DATA VIA WIZARD >> As we have few tghousands of records (~6000 to 7000) =============

#===================== Check ================================
SELECT * FROM customer_raw_data;


# ======================= Summary Exploration ==============================

DESCRIBE customer_raw_data;

# ==== Making CustomerID primary  key >> 1) First change from TEXT (variable lenth tye) to FIXED type like VARCHAR.  2) Then to Primary key
ALTER TABLE customer_raw_data
MODIFY COLUMN Customer_ID VARCHAR(20) NOT NULL;

ALTER TABLE customer_raw_data
ADD PRIMARY KEY (Customer_ID);

# ==== Change datatype from  variable text to fixed varchar()
ALTER TABLE customer_raw_data
MODIFY COLUMN Value_Deal VARCHAR(20); # Null allowed

# ================================= CLEANING ==========================

# =========== Checking which column have NULL or empty space Entries
SELECT
	SUM(CASE WHEN Customer_ID IS NULL OR Customer_ID = "" THEN 1 ELSE 0 END) AS Customer_ID_Null_Count,
    SUM(CASE WHEN Gender IS NULL OR Gender = "" THEN 1 ELSE 0 END) AS Gender_Null_Count,
    SUM(CASE WHEN Age IS NULL OR Age = "" THEN 1 ELSE 0 END) AS Age_Null_Count,
    SUM(CASE WHEN Married IS NULL OR Married = "" THEN 1 ELSE 0 END) AS Married_Null_Count,
    SUM(CASE WHEN State IS NULL OR State = "" THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN Number_of_Referrals IS NULL  THEN 1 ELSE 0 END) AS Number_of_Referrals_Null_Count,  # NOT: OR Number_of_Referrals = "" BECAUSE IT has Numbers as entries and 0 is taken as ""
    SUM(CASE WHEN Tenure_in_Months IS NULL THEN 1 ELSE 0 END) AS Tenure_in_Months_Null_Count,
    SUM(CASE WHEN Value_Deal IS NULL OR Value_Deal = "" THEN 1 ELSE 0 END) AS Value_Deal_Null_Count,
    SUM(CASE WHEN Phone_Service IS NULL OR Phone_Service = "" THEN 1 ELSE 0 END) AS Phone_Service_Null_Count,
    SUM(CASE WHEN Multiple_Lines IS NULL OR Multiple_Lines = "" THEN 1 ELSE 0 END) AS Multiple_Lines_Null_Count,
    SUM(CASE WHEN Internet_Service IS NULL OR Internet_Service = "" THEN 1 ELSE 0 END) AS Internet_Service_Null_Count,
    SUM(CASE WHEN Internet_Type IS NULL OR Internet_Type = "" THEN 1 ELSE 0 END) AS Internet_Type_Null_Count,
    SUM(CASE WHEN Online_Security IS NULL OR Online_Security = "" THEN 1 ELSE 0 END) AS Online_Security_Null_Count,
    SUM(CASE WHEN Online_Backup IS NULL OR Online_Backup = "" THEN 1 ELSE 0 END) AS Online_Backup_Null_Count,
    SUM(CASE WHEN Device_Protection_Plan IS NULL OR Device_Protection_Plan = "" THEN 1 ELSE 0 END) AS Device_Protection_Plan_Null_Count,
    SUM(CASE WHEN Premium_Support IS NULL OR Premium_Support = "" THEN 1 ELSE 0 END) AS Premium_Support_Null_Count,
    SUM(CASE WHEN Streaming_TV IS NULL OR Streaming_TV = "" THEN 1 ELSE 0 END) AS Streaming_TV_Null_Count,
    SUM(CASE WHEN Streaming_Movies IS NULL OR Streaming_Movies = "" THEN 1 ELSE 0 END) AS Streaming_Movies_Null_Count,
    SUM(CASE WHEN Streaming_Music IS NULL OR Streaming_Music = "" THEN 1 ELSE 0 END) AS Streaming_Music_Null_Count,
    SUM(CASE WHEN Unlimited_Data IS NULL OR Unlimited_Data = "" THEN 1 ELSE 0 END) AS Unlimited_Data_Null_Count,
    SUM(CASE WHEN Contract IS NULL OR Contract = "" THEN 1 ELSE 0 END) AS Contract_Null_Count,
    SUM(CASE WHEN Paperless_Billing IS NULL OR Paperless_Billing = "" THEN 1 ELSE 0 END) AS Paperless_Billing_Null_Count,
    SUM(CASE WHEN Payment_Method IS NULL OR Payment_Method = "" THEN 1 ELSE 0 END) AS Payment_Method_Null_Count,
    SUM(CASE WHEN Monthly_Charge IS NULL THEN 1 ELSE 0 END) AS Monthly_Charge_Null_Count,
    SUM(CASE WHEN Total_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Charges_Null_Count,
    SUM(CASE WHEN Total_Refunds IS NULL THEN 1 ELSE 0 END) AS Total_Refunds_Null_Count,
    SUM(CASE WHEN Total_Extra_Data_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Extra_Data_Charges_Null_Count,
    SUM(CASE WHEN Total_Long_Distance_Charges IS NULL THEN 1 ELSE 0 END) AS Total_Long_Distance_Charges_Null_Count,
    SUM(CASE WHEN Total_Revenue IS NULL THEN 1 ELSE 0 END) AS Total_Revenue_Null_Count,
    SUM(CASE WHEN Customer_Status IS NULL OR Customer_Status = "" THEN 1 ELSE 0 END) AS Customer_Status_Null_Count,
    SUM(CASE WHEN Churn_Category IS NULL OR Churn_Category = "" THEN 1 ELSE 0 END) AS Churn_Category_Null_Count,
    SUM(CASE WHEN Churn_Reason IS NULL OR Churn_Reason = "" THEN 1 ELSE 0 END) AS Churn_Reason_Null_Count
FROM customer_raw_data;


SELECT * FROM customer_raw_data;

# ================== CREATE a NEW TABLE "Customer_Cleaned_Data" and INSERT CLEANED "Customer_raw_data" into that
CREATE TABLE customer_cleaned_Data AS
SELECT 
    Customer_ID,
    Gender,
    Age,
    Married,
    State,
    Number_of_Referrals, 
    Tenure_in_Months,
    COALESCE(NULLIF(Value_Deal,""), 'None') AS Value_Deal, # NULLIF(Value_Deal,"")  -> NULLIF(exp1,"") : returns NULL if exp1 = exp2  , so NULLIF(Value_Deal,"") returns NULL when there is empty space "" and COALESCE) will replace NULL with None
    Phone_Service,
    COALESCE(NULLIF(Multiple_Lines,""), 'Unknown') As Multiple_Lines,
    Internet_Service,
    COALESCE(NULLIF(Internet_Type,""), 'None') AS Internet_Type,
    COALESCE(NULLIF(Online_Security,""), 'Unknown') AS Online_Security,
    COALESCE(NULLIF(Online_Backup,""), 'Unknown') AS Online_Backup,
    COALESCE(NULLIF(Device_Protection_Plan,""), 'Unknown') AS Device_Protection_Plan,
    COALESCE(NULLIF(Premium_Support,""), 'Unknown') AS Premium_Support,
    COALESCE(NULLIF(Streaming_TV,""), 'Unknown') AS Streaming_TV,
    COALESCE(NULLIF(Streaming_Movies,""), 'Unknown') AS Streaming_Movies,
    COALESCE(NULLIF(Streaming_Music,""), 'Unknown') AS Streaming_Music,
    COALESCE(NULLIF(Unlimited_Data,""), 'Unknown') AS Unlimited_Data,
    Contract,
    Paperless_Billing,
    Payment_Method,
    Monthly_Charge,
    Total_Charges,
    Total_Refunds,
    Total_Extra_Data_Charges,
    Total_Long_Distance_Charges,
    Total_Revenue,
    Customer_Status,
    COALESCE(NULLIF(Churn_Category,""), 'Other') AS Churn_Category,
    COALESCE(NULLIF(Churn_Reason,""),'Other') AS Churn_Reason
FROM customer_raw_data;

# === Checking reasons and category correspponding to  customer_status
SELECT DISTINCT Customer_Status, Churn_Category
FROM customer_cleaned_data;


#============= Change Churn_Category & Churn_Reason From "Other" to "Stayed Customer" & "New Joiner"
UPDATE customer_cleaned_data
SET Churn_Category = "Stayed Customer"
WHERE Customer_Status = "Stayed";

UPDATE customer_cleaned_data
SET Churn_Category = "New Joined"
WHERE Customer_Status = "Joined";
    
    
UPDATE customer_cleaned_data
SET Churn_Reason = "Stayed Customer"
WHERE Customer_Status = "Stayed";

UPDATE customer_cleaned_data
SET Churn_Reason = "New Joined"
WHERE Customer_Status = "Joined";
    
# ====================== Explore Distributions from Cleaned DATA ========================
 
# ====== Gender Distribution --- After RUnning Query >> Majority Customers are Females
SELECT Gender, COUNT(*) AS count, ROUND(COUNT(*) / (SELECT COUNT(*) AS total FROM customer_raw_data) * 100 ,2) AS pct_distribution
FROM customer_cleaned_data
GROUP BY Gender;

# ====== Marital Status Distribution --- After Running Query >> There is equal composition of married & unmarried customers
SELECT Married, COUNT(*) AS count, ROUND(COUNT(*) / (SELECT COUNT(*) AS total FROM customer_raw_data) * 100 ,2) AS pct_distribution
FROM customer_cleaned_data
GROUP BY Married;


# ====== Contract Based Distribution --- Most customers take service Month-to_Month basis followed by 2 month and 1 month contract.
SELECT Contract, COUNT(*) AS count, ROUND(COUNT(*) / (SELECT COUNT(*) AS total FROM customer_raw_data) * 100 ,2) AS pct_distribution
FROM customer_cleaned_data
GROUP BY Contract
ORDER BY count DESC;

# =========== IMPORTANT : Distribution Based On Customer Status >> 66% is retention rate, 27% Churn rate and 6.5% are new joinees
SELECT Customer_Status, COUNT(*) AS count, ROUND(SUM(Total_Revenue),2) AS Revenue,
ROUND(COUNT(*) / (SELECT COUNT(*) AS total FROM customer_raw_data) * 100 ,2) AS pct_distribution
FROM customer_cleaned_data
GROUP BY Customer_Status
ORDER BY count DESC;

# ====== # ====== State wise customer Distribution >> top 10 states with max customers
SELECT State, COUNT(State) As Total_Customers,
ROUND(COUNT(*) / (SELECT COUNT(*) AS total FROM customer_raw_data) * 100 ,2) AS pct_distribution
FROM customer_cleaned_data
GROUP BY State
ORDER BY Total_Customers DESC
LIMIT 10;



# ====================================================================================
# ============= Creating Seperate Views for Churn Data (Stayed, Churned) and New Joinees : This we use while implementing ML prediction model ======================
CREATE VIEW vw_ChurnData AS
SELECT * FROM customer_cleaned_data 
WHERE Customer_Status IN ("Churned", "Stayed");

CREATE VIEW vw_JoinData AS
SELECT * FROM customer_cleaned_data 
WHERE Customer_Status = "Joined";

