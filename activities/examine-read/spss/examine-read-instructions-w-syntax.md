# Activity #2 - Examining distributions in SPSS

------------------------------------------------------------------------

## Learning Objectives

-   Set up a project directory and create an R markdown file (\*.Rmd) to document your work  
-   Read data from different file formats  
-   Examine variables and characterize their distributions using simple visuals:  
    -   histogram  
    -   quantile-quantile plot  
    -   box plot  

------------------------------------------------------------------------


## Step 1 - Import datasets for this activity

#### 2.1 download the files ["ice_bucket.csv"](../data/icebucket.csv), ["nhanes_selectvars_n500.csv"](../data/nhanes_selectvars_n500.csv), and ["cort-hypothetical.txt"](../data/cort-hypothetical.txt) (right-click, save as) -- put them somewhere on the machine where you have SPSS  
Here's a description of the ice bucket data from [Andy Field's discovr tutorial 02](https://www.discovr.rocks/discovr/):  
*The ice bucket challenge generated something like 2.3 million videos on YouTube. The data are stored in a csv file, which contains one variable **upload_day** that is the number of days after Chris Kennedy's initial challenge that each of 2,323,452 ice bucket related videos were uploaded to YouTube. For example, if the value is 21 it means that the video was uploaded 21 days after Chris Kennedy's initial challenge.*

Here is a link to [description of the NHANES variables in the full dataset](https://www.rdocumentation.org/packages/NHANES/versions/2.1.0/topics/NHANES) - you are going to work with a small subset of cases and variables. The data in "cort-hypothetical.txt" is hypothetical salivary cortisol values (nmol/L) generated for this activity.

#### 2.2 Start SPSS and import the ice_bucket.csv data (File -> Import -> CSV Data)

