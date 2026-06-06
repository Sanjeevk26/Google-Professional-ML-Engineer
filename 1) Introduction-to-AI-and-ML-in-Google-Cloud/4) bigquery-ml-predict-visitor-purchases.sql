-- BigQuery ML: Predict Visitor Purchases
-- This SQL file contains the main queries used to create, evaluate,
-- and use a BigQuery ML model for predicting visitor transactions.

-- Replace PROJECT_ID with your actual Google Cloud project ID.
-- Example:
-- `qwiklabs-gcp-00-xxxxxxxx.bqml_lab.training_data`


-- =========================================================
-- Task 1: Explore and Prepare Training Data
-- =========================================================

-- This query creates a dataset for training the ML model.
-- The label column is created from totals.transactions:
-- 0 = visitor did not make a transaction
-- 1 = visitor made a transaction

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


-- After running the above query, save the result as a view:
-- Dataset: bqml_lab
-- View name: training_data


-- =========================================================
-- Task 2: Create a Logistic Regression Model
-- =========================================================

-- This query creates and trains a BigQuery ML model.
-- Logistic regression is used because the prediction is binary:
-- transaction or no transaction.

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


-- =========================================================
-- Task 3: Evaluate the Model
-- =========================================================

-- This query evaluates the trained model.
-- ML.EVALUATE returns model performance metrics such as
-- accuracy, precision, recall, F1 score, log loss, and ROC AUC.

SELECT
  *
FROM
  ML.EVALUATE(
    MODEL `PROJECT_ID.bqml_lab.sample_model`,
    TABLE `PROJECT_ID.bqml_lab.training_data`
  );


-- =========================================================
-- Task 4: Prepare July Data for Prediction
-- =========================================================

-- This query prepares new data for prediction.
-- It uses a later date range and includes fullVisitorId
-- to identify individual visitors.

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


-- After running the above query, save the result as a view:
-- Dataset: bqml_lab
-- View name: july_data


-- =========================================================
-- Task 5: Predict Purchases by Country
-- =========================================================

-- This query uses the trained model to predict purchases
-- from the July data.
-- ML.PREDICT applies the model to new data.
-- SUM(predicted_label) counts the predicted purchases.

SELECT
  country,
  SUM(predicted_label) AS total_predicted_purchases
FROM
  ML.PREDICT(
    MODEL `PROJECT_ID.bqml_lab.sample_model`,
    (
      SELECT
        *
      FROM
        `PROJECT_ID.bqml_lab.july_data`
    )
  )
GROUP BY
  country
ORDER BY
  total_predicted_purchases DESC
LIMIT 10;


-- =========================================================
-- Common Error Fix
-- =========================================================

-- Incorrect:
-- TOTAL(predicted_label)
--
-- Reason:
-- TOTAL() is not a valid aggregation function in BigQuery.
--
-- Correct:
-- SUM(predicted_label)
