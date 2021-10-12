# SPSS Lab activity - Moderation and Mediation Models  

*Jamil Palacios Bhanji and Vanessa Lobue*  
*Last edited Oct 11, 2021*
  

## Goals for today  

-  Learn how to model the interaction of 2 continuous predictors in a linear regression model (with a continuous DV)  
    -  Mean centering for interpretation of main effects  
    -  Conduct the same moderation model using the extension PROCESS (Hayes, 2017)  
    -  visualize and interpret an interaction coefficient  
-	Mediation using linear regression for 1 hypothesized predictor (X), 1 mediator (M), and 1 outcome (Y) (all continous variables)  
    - Use PROCESS to examine test conditions for a mediation model    
    - identify total effect (c), indirect effect (a*b), direct effect (c')  
    - interpretation of coefficients  
    - discussion of effect size  
  


------------------------------------------------------------------------



## Step 0 - Get organized, import data  
- make a folder for today's activity  

- make a "data" folder (inside the project folder)  

- For this activity, we will use the same Lumosity dataset from last week, but with one new (imaginary) variable: "eyesight". You can download the file [lumos_subset1000pluseye.csv](../data/lumos_subset1000pluseye.csv)  

- make an "spss" folder (inside the project folder) for your SPSS files  


------------------------------------------------------------------------

#### Step 0.1 - Start SPSS and import the data  

*If you have installed the PROCESS macro for SPSS, check that you see a menu item under Analyze-\>Regression called "Process v4.0 by Andrew Hayes" - if you installed it before and don't see it now, you may have to run SPSS as an administrator (right-click on SPSS icon and select "run as administrator") -- if you don't have admin access on your computer please join forces with a partner who has the process macro installed already.* 

*Data description:* lumos_subset1000plusimaginary.csv is the same file we have been working with before. Today we will make use of a fabricated variable called *imaginary\_screensize* which gives the size of the screen on which users complete the tests - this is a simulated variable that is not part of the real dataset.  

This is subset of a public dataset of Lumosity (a cognitive training website) user performance data. You can find the publication associated with the full dataset here:  
[Guerra-Carrillo, B., Katovich, K., & Bunge, S. A. (2017). Does higher education hone cognitive functioning and learning efficacy? Findings from a large and diverse sample. PloS one, 12(8), e0182276. https://doi.org/10.1371/journal.pone.0182276](https://doi.org/10.1371/journal.pone.0182276)


**Import the data:** Open SPSS and use File -\> Import Data-\> CSV or Text Data  - now check the variable types and add labels if you wish. **Careful! If you use "import text data" make sure you set the only delimiter as "comma"** (SPSS may automatically also treat "space" as a delimiter, so uncheck that option)    

**What to do next:**  

- look at the format of the data file - each row has all measures for 1 individual ("ID" is the unique identifier)  
- check the data types for each variable (gender, as nominal, ...) - we will exclusively be using `ID`, `age`, `raw_score`, `imaginary_screensize`, and `eyesight_z`, so you can ignore the other variables for this activity   
   
------------------------------------------------------------------------

## Step 1 - Moderation - when the relation between two variables depends on the level of another variable    

![Moderation](../images/moderation-model.png){width=50%}  

**Above: the conceptual model of moderation**  

![Moderation](../images/moderation-statmodel.png){width=50%}  

**Above: the statistical model of moderation** - *notice that X1 and X2 are interchangeable in the statistical model (i.e., the statistical model does not distinguish between the predictor and the moderator)*  


Previously, when we looked just at `age` and `raw_score`, we saw a small association such that older participants scored lower. But what if that association depended on another variable, such as the size of their screen? That is, maybe older individuals do worse than younger individuals only if they are working on a small screen? Such a relationship would be an example of an *interactive effect*, or *moderation* (i.e., screen size *moderates* the effect of age on raw score, or it might equally be stated that age moderates the effect of screen size on raw score).  
So far, the data we have worked with are real values from Lumosity, but for this step there is a simulated imaginary variable called `imaginary_screensize` - just for educational purposes. In the moderation model we will test, `age` is X1 (predictor), `imaginary_screensize` is X2 (moderator), and `raw_score` is Y (outcome).   

#### Step 1.2 - model an interaction between 2 continuous variables  
As depicted in the statistical model of moderation graphic above, we test a moderation with a regression model where the outcome (Y) is explained by a predictor (X1), a moderator (X2), and their product (X1\*X2, called the interaction of X1 and X2). To start out will use the same linear regression model that we were using last week.  
**Try it now:**  
1. First, create a new variable called `ageXscreensize` by using the Transform-\>Compute Variable menu (the Numeric Expression should be "age*imaginary_screensize")  
2. Now go to Analyze-\>Regression-\>Linear and specify

  - `raw_score` as the Dependent  
  - `age`, `imaginary_screensize`, and your new variable `ageXscreensize` as Independents (all in Block 1)  
  - select options under "Statistics" and "Plots" for anything you want (at least add confidence intervals, collinearity diagnostics, and plots of ZPRED vs ZRESID, and a normal probabilty plot of model residuals)  
  - click OK to estimate the model  

####  Examine the model output  

1. Scan through the Model Summary (we can reject the null hypothesis that all coefficients are zero) and then focus on the **Coefficients Table**. Notice that there are coefficient estimates for `age`, `imaginary_screensize`, and their interaction `ageXscreensize`.  

2. The positive coefficient (with low p-value) for the interaction term suggests that at larger screensize values, the relation of age to performance is more positive (less negative to be precise) than at smaller screensize values. Equally, we could restate it: at older age values, the relation of screensize to performance is more positive/less negative. The coefficient for the interaction term has the same meaning as the other coefficients: that an increase in one unit of the predictor predicts an increase in .002 units of the outcome -- of course the predictor in this case is the product of two variables, so interpretation takes a little more work, which we will do in step 1.4.  

3. But we now have issues with the interpretation of the coefficients for the main effects of `age` and `imaginary_screensize`. **The coefficient for a single variable in a model represents the effect of that variable when other terms are zero.** So the coefficient for `imaginary_screensize` (the main effect of screensize) now represents the effect of screensize at age=0. Likewise, the coefficient for `age` represents the effect of age when screensize=0. Neither effect is interpretable, because of the presence of the interaction.    

#### Step 1.3 - Make the main effects interpretable by mean-centering the variables  
- If we subtract the mean age from each value of `age` and store it in a new variable called `age_cent` (and do the same for `imaginary_screensize_cent`), then we can enter these new variables into the regression instead. Then we will compute the interaction term as the product of these two centered variables. Then we will be able to interpret the resulting main effect coefficients (as, e.g., the effect of age at the mean value of screen size).

- Create these new "centered" variables using SPSS Syntax (this is the easiest/quickest method given in SPSS documentation)  
    - here is the code you will enter into a Syntax window (File-\>New-\>Syntax if you do not already have a syntax window open):  

> \*Create new variables storing the means of original variables.  
> aggregate outfile * mode addvariables  
> /mean\_age = mean(age)  
> /mean\_screensize = mean(imaginary\_screensize).  
> \*Subtract mean from original values.  
> compute age\_cent = age - mean\_age.  
> compute screensize\_cent = imaginary\_screensize - mean\_screensize.  
> compute age\_centXscreensize\_cent = age\_cent * screensize\_cent.  

   - highlight (select) the code in the Syntax window and click the big green triangle to run the selection - due to a quirk of SPSS you may need to run the selection twice    
   - you should see new variables called `age_cent`, `screensize_cent`, and `age_centXscreensize_cent` in your file  
   - We should have actually first selected only the cases that have valid values for all the columns we are using (`age`, `imaginary_screensize`, `raw_score`) - this is not really necessary because all cases have valid values in this data -  but it is good practice to always be mindful of how many complete cases you have for a given set of variables, as it will affect calculations such as mean-centering.   

- Then run a new model that is the same as the last one except you use the centered variables (and interaction of the centered variables) as the predictors.  

##### Now look at the output and notice:  
- the model F-statistic didn't change, it is still significant (low p-value indicates the data and observed F-stat are unlikely under the null hypothesis [that the true value of all coefficients is zero] )  

- the coefficient (and statistics) for the interaction term didn't change (it is positive and the t-stat for the coefficient is the same), but the coefficients (and t-stats) for `age_cent` and `screensize_cent` differ from the uncentered version. When an interaction effect is included in a model, centering the variables allows us to interpret the main effects in these two ways (from Field textbook p.792): "(1) they are the effect of that predictor at the mean value of the sample; and (2) they are the average effect of the predictor across the range of scores for the other predictors" - Importantly, `age` is not a significant predictor in this model, meaning that if we hold screen size constant at its mean value then age is not significantly related to performance.     
 
#### Step 1.4 - Calculate simple slopes to interpret the interaction  

- When age was the only predictor in the regression, we could easily visualize the linear relationship by plotting the regression line (e.g. over a scatter plot), but the (significant) interaction is telling us that the effect of age is different for different levels of screen size - we can't depict that with a single line. Instead, we will compute the effect of one variable (`age`) at different levels of another variable - (`imaginary_screensize`). We will calculate the effect of `age` at mean and +/- 1SD of `imaginary_screensize` - and this will give us an idea of how the effect of age varies at different levels of screensize. This is called a ***simple slopes analysis***.  
- We will use the PROCESS tool to do this. Go to Analyse-\>Regression-\> "Process v4.0 by Andrew Hayes":
    - specify `raw_score` as the Y variable  
    - specify `age` as the X  
    - specify `imaginary_screensize` as the Moderator W  
    - select Model number 1  
    - Under Options, select "all variables that define products" under "Mean center for construction ..."  
    - Under Options, select "-1SD, Mean, +1SD" under "conditioning values"  
    - Under Options, select "Johnson-Neyman output"  
    - Under Long variable names, select "accept the risk", but be warned that the first 8 characters of any variable names in the dataset must be unique  

#### Understand the output and interpret the interaction  

- The Model Summary values and coefficients should be the same as the model you ran earlier with the centered variables.  
- The "Test of the highest order unconditional interactions" is useful because the values for X*W give you R-squared change attributable to the interaction term (R-squared for the model with versus without the interaction) ***this is a useful effect size measure***  
- the "Conditional effects of the focal predictor at values of the moderator" gives us the ***simple slopes analysis*** that we wanted. It tells us that at a low screensize value (mean - 1 SD) the effect of age is significantly negative, but at mean and higher values the effect of age is less negative and not significant (looking at the "Effect" values). For example, when screensize is -13.29 units below the mean value, the effect of age is -.0422, meaning that (if we hold screensize constant at that value) an increase of 1 year of `age` predicts a decrease of .0422 units of `raw_score`.  
- the "Johnson-Neyman significance region" give us the critical values of the moderator that yield a significant (p<.05) effect of the predictor. For example, at values of `imaginary_screensize` less than 4.81 units below the mean, the effect of age is significantly negative, and at values of `imaginary_screensize` more than 29.54 units above the mean, the effect of age is significantly positive.  

##### Now that you've looked at the output, answer the following questions about the model in your notes:  
1) What is the relation between age and performance (`raw_score`) when screen size is held at a low value?  
2) What is the relation between age and performance when screen size is held at its average (mean) value?  
3) What is the relation between age and performance when screen size is held at a large value?  
4) Can you translate those "significance regions" cutoffs into the original (not mean-centered) `imaginary_screensize` units?  



----------------------------------------------------------------------------

## Step 2: Mediation model    

![Mediation chart](../images/mediation-model.png)

*Above: the simple three variable model of mediation - notice that X and M are distinguished in the model (unlike X1 and X2 in the statistical moderation model)* 

#### What is Mediation?  
**Mediation** refers to a situation when the relationship between a predictor variable (X in the chart above) and an outcome variable (Y in the chart above) can be explained by their relationship to a third variable (the mediator, M).  
Forget about the screen size variable for a moment and consider possible explanations for the negative relation between age and performance that we saw when `age` was our only predictor for `raw_score`.  
Maybe part of the relation could be explained by something like eyesight that deteriorates with age. The data file you imported for this activity has a new (simulated/imaginary) variable called `eyesight_z` which is an eyesight "score" where higher values indicate better eyesight (it has been scaled such that the sample mean is 0 and the s.d. is 1).  

We will test a mediation model where `eyesight_z` explains the relation between `age` and `raw_score`.  

**A note about causality:** In this model we have good reasons for thinking the direction of the relationships is as specified in the mediation model (i.e., it would not be possible for a change in eyesight to cause a change in age, or for a change in test performance to cause a change in eyesight) but there may be many unmeasured variables that could be involved. The test of our mediation model will tell us whether the `eyesight_z` measure accounts for a "significant" part of the relationship between `age` and `raw_score`.  
There are the four conditions for our mediation model test, which are tested with three regression models. **First we will list the regression models (coefficients of each model are different so we'll refer to them each with unique subscripts instead of the usual *b*<sub>0</sub>, *b*<sub>1</sub> terminology):**   

1. `Y` = intercept + *b*<sub>1</sub>`X`  
    - *b*<sub>1</sub> *gives us path c in the chart, also referred to as the "total effect"*  
2. `M` = intercept + *b*<sub>2</sub>`X`     
    - *b*<sub>2</sub> *gives us path a in the chart*  
3. `Y` = intercept + *b*<sub>3</sub>`X` + *b*<sub>4</sub>`M`     
    - *b*<sub>3</sub> gives us path c' in the chart (also called the "direct effect")  
    - *b*<sub>4</sub> gives us path b in the chart   
    
We use these three models to check four conditions of mediation (section 11.4.2 of the Field textbook):  
1. the predictor variable must significantly predict the outcome variable in model 1 (c is significantly different from 0)  
2. the predictor variable must significantly predict the mediator in model 2 (a is significantly different from 0)  
3. the mediator must significantly predict the outcome variable in model 3 (b is significantly different from 0)  
4. the predictor variable must predict the outcome variable less strongly in model 3 than in model 1  (c' is closer to 0 than c, in other words, the direct effect is smaller than the total effect)  

  - **how much smaller should the direct effect be (compared to the total effect)?** A perfect mediation would reduce the direct effect to zero, but that rarely actually happens.  
  - to assess whether there is a significant reduction (from c to c') we will instead test whether a\*b (called the "indirect effect", literally *b*<sub>2</sub> times *b*<sub>4</sub> from our series of regression models) is significantly different from zero.  
  - Significance of a\*b can be assessed with (a) a Sobel test (textbook section 11.4.2) or (b) by using a bootstrap method to estimate a confidence interval around a\*b (we will use bootstrapped confidence intervals).  
  - The PROCESS macro for SPSS gives us a bootstrapped 95% confidence interval around a\*b, so if the interval does not contain zero, then we can say there is a significant mediation (or, more precisely, we reject the null hypothesis that the indirect effect is zero). **Bootstrapping** involves taking thousands of repeated random samples of cases from our data (with replacement, so the same case can be included more than once in one repetition) and building a sampling distribution of our parameter of interest from those random samples (they are samples of a sample, hence the term "bootstrapping"). From that sampling distribution we can estimate our parameter of interest (a\*b) and a confidence interval around it.     
    
- You may read some arguments that not all of those 4 conditions are necessary to have evidence of mediation (e.g., c may not be different from 0) but these 4 conditions are a straightforward method to assess a mediation model, so let's get on with it and assess our mediation model (that `eyesight_z` explains the relation between `age` and `raw_score`)      


*Note that we are using a series of linear regression models to test the mediation model, so the assumptions that we need to check are the same ones we discussed in the multiple regression lab activity, and the same as the ones we should have checked in the moderation examlpe above (but also notice that we will be using bootstrapping to estimate the mediated effect, which eases concern over significance tests on the parameter estimate when assumptions are violated). We won't check assumptions here (to save a little time) but it is a good exercise check the plots of residuals from each model if you have extra time.*   

#### Step 2.1 - What are the models that we will use to test the four conditions of mediation?  
`X` corresponds to `age`, `Y` to `raw_score`, and `M` to `eyesight_z`, so the three models we use to test the conditions are:  
1. `raw_score` = intercept + *b*<sub>1</sub>`age`  *b1 = path c*  
2. `eyesight_z` = intercept + *b*<sub>2</sub>`age`  *b2 = path a*     
3. `raw_score` = intercept + *b*<sub>3</sub>`age` + *b*<sub>4</sub>`eyesight_z`  *b3 = path c'* and *b4 = path b*

#### Step 2.2 - Use the PROCESS macros to estimate the three models  
Go to Analyse-\>Regression-\> "Process v4.0 by Andrew Hayes": 
    - specify `raw_score` as the Y variable  
    - specify `age` as the X  
    - specify `eyesight_z` as the M  
    - make sure to remove `imaginary_screensize` as the Moderator W if it is still in their from before    
    - select **Model number 4** (this refers to Hayes' label for  a mediation model, unrelated to our description of the 3 regression models that are used to test a mediation)  
    - Under Options, select "Show total effect model ..."  
    - Under Options, select "Standardized effects ..."  
    - Under Long variable names, select "accept the risk", but be warned that the first 8 characters of any variable names in the dataset must be unique  
    - Click OK to estimate the models (this will run the three regression models that we discussed above as required for evidence of mediation)  

#### Step 2.3 - Understand the output of PROCESS    

Let's look closely at the output from top to bottom:  

- the section starting with `OUTCOME VARIABLE: eyesight` corresponds to **model #2** of the three models we use to test the mediation.  
    - the `coeff` value for the `age` row gives us *b*<sub>2</sub> (path a)  
    - the `LLCI` and `ULCI` columns give us the lower (LLCI) and upper (ULCI) limits of the 95% confidence interval around each parameter  
    - other columns are labeled similarly to model output you saw in the linear regression lab activity  
- the section starting with `OUTCOME VARIABLE: raw_scor` corresponds to **model #3** of the three models we use to test the mediation. 
    - the `coeff` for `age` gives us *b*<sub>3</sub> a.k.a path c' a.k.a. the direct effect   
    - the `coeff` for `eyesight` gives us *b*<sub>4</sub> a.k.a. path b  
- the section starting with `TOTAL EFFECT MODEL` corresponds to model #1 of the three models we use to test the mediation  
    - the `coeff` for `age` gives us *b*<sub>1</sub> a.k.a path c a.k.a. the total effect (it's the same as the coefficient we got last week when we entered `age` as the only predictor for `raw_score`)  
- **at this point, take a moment** to recognize that the **first three of our four conditions** are satisfied (a, b, and c are significantly different from 0)  

- now look at the section starting "TOTAL, DIRECT, AND INDIRECT EFFECTS OF X ON Y"  
    - the "effect" estimate for the total and direct effects are the same as the coefficients we described above  
    - the "effect" estimate for the "indirect effect of X on Y" **gives us a\*b a.k.a the indirect effect**.    
    - notice that the indirect effect estimate is equal to our estimate of path a multiplied by our estimate of path b (-.0066\*4.1946 = -.0276), telling us that a *1 unit increase in `age` predicts a -.0276 change in `raw_score`*, considering the indirect path only    
    - the confidence interval around the indirect effect lets us check the **last of the four conditions** of our mediation test - if the 95% confidence interval includes 0, then the condition is not satisfied, but if the limits are both below 0 or both above 0 then we can say that the indirect effect a\*b is "significant"  
    - the "effect" estimate for the "Completely standardized indirect effect ..." is a standardized form of the a\*b coefficient, meaning an increase of one standard deviation in `age` predicts that much decrease in `raw_score` through the indirect path only  
    
#### Answer the following questions in your notes (these are the pieces of information you would report in a manuscript):
1. What is the "total effect" (path c) of age on performance? (coefficient, standard error of the coefficient, confidence interval around the coefficient, R<sup>2</sup>, F, p)  
2. What is the relation of age to eyesight (path a)? (coefficient, standard error of the coefficient, confidence interval around the coefficient)  
3. What is the relation of eyesight to performance, controlling for age (path b)? (coefficient, standard error of the coefficient, confidence interval around the coefficient)  
4. What is the "direct effect" of age on performance, controlling for eyesight (path c')? (coefficient, standard error of the coefficient, confidence interval around the coefficient)  
5. What is the indirect effect of age on performance, through eyesight (path a\*b)?  (coefficient, standard error of the coefficient, confidence interval around the coefficient) 

- One last question to think about: Why didn't we consider `imaginary_screensize` in a mediation model?  

##### A note on effect size measures for the indirect effect  
The "Completely standardized indirect effect(s) of X on Y" section produced by PROCESS is essentially a standardized regression coefficient, and as such it can be compared across studies (and is useful for meta-analyses). We could try to compute something similar to R<sup>2</sup>, but all of these measures cause difficulties with how we interpret them, so we may be better off sticking with the standardized indirect effect measure (see the Field textbook section 11.4.3 for full discussion).  


#### That's all for this part, have some fun in RStudio now!

----------------------------------------------------------------------------

## References

- Field, A.P. (2018). Discovering Statistics Using IBM SPSS Statistics. 5th Edition. London: Sage.  
- Hayes, A. F. (2017). Introduction to mediation, moderation, and conditional process analysis: A regression-based approach. Guilford publications.