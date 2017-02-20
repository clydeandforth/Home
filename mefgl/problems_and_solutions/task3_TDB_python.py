#!/usr/bin/env Python3

#here's the subroutine to translate DNA into RNA:
def translate(DNA): 					# here is a definition that takes in a string of DNA, then outputs a string on RNA
	RNA=DNA.replace("T", "U")			#here is the step that replaces the Ts with Us
	return (RNA)						#this returns the RNA


#this gets the data into Python3:
with open("Task3_data.txt", "r") as DNAFILE:   	#this opens a DNA file
	DNA=DNAFILE.read()							#this reads the data into a variable called DNA
	DNA=DNA.strip("\n")							#this removes the trailing newline (if there is one)
												#the with call automatically closes the FILEHANDLE so you don't need to do it explicitly


#this is where I call the definition to translate the DNA, and print out the final bit:
RNA=translate(DNA)
print(RNA)


	



