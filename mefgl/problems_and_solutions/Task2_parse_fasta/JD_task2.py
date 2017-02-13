#!/usr/bin/python

from Bio import SeqIO, SeqFeature
from Bio.Seq import Seq
from Bio.Alphabet import generic_dna

for seq_record in SeqIO.parse("Task2_sequences.fasta", "fasta"):
	print(seq_record.id)
  	print(len(seq_record))

my_file = open("Task2_sequences.fasta")
dna_string = my_file.read()
A_nuc = dna_string.count("A")
C_nuc = dna_string.count("C")
T_nuc = dna_string.count("T")
G_nuc = dna_string.count("G")
print("A = " + str(A_nuc) + " " "C = " + str(C_nuc) + " " "T = " + str(T_nuc) + " " "G = " + str(G_nuc))
