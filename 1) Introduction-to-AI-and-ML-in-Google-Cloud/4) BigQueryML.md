# BigQuery ML: Predict Visitor Purchases

## Overview

BigQuery Machine Learning, or BigQuery ML, allows users to create, train, evaluate, and use machine learning models directly inside BigQuery using SQL.

The main benefit is that SQL users can build ML models without moving data out of BigQuery.

Simple meaning:

> BigQuery ML helps build machine learning models using SQL inside BigQuery.

---

## Goal

The goal is to use an ecommerce dataset to predict whether a website visitor will make a transaction.

The dataset contains Google Analytics records from the Google Merchandise Store.

The ML model will use visitor session data such as:

- Operating system
- Mobile device status
- Country
- Pageviews
- Transaction label

---

## What BigQuery ML Helps With

BigQuery ML can be used to:

- Create ML models
- Train models using SQL
- Evaluate model performance
- Make predictions
- Reduce data movement
- Help SQL practitioners work with ML faster

---

## Lab Dataset

The dataset used is a public Google Analytics sample dataset.

Dataset source:

```sql
bigquery-public-data.google_analytics_sample.ga_sessions_*
```

The data includes website session details such as:

- Visitor information
- Device information
- Country
- Pageviews
- Transaction details

---

## Main Workflow

The workflow includes four main tasks:

1. Explore and prepare the data
2. Create a machine learning model
3. Evaluate the model
4. Use the model to make predictions

---

## Task 1: Explore the Data

The first step is to inspect the Google Analytics data and prepare it for model training.

A SQL query is used to create training data.

```sql
SELECT
  IF(totals.transactions IS NULL, 0, 1) AS label,
  IFNULL(device.operatingSystem, "") AS os,
  device.isMobile AS is_mobile,
  IFNULL(geoNetwork.country, "") AS country,
  IFNULL(totals.pageviews, 0) AS pageviews
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20160801' AND '20170631'
LIMIT 10000;
```

---

## Query Explanation

This query prepares data for machine learning.

### Columns Used

| Column | Meaning |
|---|---|
| `label` | Whether the visitor made a transaction |
| `os` | Visitor operating system |
| `is_mobile` | Whether the visitor used a mobile device |
| `country` | Visitor country |
| `pageviews` | Number of pages viewed |

---

## Label Column

```sql
IF(totals.transactions IS NULL, 0, 1) AS label
```

This creates the target column for the model.

- `0` means the visitor did not make a transaction.
- `1` means the visitor made a transaction.

This is a binary classification problem because the output has two possible values.

---

## Handling Null Values

```sql
IFNULL(device.operatingSystem, "") AS os
IFNULL(geoNetwork.country, "") AS country
IFNULL(totals.pageviews, 0) AS pageviews
```

`IFNULL` is used to replace missing values.

Examples:

- Missing operating system becomes an empty string.
- Missing country becomes an empty string.
- Missing pageviews becomes `0`.

This helps avoid issues during model training.

---

## Training Data

The result of the query is saved as a view called:

```text
training_data
```

This view is later used to train the machine learning model.

---

## Task 2: Create a Model

The next step is to create a machine learning model using BigQuery ML.

The model is used to predict whether a visitor will make a transaction.

Model name:

```text
sample_model
```

Model type:

```text
LOGISTIC_REG
```

---

## Why Logistic Regression?

Logistic Regression is used because the problem is a binary classification problem.

The model predicts whether the visitor will:

- Make a transaction
- Not make a transaction

Simple meaning:

> Logistic Regression is used when the output is a category, especially yes/no or 0/1 type predictions.

---

## Model Creation Query

```sql
CREATE MODEL
  `PROJECT_ID.bqml_lab.sample_model`
OPTIONS (
  model_type = 'LOGISTIC_REG',
  input_label_cols = ['label']
) AS
SELECT
  label,
  os,
  is_mobile,
  country,
  pageviews
FROM
  `PROJECT_ID.bqml_lab.training_data`;
```

Replace `PROJECT_ID` with the actual project ID from the lab.

---

## Query Explanation

```sql
CREATE MODEL
```

Creates a new BigQuery ML model.

```sql
model_type = 'LOGISTIC_REG'
```

Specifies that the model type is Logistic Regression.

```sql
input_label_cols = ['label']
```

Defines the target column that the model should predict.

```sql
SELECT label, os, is_mobile, country, pageviews
```

Selects the training columns used by the model.

---

## Task 3: Evaluate the Model

After training the model, the next step is to evaluate its performance.

BigQuery ML provides the `ML.EVALUATE` function for this.

---

## Model Evaluation Query

```sql
SELECT
  *
FROM
  ML.EVALUATE(
    MODEL `PROJECT_ID.bqml_lab.sample_model`,
    TABLE `PROJECT_ID.bqml_lab.training_data`
  );
```

Replace `PROJECT_ID` with the actual project ID from the lab.

---

## What ML.EVALUATE Does

`ML.EVALUATE` checks how well the model performs.

It returns evaluation metrics such as:

- Accuracy
- Precision
- Recall
- F1 score
- Log loss
- ROC AUC

These metrics help understand whether the model is making useful predictions.

---

## Task 4: Use the Model

After evaluating the model, it can be used to make predictions.

In this task, July 2017 data is prepared and saved as a view called:

```text
july_data
```

---

## July Data Query

```sql
SELECT
  IF(totals.transactions IS NULL, 0, 1) AS label,
  IFNULL(device.operatingSystem, "") AS os,
  device.isMobile AS is_mobile,
  IFNULL(geoNetwork.country, "") AS country,
  IFNULL(totals.pageviews, 0) AS pageviews,
  fullVisitorId
FROM
  `bigquery-public-data.google_analytics_sample.ga_sessions_*`
WHERE
  _TABLE_SUFFIX BETWEEN '20170701' AND '20170801';
```

---

## July Data Explanation

This query is similar to the training data query, but it uses a different date range.

Date range:

```text
July 1, 2017 to August 1, 2017
```

Additional column:

```sql
fullVisitorId
```

This helps identify individual visitors.

---

## Making Predictions

BigQuery ML uses the `ML.PREDICT` function to make predictions.

The goal is to predict the top 10 countries with the highest expected purchases.

---

## Incorrect Query

```sql
SELECT
  country,
  TOTAL(predicted_label) as total_predicted_purchases
FROM
  ml.PREDICT(MODEL `bqml_lab.sample_model`, (
SELECT * FROM `bqml_lab.july_data`))
GROUP BY country
ORDER BY total_predicted_purchases DESC
LIMIT 10;
```

---

## Error

The query fails because:

```text
Function not found: TOTAL
```

Reason:

```text
TOTAL() is not a valid aggregation function in BigQuery SQL.
```

---

## Corrected Query

```sql
SELECT
  country,
  SUM(predicted_label) AS total_predicted_purchases
FROM
  ML.PREDICT(
    MODEL `bqml_lab.sample_model`,
    (
      SELECT *
      FROM `bqml_lab.july_data`
    )
  )
GROUP BY country
ORDER BY total_predicted_purchases DESC
LIMIT 10;
```

---

## Why SUM Is Used

`SUM(predicted_label)` is used to count the total predicted purchases.

Since `predicted_label` is usually `0` or `1`:

- `0` means no predicted purchase.
- `1` means predicted purchase.

Adding these values gives the total predicted purchases for each country.

---

## ML.PREDICT Explanation

```sql
ML.PREDICT
```

This function applies a trained BigQuery ML model to new data.

It returns prediction results based on the input data.

In this case, it predicts whether visitors from July data are likely to make transactions.

---

## Final Prediction Output

The final result shows:

- Country
- Total predicted purchases

The output is grouped by country and sorted from highest to lowest predicted purchases.

Only the top 10 countries are shown.

---

## Important BigQuery ML Functions

| Function | Purpose |
|---|---|
| `CREATE MODEL` | Creates and trains a machine learning model |
| `ML.EVALUATE` | Evaluates model performance |
| `ML.PREDICT` | Makes predictions using a trained model |

---

## Important SQL Concepts Used

| SQL Concept | Purpose |
|---|---|
| `IF` | Creates conditional values |
| `IFNULL` | Handles missing values |
| `CREATE MODEL` | Trains a BigQuery ML model |
| `OPTIONS` | Defines model settings |
| `GROUP BY` | Groups results by a column |
| `ORDER BY` | Sorts results |
| `LIMIT` | Limits number of rows returned |
| `SUM` | Adds numeric values |
| `ML.EVALUATE` | Evaluates the model |
| `ML.PREDICT` | Uses the model for predictions |

---

## Model Type Used

```text
Logistic Regression
```

Logistic Regression is used for classification problems.

In this case, the model predicts:

```text
Transaction or No Transaction
```

This makes it a binary classification problem.

---

## End-to-End Flow

```text
Explore data
    ↓
Create training_data view
    ↓
Create Logistic Regression model
    ↓
Evaluate model using ML.EVALUATE
    ↓
Create july_data view
    ↓
Use ML.PREDICT
    ↓
Predict top purchasing countries
```

---

