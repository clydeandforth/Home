#!/bin/bash
DNA=$(cat Task3_data.txt)			#this uses only bash and does a global search and replace for T with U
RNA=${DNA//T/U}						#using a single "/" rather than the double "//" will only match the first instance
echo $RNA

