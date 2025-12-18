#' Group 28 Prediction Model
#'
#' This function accepts a dataframe of biological features and returns
#' the prediction outcome using a pre-trained XGBoost workflow.
#'
#' @details
#' The input dataframe must contain specific columns with correct data types:
#' \itemize{
#'   \item Categorical columns (gender, smoke, alco, active, bmi_class) should be factors.
#'   \item Ordered factors (cholesterol, gluc) must be ordered factor types.
#'   \item Hypertension must be an integer (0 or 1).
#' }
#'
#' @param new_data A data.frame containing the required feature columns.
#' @return A tibble containing the predicted class (e.g., "disease" or "no_disease").
#'
#' @author
#' Zihao Wang \email{Zihao.Wang2302@student.xjtlu.edu.cn}
#'
#' @import workflows
#' @import parsnip
#' @import xgboost
#' @importFrom stats predict
#' @export
#'
#' @examples
#' \dontrun{
#'   library(group28)
#'   # Create example data
#'   test_data <- data.frame(
#'     age = 20000, height = 165, weight = 68, ap_hi = 120, ap_lo = 80,
#'     age_years = 54, bmi = 24.9, pulse_pressure = 40, map = 93.3,
#'     hypertension = 0, # Integer
#'     gender = factor("male", levels = c("female", "male")),
#'     cholesterol = ordered("normal", levels = c("normal", "above_normal", "well_above_normal")),
#'     gluc = ordered("normal", levels = c("normal", "above_normal", "well_above_normal")),
#'     smoke = factor("no", levels = c("no", "yes")),
#'     alco = factor("no", levels = c("no", "yes")),
#'     active = factor("yes", levels = c("no", "yes")),
#'     bmi_class = factor("normal", levels = c("normal", "overweight", "obese", "other"))
#'   )
#'
#'   # Predict
#'   predict_group28(test_data)
#' }
predict_group28 <- function(new_data) {
  # 1. Check input
  if (!is.data.frame(new_data)) stop("Input must be a data frame")

  # 2. Locate model
  model_path <- system.file("extdata", "final_fit_workflow.rds", package = "group28")
  if (model_path == "") stop("Model file not found")

  # 3. Read model
  model <- readRDS(model_path)

  # 4. Predict
  predict(model, new_data)
}
