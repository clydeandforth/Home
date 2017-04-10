## First, make sure input file contains only 2 lines and that the longest line comes first:
## Count number of lines in file.
## Only continue with the rest of the script if there are exactly 2 lines.
## IMPORTANT NOTE: Spacing is important in this 'if statement' - all spaces here are needed.
## Then, for each line, print length of entire line followed by space then line contents.
## Sort the lines in reverse numerical order
## Cut the 2nd column (to the end of the line) from each line, defining columns as text separated by a space character

NUMOFLINES=$(wc -l < "task6_data.txt") 
if [ $NUMOFLINES = "2" ]; then
    awk '{ print length($0) " " $0; }' task6_data.txt | \
    sort -r -n | \
    cut -d ' ' -f 2- | \

## Run the R script that outputs 1 line per match in this format: <result_no> <start_pos> <end_pos>

    Rscript Ian_Task6.R | \

## Extract from R script output all lines except the header.
## Translate spaces into tabs
## Cut the 2nd column (Start coord) from each line
## Translate new line characters to spaces to get results all on one line
## Print to file

    grep -v 'start' | \
    tr ' ' '    ' | \
    cut -f2 | \
    tr '\n' ' ' \
    > Ian_Task6_results.txt;
fi
