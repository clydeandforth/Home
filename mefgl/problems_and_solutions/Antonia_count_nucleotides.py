
#open file and read text, print contents
my_file = open("rosalind_dna.txt")
dna_string = my_file.read()
print(dna_string)

#count characters
A_count = dna_string.count('A')
C_count = dna_string.count('C')
G_count = dna_string.count('G')
T_count = dna_string.count('T')

#print counts
print(str(A_count) + " " + str(C_count) + " " + str(G_count) + " " + str(T_count))

#print counts with headers
print("A: " + str(A_count))
print("C: " + str(C_count))
print("G: " + str(G_count))
print("T: " + str(T_count))