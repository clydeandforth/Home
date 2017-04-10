## Before running, requires:

## install.packages(stringr)

## Load necessary library
library(stringr)

## Read in file containing string on 1st line and substring on 2nd line
seqs <- file("task6_data.txt","r")

## Make variables containing contents of each line
string <- readLines(seqs,n=1)
substring <- readLines(seqs,n=2)

close(seqs)

## Locate start and end coordinates of each 'substring' match within 'string'
output  <- str_locate_all(pattern = coll(substring), string)

## Write output
write.table(output)
