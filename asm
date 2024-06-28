#!/bin/bash

# Check if infile is provided
if [ -z "$1" ]; then
  echo "Usage: $0 infile [outfile]"
  exit 1
fi

infile="$1"

# Determine outfile
if [ -z "$2" ]; then
  outfile="${infile%.*}.mips"
else
  outfile="$2"
fi

# Run the command
/u/cs230/pub/binasm < "$infile" > "$outfile"

# Check if the command was successful
if [ $? -eq 0 ]; then
  echo "Successfully assemble $infile to $outfile"
else
  echo "Error processing $infile"
fi

