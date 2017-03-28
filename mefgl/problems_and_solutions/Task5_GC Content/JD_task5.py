#!/home/james.doonan/anaconda2/bin/python

from Bio.Seq import Seq
from Bio import SeqIO
from Bio.SeqUtils import GC

records = list(SeqIO.parse("rosalind_gc.txt", "fasta"))

for seq_record in SeqIO.parse("rosalind_gc.txt", "fasta"):
	G_count = seq_record.seq.count('G')
	C_count = seq_record.seq.count('C')
	length = len(seq_record)

	gc_percentage = float(G_count + C_count) / length*100
print (records[1].id)
print(gc_percentage)

