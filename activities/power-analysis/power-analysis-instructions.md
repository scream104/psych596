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

In experiment design (before collecting data), we use power analysis to determine  
(a) given a certain sample size and true effect size, what is the power of the statistical procedure (i.e. probability of correctly rejecting the null hypothesis)?  
or  
(b) given a desired level of power (e.g., 80%), what is the sample size required to achieve that power?  

![Null Hypothesis Significance Teasting flow chart](images/NHST-process.png)  

### What information is needed to conduct a power analysis?  
From *Cohen (1992)*: "Statistical power analysis exploits the relationships among the four variables involved in statistical inference ... For any statistical model, these relationships are such that each is a function of the other three."  

These are the four variables:  
1. **Effect size** - The true magnitude of the difference or association that you aim to observe. This is usually expressed as a standardized difference (for a difference between means) or proportion of explained variance (for an association between variables). When the true effect size is larger, power is greater.    
  - For this lab, we will be using Cohen's  
2. **Alpha error** - The probability of incorrectly rejecting a true null hypothesis (i.e., committing a Type I error). For a power analysis, you must define an acceptable threshold for alpha error (often .05). When your alpha threshold is lower, power is lower.  
3. **Sample size** - The number of cases randomly sampled from the population. When the sample size is greater, power is greater. Often, instead of computing power for a given sample size, you may want to compute the minimum sample size to achieve a given level of power.  
4. **Statistical Power** - Defined above. We can determine the power of a procedure based on the first 3 variables, but usually instead we start with a desired level of power (e.g., .8), and determine the minimum sample size needed to achieve that power level.
*Another term you have heard:* ***Beta error*** - *(equal to 1 - power) The probability that the procedure will incorrectly fail to reject the null hypothesis when the alternative hypothesis is true (type II error).*

### How do I determine the effect size before I run the experiment?  
A few approaches (covered in lecture):  
1. Estimate the true effect size based on literature review of similar measures and methods. It is best if you base the estimate on many studies (or a meta-analysis) because an effect size from a single sample may have a large confidence interval.  
2. Run a pilot study. Then you will have an effect size estimate for the exact procedures you intend to use, but remember that an effect size from a single study may have a large confidence interval.  
3. Determine what is the minimum effect of interest. You may be able to argue that a certain effect size is the smallest effect that would be meaningful (for the scientific purpose of the study). Then you can calculate power to detect that minimum effect of interest.  
4. Use effect size benchmarks (small, medium, large). You can simply design your study to detect a benchmark effect size with a specified power level. Not the preferred approach but very common.  

### How do I run a power analysis?  
There are plenty of tools available for power analysis (e.g., [the pwr package for R](http://cran.r-project.org/web/packages/pwr/index.html)). Here, we will use G*Power because it is easy to use and covers a lot of common experiment designs.

#### Example #1: One group, one variable  
Let's say you plan to have one group of participants undergo an acute stress procedure, and you plan to measure participants' pupil diameter while looking at pictures of chocolate cake (after the stress procedure). You expect the measure to be normally distributed. The null hypothesis is that the group's mean pupil amplitude measurement is 4.0mm (let's say that is the known non-stressed population mean). The alternative hypothesis is that the change in cortisol is ***different than 4.0mm***.     

You will use a 1-sample t-test (2 tailed) of mean cortisol change  versus zero. You want to know **what is the sample size** you need to achieve 80% power for this procedure, if the true effect size is d=.5 (based on a meta-analysis - *note that this effect size is fictional*). Your alpha error threshold is .05.  

Use these settings in G\*Power to calculate the sample size you need:  
1. *test family* = t tests  
2. *statistical test* = Means: difference from constant  
3. *Type of power analysis* = A priori: compute required sample size  
4. *Inputs*: 2 tails, effect size d = .5, alpha err prob = .05, power = .8

Click on the "calculate" button when you are ready

##### Now answer the following questions in your notes:  
- what is the required sample size (for the requirements given above)?  
- what is the 

#### What is p-hacking?  
In lecture we reviewed the concept of p-hacking and it's effect on type 1 error. Here you can take a moment to see first hand how "experimenter degrees of freedom" can influence the results of statistical tests in such a way that you can potentially find a test to justify any conclusion you want to make (that's not a good thing; Simmons et al, 2011).  

- Do some p-hacking of your own using this [web app from fivethirtyeight](https://projects.fivethirtyeight.com/p-hacking/).   
  - Explore the site a little bit, it allows you to create a model to describe the U.S. economy in terms of numbers of Democrats or Republicans in U.S. government  
  - There are several choices you can make concerning how you measure the U.S. economy, how you measure the number of Democrats/Republicans in U.S. government, and what data should be included/excluded  

### How do I describe a power analysis for a publication?  
There is currently no consistent standard for what should be included in a statement about sample size determination for a study. Here are a few examples for you to consider (taken from the August 2021 issue of *Psychological Science*): 

"Sample size was determined, first, by effect and sample sizes from the literature and, second, by pilot data from English-speaking participants." - *Brown, A. R., Pouw, W., Brentari, D., & Goldin-Meadow, S. (2021). People are less susceptible to illusion when they use their hands to communicate rather than estimate.* 

"We conducted a power analysis to verify that our tests would be sensitive enough to detect group differences. Power analysis was done using the R package pwr2 (Version 1.0; Lu et al., 2017). We found that with the current setup, a sample size of 18 participants would allow us to detect between-subjects interactions with an effect size of 0.4 (Cohen’s d)." -- *Fooks, N., Hadad, B. S., & Rubinsten, O. (2021). Nonsymbolic-Magnitude Deficit in Adults With Developmental Dyscalculia: Evidence of Impaired Size Discrimination but Intact Size Constancy.* 

"In these studies, we determined sample sizes prior to data collection, aiming for at least 100 participants per cell when manipulating attitudes or 100 observations per point on the attitude scale when measuring attitudes. Sensitivity analyses revealed that each sample had greater than 80% power to detect the predicted cubic effect." -- *Bechler, C. J., Tormala, Z. L., & Rucker, D. D. (2021). The Attitude–Behavior Relationship Revisited.*

"Following our preregistered data-sampling plan, we recruited 40 participants. Calculations using G\*Power (Version 3.1.7; Faul et al., 2009) showed that this sample size would yield a power of greater than 90% to detect medium-sized effects of evaluative information and interactions of evaluative information and attention tasks (η<sub>p</sub><sup>2</sup> = .06)." -- *Schindler, S., Bruchmann, M., Krasowski, C., Moeck, R., & Straube, T. (2021). Charged with a crime: The neuronal signature of processing negatively evaluated faces under different attentional conditions.*

### References
Cohen, J. (1992). A power primer. *Psychological Bulletin*, 112(1), 155.

Faul, F., Erdfelder, E., Lang, A. G., & Buchner, A. (2007). G* Power 3: A flexible statistical power analysis program for the social, behavioral, and biomedical sciences. Behavior research methods, 39(2), 175-191.
