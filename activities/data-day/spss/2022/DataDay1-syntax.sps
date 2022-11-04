* Encoding: UTF-8.
* Data Day 2022 - Statistical Methods in Psychology - Lobue & Bhanji - Nov 3, 2022.

 * First dataset: Nguyen.
 * Import Nguyen's data from tab-delimited text file.

 * Hypotheses/Research Questions and planned tests  

 * - What is the hypothesis examined? What variables are used to test the hypothesis?  
    
 * Post test scores for all measures should be higher than pre-test in the experimental compared to the control condition
    
 * Perspective taking post-pre will be greater in experimental compared to control

 * - What statistical tests will you use? What assumptions do they make?
    Independent samples t-test on post-pre scores. 
assumptions: normality, equal variances (or not)

 * - How will you treat extreme values? Missing data?
    
* Below: compute difference score for perspective taking

DATASET ACTIVATE DataSet1.
COMPUTE PT_postVpre=PT_post - PT_pre.
EXECUTE.



* Chart Builder. - Histogram of perspective taking difference post-pre
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=PT_postVpre MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: PT_postVpre=col(source(s), name("PT_postVpre"))
  GUIDE: axis(dim(1), label("PT_postVpre"))
  GUIDE: axis(dim(2), label("Frequency"))
  GUIDE: text.title(label("Simple Histogram of PT_postVpre"))
  ELEMENT: interval(position(summary.count(bin.rect(PT_postVpre))), shape.interior(shape.square))
END GPL.


* this didn't give us two histograms as expected, so we'll try the explore menu.
SORT CASES  BY Condition.
SPLIT FILE SEPARATE BY Condition.

* Chart Builder.
GGRAPH
  /GRAPHDATASET NAME="graphdataset" VARIABLES=PT_postVpre MISSING=LISTWISE REPORTMISSING=NO
  /GRAPHSPEC SOURCE=INLINE.
BEGIN GPL
  SOURCE: s=userSource(id("graphdataset"))
  DATA: PT_postVpre=col(source(s), name("PT_postVpre"))
  GUIDE: axis(dim(1), label("PT_postVpre"))
  GUIDE: axis(dim(2), label("Frequency"))
  GUIDE: text.title(label("Simple Histogram of PT_postVpre"))
  ELEMENT: interval(position(summary.count(bin.rect(PT_postVpre))), shape.interior(shape.square))
END GPL.

* turn off file split.
SPLIT FILE OFF.


* Using the explore menu to examine distributions of PTpostVpre in each group

EXAMINE VARIABLES=PT_postVpre BY Condition
  /PLOT BOXPLOT HISTOGRAM NPPLOT
  /COMPARE GROUPS
  /STATISTICS DESCRIPTIVES
  /CINTERVAL 95
  /MISSING LISTWISE
  /NOTOTAL.

 * distributions in each group look normal-ish.
*    let's run an independent samples t-test:

T-TEST GROUPS=Condition(1 2)
  /MISSING=ANALYSIS
  /VARIABLES=PT_postVpre
  /ES DISPLAY(TRUE)
  /CRITERIA=CI(.95).

 * The experimental group and control group did not significantly differ on their scores of perspective taking change, experimental M = XX, SD = XX, control M = , SD = , t(21) = 0.323, p = .750, d = 0.130.
