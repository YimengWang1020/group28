
# group28: Cardiovascular Disease Prediction Model

## Overview

This R package contains a pre-trained XGBoost machine learning model for
predicting cardiovascular disease. It was developed as part of the
BIO215 Capstone Project.

## Installation

You can install the development version from GitHub with:

``` r
# install.packages("devtools")
devtools::install_github("Ruza0501/group28")
```

## Usage Example

Here is how to use the prediction function with sample data:

``` r
library(group28)

# 1. Create a dataframe with required biological features
# Note: Please pay attention to factor levels and types!
new_patient <- data.frame(
  age = 20000, 
  height = 165, 
  weight = 68, 
  ap_hi = 120, 
  ap_lo = 80,
  age_years = 54, 
  bmi = 24.9, 
  pulse_pressure = 40, 
  map = 93.3,
  hypertension = 0, # Must be integer (0 or 1)
  
  # Factors with specific levels
  gender = factor("male", levels = c("female", "male")),
  cholesterol = ordered("normal", levels = c("normal", "above_normal", "well_above_normal")),
  gluc = ordered("normal", levels = c("normal", "above_normal", "well_above_normal")),
  smoke = factor("no", levels = c("no", "yes")),
  alco = factor("no", levels = c("no", "yes")),
  active = factor("yes", levels = c("no", "yes")),
  bmi_class = factor("normal", levels = c("normal", "overweight", "obese", "other"))
)

# 2. Run prediction
result <- predict_group28(new_patient)
print(result)
```
