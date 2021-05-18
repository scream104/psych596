# Activity #2 - Import and examine data in SPSS  
*updated Mar 16 2021*

------------------------------------------------------------------------

## Learning Objectives

-   Read data from different file formats  
-   Get descriptives and characterize their distributions using simple visuals:  
    -   histogram  
    -   quantile-quantile plot  
    -   box plot  

------------------------------------------------------------------------


## Step 1 - Downlad datasets for this activity

Download ["nhanes_selectvars_n500.csv"](../data/nhanes_selectvars_n500.csv), and ["cort-hypothetical.txt"](../data/cort-hypothetical.txt) (right-click, save as) -- put them somewhere on the machine where you have SPSS  

[NHANES is a large public health dataset](https://www.rdocumentation.org/packages/NHANES/versions/2.1.0/topics/NHANES) - you will work with a small subset of cases and variables.  
The data in "cort-hypothetical.txt" is hypothetical salivary cortisol values (nmol/L) generated for this activity. It is in a tab-delimited format with each line containing ID and cortisol value.  

## Step 2 - Import the NHANES data into SPSS  

Start SPSS and import the ice_bucket.csv data:  

- File -\> Import Data-\> Text Data  
- Go through the dialog boxes to import. The first line contains variable names and the delimiter is "Comma"  
- Pay attention to the variable type and measure type of each column. What happens to the columns that have "NA" values? Make sure that the "Height" and "Age" columns are variable type "Numeric" and measure type "scale".  

#### 3.1 Get descriptives and check the distribution of “Height” 
-   Use "Analyze" -\> "Descriptive Statistics" -\> "Explore", and then click "Plots" and select "Normality plots with tests" - then put "Height" in the **Dependent List** and click "OK"
-   find the mean, median, and standard deviation in the output
-   Describe the distribution in your own words. Why does the boxplot show so many outliers at low values?
-   Is Height normally distributed in this sample?

#### 3.2 Filter by Age

-   Now let’s restrict the plots to individuals age 18 or older. Use  "Data" -\> "Select Cases" -\> "If condition is satisfied"
-   Now make a new histogram, box plot, and q-q plot of height using just those individuals (you can use the filter() or subset() function).
-   Describe the distribution again.

## Step 4 - Applying a transformation

#### 4.0 Imagine a subset (N=400) of the NHANES participants gave saliva samples 
- The lab sent you a file “cort-hypothetical.txt” containing an ID and cortisol measurement on each line, separated by a tab (“\\t”).

- Read the text file into SPSS using the same method as before, but specify that the delimiter is "Tab" - note that some values
are “qns” which stands for “quantity not sufficient” and should be
treated as missing values.

- Notice that this gives you a new data window (and will save as a separate *.sav file)  

#### 4.1 Now check out the distribution of “cortisol\_baseline” - use the tools you've learned so far

- Describe the distribution of cortisol\_baseline in your notes.

#### 4.2 Log transform the cortisol measure  

- log transformation of a variable can be useful for some measurements with positively skewed distributions, and it is a common practice with salivary cortisol.

- Use Transform-\> Compute Variable to create a new column, containing the natural logarithm (use the Arithmetic: ln function) of each cortisol measurement. 

- Now, describe the log-transformed cortisol measurement, using the same method as above



