#! /usr/bin/env Python3
#Tom Brekke
#22-03-2017
# Bioinformatics surgery: calculate GC content and return entry with highest % GC


#takes a single input at command line which is a fasta file 
#it does not store anything in memory and so works with very large fasta files. 


import sys

def calc_gc(header, seq):
	length=len(seq)
	A=seq.count("A")
	a=seq.count("a")
	C=seq.count("C")
	c=seq.count("c")
	G=seq.count("G")
	g=seq.count("g")
	T=seq.count("T")
	t=seq.count("t")
	#print(A, a, C, c, G, g, T, t, length, sep="\n\n")
	if not A+C+G+T+a+c+g+t == length:
		print("warning - a sequence has something other than ACTG in it:", header, file=sys.stderr)
	return((C+G+c+g)/(A+C+T+G+a+c+t+g)*100)


max_gc=0
'''
seq='caggggtgggttctact'

print(calc_gc('myseq', seq))
'''

with open(sys.argv[1], 'r') as FASTA:
	for line in FASTA:
		if line.startswith(">"):
			try: 
				header
			#	print(header, calc_gc(header, seq))
				if calc_gc(header, seq) > max_gc:
					output=[header,calc_gc(header, seq)]
				else:
					max_gc = calc_gc(header, seq)	
				header=line.strip("\n")
				seq=''			
			except:
				header=line.strip("\n")
				seq=''
		else:
			seq=seq+line.strip("\n")

if calc_gc(header, seq) > max_gc:
	output=[header,calc_gc(header, seq)]


print(output[0], output[1],sep="	", end="\n")


