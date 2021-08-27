# In progress - Power analysis activity in G*Power

------------------------------------------------------------------

## Goals for today  

- Review the definition of statistical power (in null hypothesis significance testing)  
- Review the purpose of power analysis  
- Review the pieces of information that are necessary to conduct a power analysis  
- Review different approaches to determine a target effect size   
- Learn how to conduct a power analysis for common experimental designs:
  - 1 group, 1 variable (t-test of mean, effect size d)  
  - 1 group, 2 variable (correlation, effect size r)
  - 2 groups, 1 variable (independent samples t-test, effect size d with pooled SD)
  - more than 2 groups, 1 variable (ANOVA, effect size eta<sup>2 </sup> or Cohen f)
  - 1 group, 2 within × 2 within (repeated measures ANOVA)  
  - 2 group, 2 between × 2 within (mixed ANOVA)  
- Understand the effect of multiple comparisons on Type 1 error
  - Simple example of correcting for multiple comparisons - Bonferroni correction pairwise comparisons in 2 × 2 design  
  - Understand the concept and consequences of p-hacking  
- Tips on conducting power analysis for more complicated designs

------------------------------------------------------------------

### What is statistical power?

In null hypothesis significance testing, power is a measure of how effective a statistical procedure is at identifying real differences (or associations) in populations: It is the probability that the null hypothesis will be correctly rejected when the alternative hypothesis is true.  

### What is the purpose of a power analysis?  

In experiment design (before collecting data), we use power analysis to determine (a) given a certain sample size and true effect size, what is the power of the statistical procedure (i.e. probability of correctly rejecting the null hypothesis)? (b) or, given a desired level of power (e.g., 80%), what is the sample size required to achieve that power?  

![Null Hypothesis Significance Teasting flow chart](images/NHST-process.png)  

### What information is needed to conduct a power analysis?  

Power is computed from the following variables:  
1. **Effect size** - The true magnitude of the difference or association that you aim to observe. This is usually expressed as a standardized difference (for a difference between means) or proportion of explained variance (for an association between variables). When the true effect size is larger, power is greater.    
2. **Alpha error** - The probability of incorrectly rejecting a true null hypothesis (i.e., committing a Type I error). For a power analysis, you must define an acceptable threshold for alpha error (often .05). When your alpha threshold is lower, power is lower.  
3. **Sample size** - The number of cases randomly sampled from the population. When the sample size is greater, power is greater. Often, instead of computing power for a given sample size, you may want to compute the minimum sample size to achieve a given level of power.  
*Another term you may hear:* ***Beta error*** - *(equal to 1 - power) The probability that the procedure will incorrectly fail to reject the null hypothesis when the alternative hypothesis is true (type II error).*

### How do I determine the effect size before I run the experiment?  
A few approaches (covered in lecture):  
1. Estimate the true effect size based on literature review of similar measures and methods. It is best if you base the estimate on many studies (or a meta-analysis) because an effect size from a single sample may have a large confidence interval.  
2. Run a pilot study. Then you will have an effect size estimate for the exact procedures you intend to use, but remember that an effect size from a single study may have a large confidence interval.  
3. Determine what is the minimum effect of interest. You may be able to argue that a certain effect size is the smallest effect that would be meaningful (for the scientific purpose of the study). Then you can calculate power to detect that minimum effect of interest.  
4. Use effect size benchmarks (small, medium, large). You can simply design your study to detect a benchmark effect size with a specified power level. Not the preferred approach but very common.  

### How do I run a power analysis?  
There are plenty of tools available for power analysis (e.g., [the pwr package for R](http://cran.r-project.org/web/packages/pwr/index.html)). Here, we will use G*Power because it is easy to use and covers a lot of common designs.

#### Example #1: One group, one variable  
Let's say you plan to have one group undergo an acute stress procedure, and you plan to measure their change in salivary cortisol (a hormone) from pre-stressor to post-stressor. Your null hypothesis is that the change in cortisol (post-stress minus pre-stress) is zero. Your alternative hypothesis is that the change in cortisol is *greater* than zero.   

You will use a 1-sample t-test of mean cortisol change  versus zero. You want to know **what is the sample size you need** to achieve 80% power for this procedure, if the true effect size is d=.8 (based on a meta-analysis *note that this effect size is fictional*). Your alpha error threshold is .05.  

Use these settings in G\*Power to calculate the sample size you need:  
1. *test family* = t tests  
2. *statistical test* = Means: difference from constant  
3. *Type of power analysis* = A priori: compute required sample size  
4. *Inputs*: 1 tail, 
 

#### What is p-hacking?
- Do some p-hacking of your own using this [web app from fivethirtyeight](https://projects.fivethirtyeight.com/p-hacking/)  
  - Explore the site a little bit, it allows you to create a model to describe the U.S. economy in terms of numbers of Democrats or Republicans in U.S. government  
  - of course, there are several choices you can make concerning how you measure the U.S. economy, how you measure the number of Democrats/Republicans in U.S. government, and what data should be included/excluded