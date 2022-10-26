# SPSS Lab activity - Comparisons between two groups    

*Jamil Palacios Bhanji and Vanessa Lobue*  
*Last edited Oct 26, 2022*
  

## Goals for today  

-	Compare two means from independent groups (continuous outcome variable)  
  - use boxplot, histograms to check assumptions  
  - assumptions okay: Independent samples t-test, equal variance assumed or not  
      - Effect size Cohen d (pooled variance)  
  -	assumptions not okay: nonparametric Wilcoxon rank sum (Mann-Whitney U)  
      - Effect size r (use z-to-r formula)  
-	Compare two means from dependent samples (e.g., paired samples)  
  - use boxplot, histograms to check assumptions  
  - assumptions okay: dependent (paired) samples t-test   
      - Effect size Cohen d (use difference between pairs)   
-	assumptions not okay: non-parametric Wilcoxon signed rank test
      - Effect size r (use z-to-r formula)    


------------------------------------------------------------------------


## Step 0 - Get organized, import data  
- make a folder for today's activity  

- make a "data" folder (inside the project folder)  

- **Download these two data files (save them in the data folder):**  
    1. ["AndyField\_cloak.csv"](../data/AndyField_cloak.csv)   
    2. ["AndyField\_cloak\_rm.csv"](../data/AndyField_cloak_rm.csv)  

- make an "spss" folder (inside the project folder) for your SPSS files  


------------------------------------------------------------------------

#### Step 0.1 - Start SPSS and import the data  


- data description: **"AndyField\_cloak.csv"** is a file created by Dr. Andy Field and part of activities linked to the textbook.  
  - there are three variables: `id`, `cloak`, and `mischief` 
    - `id` stores individual names (randomly sampled students in a magic academy)
    - `cloak` stores whether or not the student wears an invisibility cloak ("No cloak" or "Cloak" - **this is our grouping variable (IV)**)
    - `mischief` stores the number of mischievous acts committed by each student (**this is our dependent variable)
- data description: **"AndyField\_cloak\_rm.csv"** is a similar file, but each id has two rows: one for each value of `cloak`. So this is a within-subjects version of the experiment where each mischievous acts were measured for each student twice (once while they wore an invisibility cloak, and once while they did not wear a cloak)   

**Import the "AndyField\_cloak.csv" (between subjects design) data:**  
Open SPSS and use File -\> Import Data-\> CSV or Text Data  - now check the variable types and add labels if you wish.  
**Careful! If you use "import text data" make sure you set the only delimiter as "comma"** (SPSS may automatically select "space" as a delimiter, so uncheck that option)    

 
   
------------------------------------------------------------------------

## Step 2 - Examine group means and distributions  

![Two group decision chart](../images/two-means-process.png){width=50%} 

#### Above is the decision process chart from the book.  

- Following the chart, we should start with box plots and histograms to check for unusual cases, non-normality, and possible differences in variance (violation of homogeneity) between groups. Let's also view descriptives by group. See if you can use what you learned in previous activities to view  
  1. a box plot for each group  
  2. a histogram for each group  
  3. a table including mean, median, sd, and #cases by group  

- the easiest way to organize descriptives by group in SPSS is by using Analyze-\>Descriptive Statistics-\>Explore, and put the grouping variable ("cloak") in the Factor List.

- To jog your memory, here is a link to the ["import and examine" activity](https://jamilfelipe.github.io/psych596/activities/import-examine/spss/import-examine-instructions-spss.html) where we made a descriptive table and distribution plots.  

------------------------------------------------------------------------

## Step 3 - Compare means with an independent samples t-test  
- This is a small dataset, but the distributions are basically normal and there are no cases we should consider extreme   
- So let's compare the means of the two groups with an independent samples t-test  
- Go to Analyze-\>Compare means-\>Independent Samples T-test  
    1. `mischief` is the Test variable   
    2. `cloak` is the grouping variable    
    3. Click "Defind Groups" and enter "Cloak" as group 1 and "No cloak" as group 2  
    3. check the box for effect size
  
### Look at the Independent Samples Test summary:  
1. **Levene's Test for Equality of Variances** is an F-test of the null hypothesis that the variance of each group is equal. Some researchers use this test to decide whether to assume equal variances in the groups. A low "Sig." for this test would indicate that you should not assume the group variances are equal (and use the "Equal variance not assumed" row of the output (aka the Welch two sample t-test). Others say we can just use the Welch test by default because it is more general and there is little difference in power when variances are actually equal. **Note that normality is still an assumption for both tests.**  
2. The t-statistic, under **"t"**, is the difference between group means divided by estimated standard error (basically the sum of standard error of each mean - see Chapter 10 of the Field textbook), and the **two-sided p-value** tells you the probability of a t-statistic at least *this far from zero* (positive or negative) under the null hypothesis (that the group means are not different). The **one-sided p** gives the probability of a t-statistic at least *this much greater than zero* under the null hypothesis.  
    - The sign of the t-statistic (positive or negative) is determined by whichever group value you put as Group 1 vs Group 2 (if the Group 1 mean is larger the t-stat will be positive.
3. Notice the degrees of freedom (equal variance assumed), **df**, is equal to the number of cases minus 2 (because we estimate 2 parameters: the mean for each group) - it is a little lower (and not an integer) in the "Equal variances not assumed" row.    
4. The mean difference is the mean of Group 1 minus the mean of Group 2 (5 - 3.75 = 1.25). Standard Error is the standard error of that difference. The t-statistic is the mean difference divided by the standard error. They are the same for the equal variances assumed/not assumed in this case because we have equal group sizes, but they would be different if the group sizes differed.  
4. The 95% confidence interval gives an interval around the estimated difference between means: we expect 95% of intervals constructed this way to contain the true difference in population means.   

#### Effect size - independent samples  

Below the "Independent Samples Test" table there is the "Independent Samples Effect Sizes" table. This table lists 3 effect size measures (values in the "point estimate" column) and 95% confidence intervals around the effect size measures.

Each effect size measure is based on the difference between means divided by some measure of deviation. SPSS gives you Cohen's d where the denominator is the standard deviation (d<sub>s</sub> in the Lakens article). Hedge's g also uses the pooled standard deviation in the denominator, with a correction that is considered more accurate for small samples. Glass delta uses the standard deviation of only one of the groups (Group 2) in the denominator, which may be appropriate when one group is considered a control group. The "Standardizer" column in the effect size table tells you what the denominator is for each effect size measure.  

#### Now, answer the following questions for yourself based on what you've done so far    
1. What is the difference between the mean mischief level for the group of individuals that wear cloaks compared to the mean level for individuals that do not wear cloaks (in terms of raw units of mischief)?  
2. What is the estimated effect size (d<sub>s</sub>), and confidence interval for the effect size?   
3. What do you conclude about the effect of invisibility cloaks on mischief based on this sample of data you have examined? (assume this is a random sample from the population) Can you reject the null hypothesis that the mean mischief levels for each group are the same?   

------------------------------------------------------------------------

## Step 4 - Non-parametric test for independent samples (based on sum of ranks)   

- What if we were concerned that the assumptions (normality) were violated? In such a case we can use a non-parametric test for comparing groups. To do this we will use the Mann-Whitney Test (equivalent to the Wilcoxon rank sum test), where there are no assumptions related to normality or equal variance.  
- This statistic is based on first ranking the scores and then summing the total of the ranks for each group (you may recall that the non-parametric Spearman correlation is also based on ranked scores).  
- Because this statistic is based on the ranks, the null hypothesis is properly stated as "the probability that a randomly drawn case from one group is larger than a randomly drawn case from the other is equal to 0.5". The procedure is described fully in section 7.4 of the Field Textbook.  
- To run the Mann-Whitney test in SPSS, go to Analyze-\>Nonparametric Tests-\>Independent Samples:   
    1. click "Customize Analysis"    
    2. under the "Fields" tab, set `mischief` as the "Test Field" and `cloak` as the "Groups"  
    3. under the "Settings" tab, select "Customize tests" and check the box for "Mann-Whitney U (2 samples)"    
    4. click Run  


##### Examine the output  
- Look for the table titled "Independent Samples Mann-Whitney U Test" and find the following:  
    1. Mann-Whitney U  
    2. Asymptotic Sig value (p-value)  
    3. Standardized Test Statistic (z-stat)  
- There are some issues computing a p-value when there are ties in the ranks. For this reason you might choose instead to use a robust test such as the Yuen (1974) test of trimmed means, or use a bootstrapped confidence interval in the regular independent samples t-test options (see Field Textbook section 10.8.4).  
- What about an effect size measure for this kind of comparison? The Field textbook (section 7.4.5) recommends calculating an r value with the formula `(r = z/sqrt(N))`. We have to calculate it for ourselves.  
- When reporting results like this you would report the Mann-Whitney U, the p-value, and the effect size.  

------------------------------------------------------------------------

## Step 5 - Dependent samples (also called paired samples, within-subjects comparison, repeated measures)  

Now, let's imagine a different sample of data, where mischief was measured for each individual in two conditions: with or without a cloak. This is a within-subjects or repeated measures design. When we analyze this sample we need to account for the fact that measures in each condition are *dependent*, meaning that the "No cloak" mischief measure for an individual may be related to the "Cloak" mischief measure.

#### What to do:  
1. Import the new sample of data ("AndyField_cloak_rm.csv") into a SPSS (close the current dataset)  
2. Notice that there are two rows for each ID: 1 for each condition (Cloak, No cloak)  
3. For repeated measures analyses in SPSS we need to reformat the dataset so that there is one row for each `id` value and the `mischief` values for each condition are 
    1. Go to Data-\>Restructure  
    2. select "Restructure selected cases into variables" (next)  
    3. Enter `id` as the Identifier Variable  
    4. Enter `cloak` as the Index Variable (next)  
    5. Select "Yes" to sort the data (next)  
    6. Select "group by index"  
    7. click Finish  
    8. Rename the "Cloak" variable to "Cloak_mischief" and the "v1" variable to "No_cloak_mischief", then set the label fields (this is helpful for the way the variable appear in the dialog boxes), and set the Measure type to "Scale" for the two mischief variables.    

2. generate a box plot, histogram, and table of means similar to what you did for the first sample (use Analyze-\>Descriptive Statistics-\>Explore) -- what do you notice?   

- you should see that the means and sd are exactly the same as in the first sample. the difference now is that there are only 12 unique id values (names).  

#### Next, use a paired samples t-test to compare mischief in the "cloak" condition to mischief in the "no cloak" condition  
1. Go to Analyze-\>Compare Means-\>Paired Samples T Test
2. Move `Cloak_mischief` to "Variable 1" for Pair 1  
3. Move `No_cloak_mischief` to "Variable 2" for Pair 1  
4. Check the box for effect size, and select "Standard deviation of the difference" (this will give you effect size estimates specific to the repeated measures design)  

#### If the means and sd are the same, why is the paired comparison different?  
- The output looks similar to the independent samples t-test. Note the Mean (of the difference between pairs), 95% confidence interval around the mean, t, and Sig. values  
- With this design, *we do not have 24 independent observations* like we had with the first example. Each observation (e.g., Alia's mischief level when wearing a cloak) is related to another observation (Alia's mischief level when not wearing a cloak). 
- So our model (of the difference between conditions) actually has only 12 independent observations because we are using the difference between `Cloak` and `No cloak` mischief measurements for each student (11 degrees of freedom because we estimate one parameter, the mean difference between conditions).  
- A paired samples t-test is exactly the same as conducting a 1 sample t-test on the difference between conditions.   
- thus, the t-statistic is still the ratio of the mean difference between conditions divided by estimated standard error, but our estimated standard error is now based on the difference between pairs of values rather than the standard errors for each group.  

#### Effect size  

- There are two distinct ways to think about effect size for this new sample:  
    1. effect size should be comparable across different studies, thus it should not be dependent on the study design (i.e., between vs within-subjects).  
        - in this case we should ignore the dependency between cases and compute a pooled variance Cohen's d exactly as we did with the first sample (and get the same value as in the first sample)  
        - you can get this measure by selecting "Average of variances" in the effect size options for the test  
    2. the effect size should factor in the dependency between scores in different conditions   
    - in this case we should factor in the correlation between the scores using the "Standard deviation of the difference" option for effect size (this is what the instructions said to select). And we get a different effect size than we got for the first (between subjects) study - referred to as d<sub>z</sub> in the Lakens (2013) article.   
    
- Which effect size measure should you use?  
    - It depends on your area of study and research question.  
    - Some research questions might be specific to repeated measures designs, and in that case #2 makes sense.  
    - But #1 makes sense when you intend the effect size to be comparable across different study designs.  
    - The important thing is to be clear about how effect size is calculated when you report it.  

#### In your notes, write what you would conclude about the effect of invisibility cloaks on mischief-making from this second sample  

----------------------------------------------------------------------------

## Step 6 - Non-parametric test for paired samples     

- One non-parametric alternative to the paired samples t-test (useful when assumptions are violated) is the Wilcoxon signed rank test.  
- This test is based on ranking the *differences between scores* in the two conditions you’re comparing. The sign of the differences is attached to the ranked scores, hence the name of the test (see Field textbook section 7.5 for details).  
- Because this statistic is based on the ranks, the null hypothesis is that *the median of the differences between conditions is zero*.   
- to run the Wilcoxon signed rank test, Go to Analyze-\>Nonparametric Tests-\>Related Samples:   
    1. click "Customize Analysis"    
    2. under the "Fields" tab, set `Cloak_mischief` and `No_cloak_mischief` as the "Test Fields"  
    3. under the "Settings" tab, select "Customize tests" and check the box for "Wilcoxon matched pair signed rank (2 samples)"    
    4. click Run (you'll get an error if the variable measure types are not set to Scale or Ordinal)    

##### Examine the output  
- The output will give you a test statistic (referred to as V in R and as W in other places), a two-sided Sig (p-value), and a Standardized test statistic (z-stat)  
- The Sig. value gives the probability of the observed "location shift" (median shift from zero) or greater if the null hypothesis is true.  
- What about an effect size measure for this kind of comparison? The Field textbook (section 7.5.5) makes the same recommendation as for the independent samples comparison: `(r = z/sqrt(N))` where N is the total number of observations (not the number of individuals). Just like before, we have to compute this ourselves.  
- try it - you should get a value of r = .531  

#### That's all for the SPSS activity, [have fun in R now](https://jamilfelipe.github.io/psych596/activities/two-group/r_docs/two-group-instructions-r.html)!


----------------------------------------------------------------------------

## References

- Chapters 7 & 10 of Field textbook: Field, A.P. (2018). Discovering Statistics Using IBM SPSS Statistics. 5th Edition. London: Sage.    
- Lakens, D. (2013). Calculating and reporting effect sizes to facilitate cumulative science: a practical primer for t-tests and ANOVAs. Frontiers in psychology, 4, 863.  
- Yuen, K.K. (1974). The two-sample trimmed t for unequal population variances. Biometrika, 61, 165–170.
  



