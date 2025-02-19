library(dplyr)
library(tidyr)
library(readxl) # Load the readxl package

# 1. Load the data
data <- read_excel("task.xlsx") # Replace with your actual file name

# 2. Inspect the data
head(data)
str(data)
summary(data)

# 3. Rename Columns for Easier Use (Very Important!)
colnames(data) <- c("Time", "Study_ID", "Condition",
                    "PHQ_1", "PHQ_2", "PHQ_3", "PHQ_4", "PHQ_5", "PHQ_6", "PHQ_7", "PHQ_8",
                    "GAD_1", "GAD_2", "GAD_3", "GAD_4", "GAD_5", "GAD_6", "GAD_7",
                    "Age", "Form", "Gender")

# 4. Convert Text Responses to Numerical Scores
# Define the recoding function
recode_responses <- function(x) {
  case_when(
    x == "Not at all" ~ 0,
    x == "Several days (between 2 and 7 days)" ~ 1,
    x == "Over half the days (more than 7 days)" ~ 2,
    x == "Nearly/almost every day" ~ 3,
    TRUE ~ NA_real_  # Handle unexpected values as NA
  )
}

# Apply the recoding function to the PHQ and GAD columns
phq_gad_cols <- c(paste0("PHQ_", 1:8), paste0("GAD_", 1:7))
data <- data %>%
  mutate(across(all_of(phq_gad_cols), recode_responses))


# 5. Convert Data Types
data$Time <- as.factor(data$Time)
data$Condition <- as.factor(data$Condition)
data$Age <- as.numeric(data$Age)  # Ensure Age is numeric
data$Gender <- as.factor(data$Gender)

# 6. Handle Missing Values
# Check for missing values
missing_values <- colSums(is.na(data))
print(missing_values)

# Option A: Impute with the median (more robust to outliers)
for (col in names(data)[sapply(data, is.numeric)]) {
  data[[col]][is.na(data[[col]])] <- median(data[[col]], na.rm = TRUE)
}

# Option B: Remove rows with any NAs (if imputation isn't desired and NAs are few)
data <- data %>% na.omit()

# 7. Calculate Total Scores
data <- data %>%
  mutate(PHQ_8_Total = rowSums(select(., starts_with("PHQ_"))[,1:8], na.rm = TRUE), #Selects only the PHQ_n columns, not PHQ_8_Total column
         GAD_7_Total = rowSums(select(., starts_with("GAD_"))[,1:7], na.rm = TRUE)) #Selects only the GAD_n columns, not GAD_7_Total column

# 8. Check for and Handle Outliers (Example using boxplots)
boxplot(data$PHQ_8_Total, main = "PHQ-8 Total Scores")
# Identify and decide how to handle outliers (e.g., Winsorizing, trimming)

# 9. Remove Duplicates (if any)
data <- data %>% distinct()

# 10. Save the Cleaned Data
write.csv(data, "cleaned_task_data.csv", row.names = FALSE)

print("Data cleaning and preparation complete.  Cleaned data saved to cleaned_task_data.csv")

################################################################################
# Data Analysis (using R):  Effect of Shamiri Intervention on Mental Health #
################################################################################

# Prepare data for analysis:  Create a change score
# First, reshape the data to wide format to easily calculate the difference
data_wide <- data %>%
  pivot_wider(id_cols = c("Study_ID", "Condition", "Age", "Gender"),
              names_from = "Time",
              values_from = "PHQ_8_Total")

# Rename the time columns to baseline and endpoint for easier use
colnames(data_wide)[colnames(data_wide) == "1"] <- "Baseline"
colnames(data_wide)[colnames(data_wide) == "2"] <- "Endpoint"

# Calculate the change in PHQ-8 score (Endpoint - Baseline)
data_wide <- data_wide %>%
  mutate(Change = Endpoint - Baseline)

# Descriptive Statistics
# Calculate mean and SD of change scores for each condition
descriptive_stats <- data_wide %>%
  group_by(Condition) %>%
  summarize(Mean_Change = mean(Change, na.rm = TRUE),
            SD_Change = sd(Change, na.rm = TRUE))
print("Descriptive Statistics of Change Scores:")
print(descriptive_stats)

# Independent Samples t-test
# Compare the change in PHQ-8 scores between the intervention and control groups
t_test_result <- t.test(Change ~ Condition, data = data_wide)
print("Independent Samples t-test Result:")
print(t_test_result)

# Optional:  Boxplot of change scores (requires ggplot2)
# install.packages("ggplot2")  #Uncomment if you don't have ggplot2 installed
library(ggplot2)

boxplot_change <- ggplot(data_wide, aes(x = Condition, y = Change)) +
  geom_boxplot() +
  labs(title = "Change in PHQ-8 Scores by Condition",
       x = "Condition",
       y = "Change in PHQ-8 Score") +
  theme_bw()
print(boxplot_change) # This will display the boxplot

# Save the boxplot to a file (optional)
ggsave("change_score_boxplot.png", boxplot_change, width = 6, height = 4) # Saves in your working directory


print("Data analysis complete.  Results and boxplot (change_score_boxplot.png) have been generated.")

