cat Task2_sequences.fasta | awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}' | perl Task2_Ian.pl
