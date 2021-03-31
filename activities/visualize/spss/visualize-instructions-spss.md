# Activity #2 - Examining distributions in SPSS  
*updated Mar 16 2021*

------------------------------------------------------------------------

## Learning Objectives

-   Read data from different file formats  
-   Examine variables and characterize their distributions using simple visuals:  
    -   histogram  
    -   quantile-quantile plot  
    -   box plot  

------------------------------------------------------------------------


## Step 1 - Downlad datasets for this activity

Download ["ice_bucket.csv"](../data/ice_bucket.csv), ["nhanes_selectvars_n500.csv"](../data/nhanes_selectvars_n500.csv), and ["cort-hypothetical.txt"](../data/cort-hypothetical.txt) (right-click, save as) -- put them somewhere on the machine where you have SPSS  

Here's a description of the ice bucket data from [Andy Field's discovr tutorial 02](https://www.discovr.rocks/discovr/):  
*The ice bucket challenge generated something like 2.3 million videos on YouTube. The data are stored in a csv file, which contains one variable **upload_day** that is the number of days after Chris Kennedy's initial challenge that each of 2,323,452 ice bucket related videos were uploaded to YouTube. For example, if the value is 21 it means that the video was uploaded 21 days after Chris Kennedy's initial challenge.*

Here is a link to [description of the NHANES variables in the full dataset](https://www.rdocumentation.org/packages/NHANES/versions/2.1.0/topics/NHANES) - you are going to work with a small subset of cases and variables. The data in "cort-hypothetical.txt" is hypothetical salivary cortisol values (nmol/L) generated for this activity.

## Step 2 Read the data into SPSS
Start SPSS and import the ice_bucket.csv data (File -> Import -> CSV Data)

## Step 3 - Examine ice bucket data - frequency distribution
3.1 Check out the frequency distribution of “upload_day”. You can use the Analyze -> Descriptive Statistics -> Explore -> Plots -> (check "histogram" and "normality plots with tests"

In your notes (either in the output document using "insert new text" or in a separate text doc), describe the modality (how many peaks) and skew of the distribution

## Step 4 - Examine NHANES data

#### 4.0 Read NHANES data into SPSS
Pay attention to the variable type and measure type of each column. What happens to the columns that have "NA" values? Make sure that the "Height" and "Age" columns are variable type "Numeric" and measure type "scale".

#### 4.1 Check out the distribution of “Height” 
-   Plot a histogram, boxplot, and quantile-quantile plot of “Height” 
-   Describe the distribution shape in your own words. Why does the boxplot show so many outliers at low values?
-   Is Height normally distributed in this sample?

#### 4.2 Filter by Age

-   Now let’s restrict the plots to individuals age 18 or older. Use  "Data" -> "Select Cases" -> "If condition is satisfied"
-   Now make a new histogram, box plot, and q-q plot of height using just those individuals (you can use the filter() or subset() function).
-   Describe the distribution again in your own words.

## Step 5 - Applying a mathematical transformation

#### 5.0 Imagine a subset (N=400) of the NHANES participants gave saliva samples The lab sent you a file “cort-hypothetical.txt” containing an ID and cortisol measurement on each line, separated by a tab (“\\t”).

Read the text file into SPSS - note that some values
are “qns” which stands for “quantity not sufficient” and should be
treated as missing values.

#### 5.1 Now check out the distribution of “cortisol\_baseline” - use the tools you've learned so far

Describe the distribution of cortisol\_baseline in your notes.

#### 5.3 Log transformation of a variable can be useful for some measurements with positively skewed distributions, and it is a common practice with salivary cortisol.

5.3.1 Use Transform-> Compute Variable to create a new column, containing the natural logarithm (use the Arithmetic: ln function) of each cortisol measurement. Then, describe the distribution of the log-transformed cortisol measurement.



