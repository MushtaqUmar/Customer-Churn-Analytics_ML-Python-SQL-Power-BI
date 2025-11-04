# Customer-Churn-Analytics | Machine Learning, Python, SQL/MySQL, Power-BI
**A full-stack analytics project** that analyses telecom customer data to understand drivers of churn and predict which customers are likely to churn using a **Random Forest Classifier**.  
Combines **ETL (MySQL)**, **Descriptive Dashboards (Power BI)**, and **Predictive Modelling (Python)**.

---

## **Table of Contents**
1. [Overview](#overview)
2. [Problem Solving Objectives](#problem-solving-objectives)
3. [About the Data](#about-the-data)
4. [Tools & Technology Used](#tools--technology-used)
5. [Repository Structure](#repository-structure)
6. [What I did — Step by step](#what-i-did--step-by-step)
7. [Key Insights (summary)](#key-insights-summary)
8. [Key Recommendations (actionable)](#key-recommendations-actionable)
9. [How to reproduce / run locally](#how-to-reproduce--run-locally)
10. [Dasboard Preview](#dashboard-preview)
11. [Author / Contact](#author--contact)

---

## **Overview**
This project performs end-to-end analytics on a telecom customer dataset to (a) describe and diagnose drivers of churn, and (b) build a predictive model (Random Forest) to score new customers for churn risk. Results are surfaced in Power BI dashboards for business stakeholders and exported model predictions are integrated back into the analytics pipeline.

---

## **Problem Solving Objectives**
- Identify which customer segments have higher churn risk (demographics, geography, services, contracts, billing patterns).
- Quantify the relationship between features (e.g., tenure, contract type, internet type, monthly charges) and churn.
- Build a machine learning model to predict future churners and integrate predictions into a dashboard for operational use.
- Provide actionable recommendations to reduce churn and increase customer lifetime value.
  
---

## **About the Data**
**Columns included (key features):**
- Customer_ID, Gender, Age, Married, State, Number_of_Referrals, Tenure_in_Months, Value_Deal
- Service features: Phone_Service, Multiple_Lines, Internet_Service, Internet_Type, Online_Security, Online_Backup, Device_Protection_Plan, Premium_Support, Streaming_TV, Streaming_Movies, Streaming_Music, Unlimited_Data
- Billing & charges: Contract, Paperless_Billing, Payment_Method, Monthly_Charge, Total_Charges, Total_Refunds, Total_Extra_Data_Charges, Total_Long_Distance_Charges, Total_Revenue
- Target / outcome fields: Customer_Status (Churned/Stayed/New joinee), Churn_Category, Churn_Reason

**Notes on the dataset:**
- Contains both categorical and numerical features.
- Tenure_in_Months used to measure loyalty; Contract encodes term length.
- Services : Columns that shows whether customer has subscribed particular service like Streaming, Internet_Service, Permium_Support etc.
- Churn_Category / Churn_Reason used for diagnostic insights and labeling.

---

## **Tools & Technology Used**
- **Database & ETL:** MySQL (local) — schema creation, raw data import, cleaning views, prepared tables.
- **Data Wrangling & Modelling:** SQL, Python (pandas, numpy), scikit-learn (RandomForestClassifier).
- **Analytics & Visualization:** Power BI — descriptive dashboards for executive summary of current customers, slicers/filters, and a dedicated predictive dashboard page for ML output.
- **Other:** Jupyter Notebook (analysis & modelling), Git/GitHub for version control, MS word for insights and recommendation.

---

## **Repository Structure**
<pre>
Customer-Churn-Analytics_ML-Python-SQL-Power-BI/
├─ Dataset/
│ ├─ Customer_Data/ # original raw CSV files
│ ├─ customer_cleaned_data/ # cleaned CSVs exported from MySQL
| ├─ Prediction Data
    ├─ New_Joinees_Prediction/ # New Customers Data that we used to predict Churners using ML model
  
├─ SQL_ETL & Cleaning/
│ ├─ SQL_ETL_Clean.sql # SQL to create database, tables, Views, Cleaning and Exploration Queries I used

├─ ML Prediction Model/
│ ├─ ML Churn Prediction Model.ipynb/ # Machine Learning Model

├─ Live Dashboards/
│ ├─ Insights & Predictions Dashboard.pbix # Power BI file - Dashboard for Executive Summary/Insights for Current Customers and Predictive Insights about Future Churners predicted my ML model
  
├─ Images/ Images that I used in Power BI Dashboarding

├─ Insights & Recommendations
│ ├─ Summarised Insights.docx/ # Summarising insights extracted through the process
│ ├─  Some Recommendations.docx/ # Recommendation based on insights to increase retention rate and decrease churn rate.
</pre>

---

## **What I did — Step by step**

### **1️⃣ ETL / Data Engineering (MySQL)**
- Created database & schema; imported raw CSV data.  
- Cleaned data (handled NULLs, data types, and duplicates).  
- Created a **cleaned view** (`customer_cleaned_data`) for analytics and ML.  

### **2️⃣ Descriptive & Diagnostic Analytics (Power BI + SQL)**
- Connected Power BI directly to MySQL database.  
- Created measures using DAX: *Churn Rate*, *Retained Customers*, *New Joiners*, etc.  
- Developed dashboards:
  - **Churn Analytics:** Executive Summary about current customers using KPI cards, charts, graphs, tables, filters and slicers etc
  - **Predicted Future Churners (ML Output)**
- Added filters/slicers for deep exploration (Demographic based, Churn Category, Monthly Charge).  

### **3️⃣ Predictive Analytics (Python / ML scikit-learn)**
- **Feature Engineering:** removed IDs, encoded categoricals, normalized numericals.  
- **Data Split:** 80% Train / 20% Test.  
- **Model:** Trained **Random Forest Classifier** with hyperparameter tuning.  
- **Evaluation Metrics:** Accuracy, Precision, Recall, F1-score.  
- Saved trained model and integrated predictions back into MySQL for visualization.

### **4️⃣ Power BI Integration**
- Imported predicted churners and visualized:  
  - Future churners with detailed visuals around Customer Demographics, Contract & Tenure, Geographic Belonging, Internet Type Usage etc
The steps are grouped by three phases: ETL (data engineering), Analytics (descriptive & diagnostic), and Predictive (modelling & deployment).

### **Insights Documentation & Recommendations** 

Compiled top insights in a separate document along with recommendations to increase retention rate and decrease churn rate.

---

## **Key Insights (summary)**
[📄 Click to Insights file](Insights%20%26%20Recommendations/Some%20Recommendations.docx)

---

## **Key Recommendations (actionable)**
[📄 Click to Recommendations file](Some%20Recommendations/Some%20Recommendations.docx)

---

## **How to Reproduce / Run Locally**
1. Clone the repository
2. Save the data & ETL On Database server like MySQL DB. Run SQL Queries to clean, explore etc
3. Load the cleaned dataset into Power BI, make sure to have proper connection and naming of dataset
4. Open the Jupyter notebook and run all cells for ML model with correct credentials of database or data path
5- Save Predictions (By ML) and Load into Power BI for visualization.
6 - You can document insights and generate recommedations by properly understanding business problem and insights.

---

## **Dasboard Preview**
- **Dashboard 1 Preview: Churn Customers Summary Insights:**
![Dashboard 1 Preview: Churn Customers Summary Insights:](Demo%20Dashboards/Churn_Summary_Preview.png)

- **Dashboard 2 Preview: Predicted Churners Insights:**
![Dashboard 2 Preview: Predicted Churners Insights:](Demo%20Dashboards/Prediction_Churners_Preview.png)
  

---

## **Author / Contact**
  - <p><strong>Author:</strong> Umar — Data Analyst & Aspiring Data Scientist</p>
  - <a href="mailto:umarofficial073@gmail.com">Email</a> <br>
  - <a href="https://www.linkedin.com/in/hereumar/">LinkedIn</a> <br>
  - <a href="https://mushtaqumar.github.io/JS-Personal-Portfolio/">Portfolio</a>
