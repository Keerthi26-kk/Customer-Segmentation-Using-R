# Customer Segmentation using K-Means Clustering in R

##  Project Overview

This project performs customer segmentation on a retail dataset using unsupervised machine learning techniques, primarily **K-Means Clustering**. The objective is to identify distinct customer groups based on their purchasing behavior and demographics, enabling businesses to tailor marketing strategies and improve customer engagement.

##  Problem Statement

In the competitive retail sector, understanding customer segments is crucial for targeted marketing and personalization. This project groups customers based on their **Age**, **Annual Income**, and **Spending Score**, helping identify high-value customers, budget shoppers, and others.

##  Techniques Used

- **Data Preprocessing and Cleaning**
- **Feature Scaling**
- **K-Means Clustering**
- **Elbow Method to Determine Optimal Clusters**
- **Principal Component Analysis (PCA)**
- **Data Visualization using ggplot2**

##  Dataset Description

The dataset contains the following columns:

- `CustomerID` – Unique customer identifier
- `Gender` – Male or Female
- `Age` – Age of the customer
- `Annual Income (k$)` – Annual income in thousands of dollars
- `Spending Score (1-100)` – Score assigned by the mall based on customer behavior

> **Note:** The dataset file is named `css` and must be placed in the working directory.

##  Requirements

Install the following R packages before running the code:

```r
install.packages(c("dplyr", "ggplot2", "factoextra", "readr"))
