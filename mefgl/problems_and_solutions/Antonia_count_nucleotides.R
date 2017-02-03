## housekeeping
rm(list=ls())

#load packages
library(stringr)

#read in file and print text
dna_string=scan("rosalind_dna.txt", what="character")
dna_string

#counts
A_count = str_count(dna_string, "A")
C_count = str_count(dna_string, "C")
G_count = str_count(dna_string, "G")
T_count = str_count(dna_string, "T")

#return counts with spaces
dna_counts=cat(A_count, C_count, G_count, T_count)