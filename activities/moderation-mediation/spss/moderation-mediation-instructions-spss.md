# SPSS Lab activity - Moderation and Mediation Models  

*Jamil Palacios Bhanji and Vanessa Lobue*  
*Last edited Oct 11, 2021*
  

## Goals for today  

-  Learn how to model the interaction of 2 continuous predictors in a linear regression model (with a continuous DV)  
    -  Mean centering for interpretation of main effects  
    -  Interpreting interaction coefficients
    -  Calculate simple slopes for one variable at distinct levels of the other variable (+/- 1 SD of 1 variable) to guide interpretation  
-  Conduct the same moderation model using the extension PROCESS (Hayes, 2017)  
-	Mediation using linear regression for 1 hypothesized predictor (X1), 1 mediator (X2), and 1 outcome (Y) (all continous variables)  
    - Use PROCESS to examine X1->Y, X1->X2, X2->Y with regression models  
    - identify total effect, indirect effect, direct effect  
    - interpretation of coefficients  
    - discussion of effect size  
  


------------------------------------------------------------------------



## Step 1 - Get organized
- make a folder for today's activity  

- make a "data" folder (inside the project folder)  

- For the moderation example, we will use the same Lumosity dataset from last week, but with one new (imaginary) variable: "eyesight". You can download the file [lumos_subset1000pluseye.csv](../data/lumos_subset1000pluseye.csv) or you can just use your *.sav file from last week (to skip the import step) 

- make a "spss" folder (inside the project folder) for your SPSS files  


------------------------------------------------------------------------

## Step 2 - Import data and check it out  

*Data description:* lumos_subset1000plusimaginary.csv is the same file we have been working with before. Today we will make use of a fabricated variable called *imaginary\_screensize* which gives the size of the screen on which users complete the tests - this is a simulated variable that is not part of the real dataset.  

This is subset of a public dataset of Lumosity (a cognitive training website) user performance data. You can find the publication associated with the full dataset here:  
[Guerra-Carrillo, B., Katovich, K., & Bunge, S. A. (2017). Does higher education hone cognitive functioning and learning efficacy? Findings from a large and diverse sample. PloS one, 12(8), e0182276. https://doi.org/10.1371/journal.pone.0182276](https://doi.org/10.1371/journal.pone.0182276)


**Import the data:** Open SPSS and use File -\> Import Data-\> CSV or Text Data  - now check the variable types and add labels if you wish. **Careful! If you use "import text data" make sure you set the only delimiter as "comma"** (SPSS may automatically also treat "space" as a delimiter, so uncheck that option)    

**What to do next:**  

- look at the format of the data file - each row has all measures for 1 individual ("ID" is the unique identifier)  
- check the data types for each variable (gender, as nominal, ...)  
   
------------------------------------------------------------------------

## Step 3 - Moderation - when the relation between two variables depends on the level of another variable    

![Moderation](../images/moderation-model.png){width=50%}  

*Above: the conceptual model of moderation*  

![Moderation](../images/moderation-statmodel.png){width=50%}  

*Above: the statistical model of moderation - notice that X1 and X2 are interchangeable in the statistical model (i.e., the statistical model does not distinguish between the predictor and the moderator)*  


Previously, when we looked just at `age` and `raw_score`, we saw a small association such that older participants scored lower. But what if that association depended on another variable, such as the size of their screen? That is, maybe older individuals do worse than younger individuals only if they are working on a small screen? Such a relationship would be an example of an *interactive effect*, or *moderation* (i.e., screen size *moderates* the effect of age on raw score, or it might equally be stated that age moderates the effect of screen size on raw score).  
So far, the data we have worked with are real values from Lumosity, but for this step we have created an imaginary variable called `imaginary_screensize` - just for educational purposes.   
Use a new regression model (call it `score_ageXscreen_lm`) to examine the interaction of `age` and `imaginary_screensize` on `raw_score`. We include the interaction of two variables in a regression model by multiplying the variables and including that as a predictor. You can specify an interaction in a formula (which you include in a call to `lm()`) like this:  `formula = raw_score ~ age + imaginary_screensize + age:imaginary_screensize` (you may also see interactions specified with a `*`, which is shorthand for including an interaction along with main effects, and you should always include the main effects along with an interaction). Try it now (you'll see  soon why we should alter this formula). Use `summary()` to get the model summary and add a call to `car::vif()` to get multicollinearity info.     
  



Now let's add `pretest_score` to our model, so that we are predicting `raw_score` as a function of `age` and `pretest_score`.  

- We will do this by going back to the "Linear Regression" dialog box and then
  - keep `raw_score` as the Dependent and `age` as the predictor for "Block 1" 
  - click "Next" and enter `pretest_score` as a predictor in "Block 2" (keep the Method as "Enter" - see sections 9.9 to 9.10 in the Field textbook for explanation of the Method options). This tells SPSS to estimate two models: Model 1 has just `age` as a predictor, Model 2 has `age` and `pretest_score` as predictors.  
  - click "Statistics" and select "Estimates", "Confidence Intervals", "Model fit", "R squared change", and "Collinearity diagnostics" --  see section 9.10.2 of the Field textbook for full explanation all options. Here we'll focus on a subset of this info.   
  - click "Continue" to get back to the main Regression dialog, then click "Plots". Create a plot of ZRESID against ZPRED (you may also create other plots such as SRESID against ZPRED as explained in section 9.10.3 of the Field textbook)  
  - click "OK" to run the regression models

- take a look at the output. The **Model Summary**, **ANOVA**, and **Coefficients** tables have the same information that we had in our previous model (`age` as the only predictor), but now it is labeled as "Model 1". We also have information for "Model 2" which includes both `age` and `pretest_score` as predictors. In addition, now we have some extra columns in the **Model Summary** table under the heading "Change statistics" because we selected the "R squared change" option this time. Our interpretation of all the info is the same as before, but the change statistics now give us some info to ***compare the two models***:
    - **R Square Change:** the increase in proportion of variance explained by one model compared to another. For Model 1, this is compared to the no-predictor model, thus the number is equal to the R squared value for Model 1. For Model 2, this is the increase in R squared for Model 2 compared to Model 1 (.608 - .010 = .597 #with a little rounding error). This tells us that adding `pretest_score` to the model increased the proportion of variance explained by .597.  
    - **F Change (and Sig.):** For Model 1 it is the same as the F-statistic (Mean Square for the model divided by Mean Square of the Residual). For Model 2 it is essentially a ratio of error (RSS=residual sum of squares) of one model to the other. If one model is better at explaining the outcome than the other, than the RSS of the worse model will be greater than the RSS of the better model, and the F-statistic quantifies that for us (and gives a Sig./p-value under the null hypothesis that the models are equivalent). Here the F change stat is calculated as in equation 9.13 in the Field textbook. The Sig. value here tells us that the F change stat is unlikely (p < .001 - for the exact value you can double click on the table) under the null hypothesis (that the models are equivalent). In other words, the difference in variance explained by `age`+`pretest_score` vs `age` alone is unlikely if the models are equivalent (so the fuller model is better at explaining variance). A few points to keep in mind:   
      - When you report a model comparison this way you would report the F-statistic as well as the change in R-squared (R<sup>2</sup> of better model minus R<sup>2</sup> of the worse model). But one important issue is that adding more predictors will always increase R<sup>2</sup>.  
      - For this reason you may also report other indicators of model fit that account for the number of predictors, such as AIC and BIC (see Chapter 9 of the Field Textbook).  
      - You can't get an AIC value from SPSS using the Linear Regression dialog box but there are other ways to get it - see section 9.9.2 of the textbook and [this page by Jeramy Townsley](http://fallcreekrenovation.blogspot.com/2013/04/comparing-between-regression-models.html).  

    - **Collinearity Statistics:** (in the **Coefficients** table) In any model with multiple predictors, if predictors in the model are highly correlated with each other, we have *multi-collinearity* (see Field textbook section 9.9.3). This causes issues where the estimates of coefficients for correlated predictors are unstable (large std err and highly variable across samples). Thus, if our predictors are collinear, we can't assess their individual importance in the model (and can't trust the t and Sig. values of collinear predictors). An easy way to check for multi-collinearity is by looking at the *VIF* (variance inflation factor, listed for each predictor). It measures the shared variance between one predictor and the others. The reciprocal of VIF is called *tolerance*. A general rule of thumb is that you should worry if you have VIF > 5 for any predictor in the model.  You will also see a separate table called **Collinearity Diagnostics** - this has more detailed information on collinearity between pairs of predictors, but the tolerance and VIF information in the **Coefficients** table is generally sufficient to identify a problem.    

#### Model Diagnostics  

Now that we have run the regression model, we have to check on the assumptions that we made. Let's look back at our decision chart - it says we can use a graph of "zpred vs zresid" to check for linearity, heteroscedasticity, and independence, then look at a histogram of residuals to check for normality. These are all plots created from the Model 2 residuals (difference between the `raw_score` value predicted by the model, and the actual `raw_score` value for each case in the dataset). These charts should appear in the output you generated from the last regression:  

1. "Scatterplot- Dependent Variable: raw_score" - this is the"zpred vs zresid" and is useful for checking linearity, heteroscedasticity, and independence. We are basically checking to make sure there are no clear patterns in the residuals. 

  - Here are some [examples of patterns](../images/residualpatterns.png) you might see in residuals that indicate sources of bias (from Prof Andy Field's discovr tutorial section 08 - *note that the non-linear example is also an example of non-independence, because the residuals are related to the fitted values.*)  

2. "Histogram- Dependent Variable: raw_score" - this is a histogram of the residuals. You expect to see a normal curve shape. Look at this plot along with the "Normal P-P" plot to assess the normality assumption.

3. "Normal P-P" - this is a P-P plot of the residuals (like a Q-Q plot but of cumulative probability rather than quantiles), and helps us check for non-normally distributed residuals. We expect points to fall close to the diagonal line if the residuals are normal (they do here).  

#### Now that you have reviewed the output, answer the following questions for yourself about the full model (`raw_score` = *b*<sub>0</sub> + *b*<sub>1</sub>`age` + *b*<sub>2</sub>`pretest_score`) 
1. What does the Model R-square tell you for this model? That is, what percent of the variance in `raw_score` is explained by the model with age and pretest score as predictors?
2. What does the overall F-statistic and p-value tell you?  
3. What does the beta coefficient for `pretest_score` tell you?  
4. What does it mean that the t-statistic for the `age` variable is not significant in this model? How does it compare to the partial correlation test that we ran last week with the same variables?    



----------------------------------------------------------------------------

## Mediation  

*"Mediation is just three correlations in a trenchcoat" - Prof. Sanjay Srivastava (U Oregon Dept. of Psychology) on Twitter, July 2021*  


#### A note on using the term "mediate" in an ex

#### That's all for this part, have some fun in RStudio now!

----------------------------------------------------------------------------

## References

- Field, A.P. (2018). Discovering Statistics Using IBM SPSS Statistics. 5th Edition. London: Sage.  
- Hayes, A. F. (2017). Introduction to mediation, moderation, and conditional process analysis: A regression-based approach. Guilford publications.