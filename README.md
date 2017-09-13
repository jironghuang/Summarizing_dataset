# Function to summarize a dataset
1 way of summarizing a dataset and porting it over to a dataframe. I think this is an inefficient way of doing it since I loop across columns of dataframes - while this could be done in dpylr.  But here you go.

I think you can use sapply in the following way to loop across columns.

sapply(dat, function(x) 
      ifelse (x>0 & x< 0.2, "AA",ifelse(x>0.4 & x<0.6,"AB", "BB"))
)

Then you summarize using dpylr,
  summarize(avg = mean(rev_past4qtr, na.rm = TRUE),
            med = median(rev_past4qtr, na.rm = TRUE),
            min = min(rev_past4qtr, na.rm = TRUE),
            max = max(rev_past4qtr, na.rm = TRUE))

But somehow you need to cbind them to produce a dataframe.

If the number of columns are extradordinarily huge, I will thencome up with a more efficient function. 
