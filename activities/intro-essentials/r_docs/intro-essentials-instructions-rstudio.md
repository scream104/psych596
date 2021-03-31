## Introduction - R with RStudio

*updated Mar 18 2021 - this document is an in class guide to accompany Prof. Andy Field's [Getting Started in R and RStudio](http://milton-the-cat.rocks/learnr/r/r_getting_started/#section-overview)*

### 1. Start by installing R and RStudio on your computer

-   if you alread have R and Rstudio installed, make sure you have an R version 4 or greater (e.g., 4.0.4), and RStudio 1.4 or greater

    -   to check your R version, run `getRversion()` in the RStudio console
    -   to check your RStudio version use the RStudio -\> About menu

-   You can follow text instructions [from Garrett Grolemund's book *Hands on Programming with R*](https://rstudio-education.github.io/hopr/starting.html)

### 2. Install essential packages

2.1 In the Console window pane type the following commands one line at a time:          `install.packages("remotes")`  
  `remotes::install_github("profandyfield/discovr")`  
  `install.packages("tidyverse")`  
  ![Console Pane screenshot](../images/ConsolePane.png)

Essentials - instructor walk through or let students go through discovr_01 on their own, then sum up essential learning points

2.1 Orientation to RStudio (Panes, variables, functions, markdown, code chunks, ...)\
2.2 Install these packages:\
- asdf `install.packages("remotes")`\
- asdf `remotes::install_github("profandyfield/discovr")`\
- `install.packages("tidyverse")`\
2.3 Reading data -\
- Cover long/tidy vs wide data formats\
- Example format conversion with `pivot_longer()`, `pivot_wider()` (preferred over `gather()`, `spread()`)\
2.4 Writing data\
- use `write_delim()`
