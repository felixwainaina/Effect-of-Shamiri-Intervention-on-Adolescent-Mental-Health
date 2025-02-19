# Report: Effect of Shamiri Intervention on Adolescent Mental Health

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

[image1]: <data:image/png;base64,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>