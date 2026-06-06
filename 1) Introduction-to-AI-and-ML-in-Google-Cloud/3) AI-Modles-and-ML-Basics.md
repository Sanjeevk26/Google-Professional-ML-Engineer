# AI Models and Machine Learning Basics

## Overview

Before building machine learning models, it is important to understand the main categories of AI models and how they are used.

The key concepts are:

- Artificial Intelligence
- Machine Learning
- Deep Learning
- Generative AI
- Supervised Learning
- Unsupervised Learning
- Classification
- Regression
- Clustering
- Association
- Dimensionality Reduction

---

## Artificial Intelligence

Artificial Intelligence, or AI, is a broad term for computers or systems that mimic human intelligence.

Examples of AI applications:

- Robots
- Self-driving cars
- Intelligent assistants
- Recommendation systems
- Image recognition systems

Simple meaning:

> AI is the broad field of making computers perform tasks that normally require human intelligence.

---

## Machine Learning

Machine Learning, or ML, is a subset of AI.

It allows computers to learn from data without being explicitly programmed for every rule.

In traditional programming, humans write exact instructions for the computer.

In machine learning, the computer learns patterns from data and uses those patterns to make predictions or decisions.

Simple meaning:

> Machine learning allows computers to learn from data and improve their output over time.

---

## Deep Learning

Deep Learning is a subset of machine learning.

It uses deep neural networks with multiple layers between input data and output results.

These layers help the model learn more complex patterns.

Deep learning is commonly used in:

- Image recognition
- Speech recognition
- Natural language processing
- Generative AI
- Large language models

Simple meaning:

> Deep learning uses layered neural networks to learn complex patterns from data.

---

## Generative AI

Generative AI, or GenAI, creates content and performs tasks based on user requests.

It can generate:

- Text
- Images
- Code
- Videos
- Summaries
- Answers
- Reports

Generative AI uses foundation models such as large language models.

Large language models are a type of deep learning model that can predict, interpret, and interact with language.

Simple meaning:

> Generative AI creates new content and responds to user instructions using foundation models.

---

## Relationship Between AI, ML, Deep Learning, and GenAI

```text
Artificial Intelligence
└── Machine Learning
    └── Deep Learning
        └── Generative AI / Large Language Models
```

AI is the broadest concept.  
Machine learning is a subset of AI.  
Deep learning is a subset of machine learning.  
Generative AI often uses deep learning and foundation models.

---

## Supervised Learning

Supervised learning uses labeled data.

This means the training data already includes the correct answer or label.

Example:

A model is trained using pictures of cats and dogs where each image is already labeled as either `cat` or `dog`.

The model learns from these examples and can later classify a new image as a cat or dog.

Simple meaning:

> Supervised learning learns from data that already has answers.

---

## Characteristics of Supervised Learning

Supervised learning is:

- Based on labeled data
- Task-driven
- Used when the target or goal is known
- Used to predict categories or numbers

Common use cases:

- Predicting sales
- Classifying emails as spam or not spam
- Predicting customer spending
- Detecting whether an image contains a cat or dog
- Predicting customer churn

---

## Unsupervised Learning

Unsupervised learning uses unlabeled data.

This means the training data does not include the correct answer or label.

Example:

A model is given many dog pictures without breed labels. The model tries to identify patterns and group similar dogs together.

Simple meaning:

> Unsupervised learning finds hidden patterns in data without predefined answers.

---

## Characteristics of Unsupervised Learning

Unsupervised learning is:

- Based on unlabeled data
- Data-driven
- Used when the target or goal is not already defined
- Used to discover patterns, groups, or relationships

Common use cases:

- Customer segmentation
- Grouping similar products
- Finding hidden patterns in data
- Market basket analysis
- Reducing the number of features in a dataset

---

## Supervised vs Unsupervised Learning

| Supervised Learning | Unsupervised Learning |
|---|---|
| Uses labeled data | Uses unlabeled data |
| Learns from known answers | Finds hidden patterns |
| Task-driven | Data-driven |
| Goal is already defined | Goal is discovered from data |
| Example: cat vs dog classification | Example: grouping dog breeds |
| Used for classification and regression | Used for clustering, association, and dimensionality reduction |

---

## Types of Supervised Learning

There are two major types of supervised learning:

1. Classification
2. Regression

---

## Classification

Classification predicts a category or class.

Example:

Predicting whether an image is a cat or a dog.

The output is categorical.

Examples of categorical outputs:

- Cat or dog
- Spam or not spam
- Fraud or not fraud
- Pass or fail
- Churn or no churn

Common model:

- Logistic Regression

Simple meaning:

> Classification is used when the output is a category.

---

## Regression

Regression predicts a numeric value.

Example:

Forecasting product sales based on past sales data.

The output is continuous or numeric.

Examples of numeric outputs:

- Future sales amount
- Customer spending
- House price
- Revenue forecast
- Delivery time
- Temperature prediction

Common model:

- Linear Regression

Simple meaning:

> Regression is used when the output is a number.

---

## Classification vs Regression

| Classification | Regression |
|---|---|
| Predicts a category | Predicts a number |
| Output is discrete | Output is continuous |
| Example: cat or dog | Example: sales forecast |
| Common model: Logistic Regression | Common model: Linear Regression |

---

## Types of Unsupervised Learning

There are three major types of unsupervised learning:

1. Clustering
2. Association
3. Dimensionality Reduction

---

## Clustering

Clustering groups similar data points together.

Example:

Grouping customers into segments based on similar behavior or demographics.

Common use cases:

- Customer segmentation
- Product grouping
- User behavior grouping
- Market segmentation

Common model:

- K-means Clustering

Simple meaning:

> Clustering groups similar items together based on patterns in the data.

---

## Association

Association identifies relationships between items or events.

Example:

Finding that customers who buy coffee may also buy dessert.

This can help businesses place related products closer together or create promotions.

Common use cases:

- Market basket analysis
- Product recommendations
- Promotional planning
- Identifying product relationships

Common technique:

- Apriori Algorithm

Simple meaning:

> Association finds relationships between items in data.

---

## Dimensionality Reduction

Dimensionality reduction reduces the number of features or dimensions in a dataset.

It helps simplify the data while keeping important information.

Example:

Combining customer characteristics such as age, driving history, and car type into a simplified pattern for insurance quote calculation.

Common use cases:

- Improving model efficiency
- Reducing complexity
- Removing unnecessary features
- Preparing data for visualization
- Simplifying large datasets

Common technique:

- Principal Component Analysis, or PCA

Simple meaning:

> Dimensionality reduction reduces the number of features to make data easier and faster to use.

---

## Supervised Learning Example

Scenario:

Predict customer spending based on purchase history.

Question:

Is this supervised or unsupervised learning?

Answer:

This is supervised learning because the dataset includes labeled data, such as the amount customers have spent.

Question:

Is this classification or regression?

Answer:

This is a regression problem because the goal is to predict a continuous numeric value: future spending.

Question:

Which model should be used?

Answer:

Linear Regression should be used because it is suitable for regression problems.

---

## Unsupervised Learning Example

Scenario:

Identify customer segments using customer data.

Question:

Is this supervised or unsupervised learning?

Answer:

This is unsupervised learning because customers are not already labeled as belonging to specific segments.

The model needs to discover the underlying patterns by itself.

Question:

Is this clustering, association, or dimensionality reduction?

Answer:

This is a clustering problem because the goal is to group similar customers together.

Question:

Which model should be used?

Answer:

K-means Clustering can be used for customer segmentation.

---

## Model Selection Guide

| Problem Type | Learning Type | Output | Example Model |
|---|---|---|---|
| Classification | Supervised Learning | Category | Logistic Regression |
| Regression | Supervised Learning | Number | Linear Regression |
| Clustering | Unsupervised Learning | Groups or segments | K-means Clustering |
| Association | Unsupervised Learning | Relationships | Apriori |
| Dimensionality Reduction | Unsupervised Learning | Reduced features | PCA |

---

## Quick Decision Guide

### Use Classification when:

- The output is a category.
- Labels are available.
- The goal is to classify something.

Example:

- Is this email spam or not spam?
- Is this image a cat or dog?
- Will this customer churn or not?

---

### Use Regression when:

- The output is a number.
- Labels are available.
- The goal is to predict a continuous value.

Example:

- What will the sales amount be?
- How much will a customer spend?
- What will the house price be?

---

### Use Clustering when:

- Labels are not available.
- The goal is to group similar data points.

Example:

- Which customers are similar?
- What customer segments exist?
- Which products are commonly grouped together?

---

### Use Association when:

- The goal is to find relationships between items.

Example:

- Which products are bought together?
- What items should be promoted together?
- What product combinations are common?

---

### Use Dimensionality Reduction when:

- There are too many features.
- The model needs to be simplified.
- Efficiency needs to be improved.

Example:

- Reducing many customer attributes into fewer useful patterns.
- Simplifying a dataset before training a model.

---

## Key Takeaways

- AI is the broad field of computers mimicking human intelligence.
- Machine learning is a subset of AI where computers learn from data.
- Deep learning is a subset of ML that uses neural networks with multiple layers.
- Generative AI creates content and uses foundation models like large language models.
- Supervised learning uses labeled data.
- Unsupervised learning uses unlabeled data.
- Classification predicts categories.
- Regression predicts numeric values.
- Clustering groups similar data points.
- Association finds relationships between items.
- Dimensionality reduction reduces the number of features in a dataset.
- Logistic Regression is used for classification.
- Linear Regression is used for regression.
- K-means Clustering is used for clustering.
- Apriori is used for association problems.
- PCA is used for dimensionality reduction.

---

## Simple Summary

AI is the broad concept of machines performing intelligent tasks. Machine learning is a part of AI where systems learn from data instead of being explicitly programmed. Deep learning is a deeper form of machine learning that uses neural networks, and generative AI uses foundation models to create content and perform tasks.

Machine learning is mainly divided into supervised and unsupervised learning. Supervised learning uses labeled data and includes classification and regression. Unsupervised learning uses unlabeled data and includes clustering, association, and dimensionality reduction.

For model selection, classification is used for categories, regression is used for numbers, clustering is used for grouping, association is used for relationships, and dimensionality reduction is used to simplify data.
