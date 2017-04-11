
## try http:// if https:// URLs are not supported
# you only need to download it one
source("https://bioconductor.org/biocLite.R")
biocLite("Biostrings")

# in the future all you need is to load the package
library("Biostrings")

# save the ss sequqnece as a string and give it a name, here I called it DNA
DNA<-"TTCTCTTTTCTCTTTTCTCTTTTCTCTTTGTTCTCTTTTCTCTTTTCTCTTATTCTCTTATTCTCTTGGTTTTTCTCTTCTAGGTTCTCTTTTCTCTTGCAAAACTCCGGGGTTCTCTTTTCTCTTGTTTCTCTTTTCTCTTTTTCTCTTATTCTCTTTGATTCTCTTACGCTTCTCTTTGATTCTCTTCGATGTTTCTCTTGTTTCTCTTATTTCTCTTTTCTCTTGTTCTCTTTTCTCTTCAGATTCTACTTTCTCTTGTTCTCTTTTCTCTTTTCTCTTCGTTATTTCTCTTGTGTATTCTCTTTAACATTTCTCTTCTTCTCTTTTTCTCTTAATGGACATGCTTTCTCTTTTCTCTTTTCTCTTGTGACTTCTTTTTCTCTTATTCTCTTTTCTCTTAAGCTTCTCTTCATTCTCTTTTTCTCTTGTTCTCTTTCCTGTTTCTCTTGCTTCTCTTTTCTCTTTTCTCTTATCAATTCTCTTATTTTCTCTTCAGTTCTCTTCAAGCGAGGGTGCCTTCTCTTTGGGTTCTCTTCGTTCTCTTAATTTCTTCTCTTCTTTCTCTTTTTCTCTTACTTCTCTTGGGTGGTTCTCTTCCTCGACAGTGACTGGGACAAGTTCTCTTCTTCTCTTTTTCTCTTGCTGTCACCCTTCTCTTCATTCTCTTATTCTCTTACTTTCTCTTGATATTCTCTTTTCTCTTCTTCTCTTGATTCTCTTGATTCTCTTTTCTCTTCTTCTCTTCCTTCTCTTTGCCTCAGTTTCTCTTTTCTCTTTTCTCTTGTTCTCTTCGTTCTCTTTAGACATTCTCTTAACGTTCTCTTGGCGCCTAAGCGAGCCACTTCTCTTATCACTTGATTTCTCTT"
str(DNA)

# use matchPatter (from Biostring package) to find the tt string in the ss (DNA) string 
matchPattern("TTCTCTTTT", DNA) 

# In order to print the list of all start locations of tt I found  vmatchPatter (from Biostring package) more useful
# vmatchPatter produces an MIndex, which can be use with startIndex, below. 
# see ?matchPattern for more information of both functions
result<-vmatchPattern("TTCTCTTTT", DNA) 

# print results to screen
result

# prints a list containing the starting positions of the matches for each patter
startIndex(result)

# prints a list containing the ending positions of the matches for each pattern
endIndex(result)

# prints an integer vector containing the number of matches for each pattern
elementNROWS(result)
