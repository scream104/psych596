# Activity #2 - Import and examine data in SPSS  
*updated Mar 16 2021*

------------------------------------------------------------------------

## Learning Objectives

-   Set up a project directory and create an R markdown file (\*.Rmd) to document your work

-   Import data from text (csv or tab-delimited)

-   Get descriptives and characterize distributions using simple visuals:

    -   histogram

    -   quantile-quantile plot

    -   box plot

-   Run a normality test (shapiro-wilk)

-   Transform a variable  

-   Reshape a tibble (wide to long and long to wide)  

------------------------------------------------------------------------



## Step 1 - Get organized and download datasets for this activity

#### 1.1 Set up a typical project work flow consisting of a project folder containing

-   "data" folder to store raw data files for this activity  
    
-   "spss" folder to store all spss files for this activity  

-   "r_docs" folder to store your lab notes in R markdown  


#### 1.2 Download these files:  
- ["nhanes_selectvars_n500.csv"](../data/nhanes_selectvars_n500.csv)  
- ["cort-hypothetical.txt"](../data/cort-hypothetical.txt)  
(right-click, save as) and move each to the "data" folder in your project folder  

[NHANES is a large public health dataset](https://www.rdocumentation.org/packages/NHANES/versions/2.1.0/topics/NHANES) - you will work with a small subset of cases and variables.  
The data in "cort-hypothetical.txt" are hypothetical salivary cortisol values (nmol/L) generated for this activity. It is in a tab-delimited format with each line containing ID and cortisol value.  

## Step 2 - import the data into SPSS  

Start SPSS and import the *nhanes\_selectvars\_n500.csv* data file:  

- File -\> Import Data-\> Text Data  
- Go through the dialog boxes to import. The first line contains variable names and the delimiter is "Comma"  
- Pay attention to the variable type and measure type of each column. What happens to the columns that have "NA" values? Make sure that the "Height" and "Age" columns are variable type "Numeric" and measure type "scale".  
- Open a file to save your notes on this activity (use whatever text editor/word processor you prefer, or take notes directly into an SPSS syntax file: File->New->Syntax)  

## Step 3 - get descriptives and examine the distribution  

#### 3.1 Get descriptives and check the distribution of “Height” 
-   Use "Analyze" -\> "Descriptive Statistics" -\> "Explore", and then click "Plots" and select "Normality plots with tests" - then put "Height" in the **Dependent List** and click "OK"
-   find the mean, standard deviation, 95% confidence interval around the mean, and the median in the output
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

## Step 5 - Re-structuring data (wide to long and back again)  

-   Did you watch the video about "tidy" data? Would you say that the cortisol data tibble is "tidy" right now (take a look at the tibble by clicking on it in the Environment tab of RStudio)? Assume that cortisol_t1 and cortisol_t2 are the same measure (salivary cortisol) taken at two timepoints.  
-   We will discuss what "tidy" data means when we re-group, but for now let's practice restructuring the data using the "Restructure" option in the "Data" menu.  
-   Before you do this, you'll need to delete the "logcortisol_t1" variable that you created (right-click the variable name and select "clear")   

#### Step 5.1 - Use "Data->Restructure" to format the data from a wide format to long   
 - you should end up with 3 columns: `ID`, `time`, and `cortisol`, with 2 rows for each ID (for t1 and t2)
 - Here is a description of how to do the restructuring:
   - Click Data->Restructure  
   - select "Restructure variables into cases" (click next)  
   - select "one group" (click next)  
   - Case group identification is "use selected variable", select "ID"  
   - rename the target variable to "cortisol"  
   - move "cortisol_t1" and "cortisol_t2" into the "Variables to be transposed" list (click next)  
   - create "One" index variable (click next)  
   - use "Sequential values" as index values  
   - edit the Index variable name and label to both be "time" (click next)  
   - "Finish" - this will create a new spss data file that you can save  
 - does the new data table look the way you expected?  
 

#### Step 5.2 - Use "Data->Restructure" to format the data from a long formate back to wide  

- you should end up with the data in the format that you started with  
  - Click Data->Restructure  
   - select "Restructure cases into variables" (click next)  
   - the identifier variable is "ID"   
   - the index variable is "time" (click next)  
   - select "sort the data" (click next)  
   - "Finish" 
   - does the new data table look the way you expected?  

## That's all for the SPSS part - save your notes and move on to the R/RStudio activity when you are ready  
