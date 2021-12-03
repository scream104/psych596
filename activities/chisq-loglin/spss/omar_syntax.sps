* Encoding: UTF-8.

DATASET ACTIVATE DataSet1.
RECODE LoyalMisalignedRating (1 thru 7=1) (ELSE=0) INTO loyal_misalign_dummy.
VARIABLE LABELS  loyal_misalign_dummy 'loyal_misaligned'.
EXECUTE.
RECODE LoyalAlignedRating (1 thru 7=1) (ELSE=0) INTO loyal_align_dummy.
VARIABLE LABELS  loyal_align_dummy 'loyal_aligned'.
EXECUTE.
RECODE RandomMisalignedRating (1 thru 7=1) (ELSE=0) INTO rand_misalign_dummy.
VARIABLE LABELS  rand_misalign_dummy 'rand_misaligned'.
EXECUTE.
RECODE RandomAlignedRating (1 thru 7=1) (ELSE=0) INTO rand_align_dummy.
VARIABLE LABELS  rand_align_dummy 'rand_aligned'.
EXECUTE.



COMPUTE loyalcond=loyal_misalign_dummy + loyal_align_dummy.
EXECUTE.
COMPUTE misaligncond=loyal_misalign_dummy + rand_misalign_dummy.
EXECUTE.

