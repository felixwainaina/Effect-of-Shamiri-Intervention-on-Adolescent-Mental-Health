
# 1\. Brief Background

This report examines the impact of the Shamiri Intervention on adolescent mental health, focusing on depressive symptoms as measured by the Patient Health Questionnaire-8 (PHQ-8). The PHQ-8 is a widely used, validated tool for assessing depression severity. This analysis aims to determine if the Shamiri Intervention leads to a significant change in PHQ-8 scores compared to a control condition. The dataset includes baseline and endpoint PHQ-8 scores, along with demographic information, allowing for a comparison of changes in depressive symptoms over time between the intervention and control groups.

# 2\. Data Analysis Methods

The analysis was conducted using R. The following steps were performed:

1. Data Cleaning:  
   * The data was loaded from an Excel file.  
   * Columns were renamed for clarity.  
   * Text responses for PHQ and GAD questions were converted to numerical scores (0-3).  
   * Data types were adjusted (e.g., Time and Condition to factors, Age to numeric).  
   * Missing values were imputed using the median for each column.  
   * Duplicate rows were removed.  
   * Total PHQ-8 and GAD-7 scores were calculated for each participant.  
2. Data Preparation for Analysis:  
   * The data was reshaped from long to wide format, with baseline and endpoint PHQ-8 scores in separate columns.  
   * A change score was calculated by subtracting the baseline PHQ-8 score from the endpoint PHQ-8 score (Endpoint \- Baseline).  
3. Statistical Analysis:  
   * Descriptive statistics (mean and standard deviation) of the change scores were calculated for both the intervention and control conditions.  
   * An independent samples t-test was performed to compare the mean change scores between the two conditions.  
   * A boxplot was generated to visualize the distribution of change scores for each condition.  
     

# 3\. Findings

### Descriptive Statistics

| Condition | Mean Change | SD Change |
| ----- | ----- | ----- |
| **Control** | 0.1698113 | 6.17917 |
| **Intervention** | \-2.0800000 | 6.33049 |

This table shows that the mean change in PHQ-8 scores for the control group is approximately 0.17, indicating a slight increase in depressive symptoms, while the intervention group shows a mean decrease of approximately 2.08 in their PHQ-8 scores, suggesting an improvement in mental health.

### Independent Samples t-test

`Welch Two Sample t-test`

`data:  Change by Condition`

`t = 1.82, df = 100.31, p-value = 0.0712`

`alternative: true difference in means is not equal to 0`

`95 percent confidence interval:`

 `-0.198  4.697`

`sample estimates:`

`mean in group Control mean in group Intervention`

`0.1698113               -2.0800000`

The t-test results indicate that there is no statistically significant difference in the change in PHQ-8 scores between the intervention and control groups (p \= 0.0712). Although the intervention group experienced a greater reduction in depressive symptoms, this difference did not reach conventional levels of statistical significance (p \< 0.05). The confidence interval ranges from approximately \-0.198 to 4.697, which includes zero, further suggesting that we cannot conclude a significant effect of the intervention based on this analysis.

## **Boxplot**

![][image1]

The boxplot displays the distribution of the change in PHQ-8 scores for both the control and intervention conditions. Visually, the boxplot shows:

* The median change score for the intervention group appears to be lower (more negative) than the control group, aligning with the descriptive statistics.  
* The spread (interquartile range) of the change scores seems relatively similar between the two groups.  
* An outlier is present in the control group, indicating a participant with a particularly high positive change in PHQ-8 score.  
* The whiskers of the boxplots extend to different lengths, suggesting variations in the range of change scores within each group.

# 4\. Conclusions and Recommendations

The findings suggest that while the Shamiri Intervention demonstrates a trend toward improvement in depressive symptoms among adolescents compared to the control group, this difference is not statistically significant at conventional levels (p \= 0.0712). The observed trend warrants further investigation.

## Recommendations:

* Conduct studies with larger sample sizes to increase statistical power and the likelihood of detecting a significant effect if one exists.  
* Explore potential reasons for the lack of statistical significance, such as high variability within the groups or unmeasured confounding variables.  
* Investigate the characteristics of individuals who respond most favorably to the intervention to identify potential moderators of treatment effects.  
* Consider measuring additional outcomes beyond PHQ-8 scores to gain a more comprehensive understanding of the intervention's impact on adolescent mental health.  
* Given the presence of an outlier in the control group, consider sensitivity analyses to assess whether the outlier unduly influences the overall results.

## Attachments:

* Initial Data: ***task.xlsx***  
* Cleaned Data: ***cleaned\_task\_data.csv***  
* Analysis Code: ***Shamiri Intervention.R***  
* Boxplot: ***change\_score\_boxplot.png***
