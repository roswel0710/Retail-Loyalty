# Retail Loyalty Program Analysis Report

<img width="846" height="480" alt="retail-loyal-program-feature-image" src="https://github.com/user-attachments/assets/d1170bee-1ea5-43dd-93b7-d23733822c01" />

This analysis explores customer behavior, loyalty engagement, and business impact in a simulated retail environment. The project uses a synthetic dataset (generated via ChatGPT) simulating 8 years of customer activity, loyalty participation, and transactional behavior.
The core objective was to understand:
- How loyalty programs affect customer retention and sales
- Behavioral differences between loyalty members and non-members
- Which customer segments bring maximum value
- Which factors most influence churn or loyalty

Dataset Disclaimer
The dataset used in this project was synthetically generated with limited variation across time, customer behavior, and transactions. As a result:
- Many variables appear flat or tightly clustered
- Segment-level differences (tiers, regions, years) are often minimal
- True behavioral diversity found in real-world data is missing

All insights should be viewed as practice-driven rather than business-conclusive.

## Key Business Questions & Insights
1. What is the impact of being a loyalty program member on customer behavior?
- Loyalty members had slightly higher average order values and order frequency compared to non-loyalty customers. Although the difference was small, it consistently favored loyalty members, indicating that the program has a marginal positive effect on customer value.

2. How has customer retention trended over the years?
- Customer retention remained relatively stable across all years, ranging around 80%, suggesting consistently strong loyalty or minimal churn over time, with no major spikes or declines.

3. How do loyalty members and non-members differ in their average spend and order frequency?
- Loyalty members had a marginally higher average order value and slightly more orders per customer. However, the difference was not drastic, implying that the loyalty program’s influence on behavior is present but not highly significant in this dataset.

4. What are the churn patterns across different customer tiers?
- Churn rates were quite similar across all tiers, averaging around 20%. Interestingly, Bronze tier had the highest churn rate (20.43%) and Gold had the lowest (19.45%), but these variations were minor. There wasn’t a clear tier-based trend in churn.

5. Which tier performs best in terms of customer lifetime value (CLV)?
- Average CLV figures across tiers were nearly the same, hovering around 1360–1370, indicating no clear standout tier. The lack of variation suggests uniform purchasing patterns across segments.

6. Does longer loyalty duration correspond to higher spending?
- Surprisingly, customers with shorter loyalty durations (0–1 year) had slightly higher CLV than long-term customers. This contradicts typical expectations and points to limited variation in behavior, likely due to dataset constraints.

7. Are there clear relationships between metrics like orders, spend, and loyalty duration?
- There was a strong correlation between total spend and number of orders, as expected. However, loyalty duration had weak correlation with both spend and engagement metrics, reinforcing the pattern of behavioral uniformity in the data.

8. Which tier shows the highest churn or retention risk?
- All standard tiers showed similar churn rates, suggesting no single tier is particularly at risk. The small differences make tier-based churn prediction ineffective for this dataset.

9. How does loyalty program penetration vary across regions?
- Regional penetration was extremely uniform, ranging from 62.5% to 63.5% across all regions. This suggests no geographic advantage or underperformance and again reflects low variability in the dataset.

10. Are there any data quality concerns impacting analysis?
- Yes. The dataset, being AI-generated, lacked realistic variability. Many metrics across groups showed little to no significant deviation. This limited the depth of insights and patterns we could uncover and weakened the strength of segment-based analysis.

## Summary & Learnings
This project served as a valuable exercise in:
- Creating and loading multi-table data into PostgreSQL
- Practicing data cleaning and validation techniques
- Writing and debugging SQL for real-world business analysis
- Building correlations and extracting insights using Python
- Understanding limitations of synthetic data

Although the dataset lacked real-world variance, the process reinforced analytical thinking and SQL + Python skills necessary for retail loyalty analysis.
