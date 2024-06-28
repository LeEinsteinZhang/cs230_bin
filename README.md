# Comprehensive Guide to MIPS Assembly Tools and Scripts

This document serves as a complete guide for various scripts used in assembling, testing, and debugging MIPS assembly programs. Each section is dedicated to a specific script, detailing its purpose, usage, and troubleshooting tips.

To use these scripts, please add this folder to the PATH.

## Table of Contents

1. [ASm Manual](#asm-manual)
2. [cs30t Test Script Manual](#cs230t-test-script-manual)
3. [noargs Script Manual](#noargs-script-manual)
4. [twoints Script Manual](#twoints-script-manual)

# asm Manual

## Introduction

This script is used to assemble an input file (\`infile\`) and save the output to a specified output file (\`outfile\`). If the output file name is not specified, it defaults to the input file name with a \`.mips\` extension.

## Usage

\`\`\`bash
asm infile [outfile]
\`\`\`

### Parameters

- \`infile\`: Required. The input file to be assembled.
- \`outfile\`: Optional. The name of the output file. If not specified, the output file name will be the same as the input file name but with a \`.mips\` extension.

### Examples

1. Using a specified input and output file:

    \`\`\`bash
    asm example.asm output.mips
    \`\`\`

2. Specifying only the input file; the output file name will be automatically generated:

    \`\`\`bash
    asm example.asm
    \`\`\`

    In this case, the output file name will be \`example.mips\`.

## Notes

- Ensure that the assembly tool exists at \`/u/cs230/pub/binasm\` and you have permission to execute it (course account/server)
- The input file must be a valid assembly code file.
- If the output file already exists, it will be overwritten.

## Troubleshooting

1. **What if the script says it cannot find \`/u/cs230/pub/binasm\`?**

    Please check if the path is correct and if you have access to it. If the tool is located elsewhere, update the path in the script accordingly.

2. **What if the assembly fails?**

    Please check if the input file has the correct syntax and ensure it meets the assembly tool's requirements.

By following the above steps, you can easily use the script to convert assembly code to a \`.mips\` file. If you encounter any issues, refer to the Troubleshooting section or contact the administrator.



# cs230t Test Script Manual

## Introduction
This script automates the testing of MIPS assembly programs, supporting different frontends. It executes all `.in` test files in the specified directory and compares the output against expected results.

## Usage
```bash
cs230t [frontend] [mips_file]
```

- `[frontend]`: Specify the frontend to use. Options are `array`， `arraydump` or `noargs`.
- `[mips_file]`: Path to the MIPS file to be tested.

## Script Output
The script creates a results directory for each test containing output, error, and diff files. If the test passes, the results directory is deleted. The test outcomes are displayed on the console.

## Testing Process
1. The script reads all `.in` test files in the `tests/` subdirectory.
2. Based on the frontend type, processes the input files and redirects output to result files.
3. Uses the `diff` command to compare actual output to expected output. If there are differences, a diff file is generated and failures are reported on the console.

## Important Notes
Ensure all test files and expected results are correctly formatted and located in the proper directories.

## Example
Suppose you have a MIPS assembly file named `test.mips`, and you want to use the `array` frontend, you would invoke the script as follows:

```bash
cs230t array test.mips
```

This command will execute all `.in` files in the `tests/` directory and output the results to the console.



# noargs Script Manual

## Introduction
This Bash script processes an input file and formats and outputs the values of registers in MIPS assembly language based on the provided option (decimal or binary display). The script uses different command-line options (`-d` or `-b`) to determine the output format. If no options are specified, it defaults to printing raw output.

## Detailed Explanation

1. **Parameter Check**:
   - The script checks if at least one parameter is passed. If not, it prints usage information and exits.

2. **Option Handling**:
   - `-d`: Sets the output to decimal format.
   - `-b`: Sets the output to binary format.
   - If neither `-d` nor `-b` is specified, no special formatting is applied to the output.

3. **File Handling**:
   - The input file is specified by the `infile` variable.
   - Depending on the earlier option setting, different processing methods are used to display the values of the registers.

4. **Output Processing**:
   - If decimal output is set, the script uses `gawk` to process the `noargs` command's output, converting hexadecimal to decimal, and formats the output.
   - If binary output is set, it uses `awk` and a custom function `to_binary` to convert the values to binary representation and formats the output.
   - If no special format option is specified, it simply prints the raw output.

This script is useful for viewing the status of registers in MIPS assembly language testing and debugging, helping developers quickly understand the execution state of the code. If you need further explanation or assistance with any features, please feel free to ask!



# twoints Script Manual

## Introduction
This Bash script processes an input file along with user inputs to format and output the values of registers in MIPS assembly language based on the provided option (decimal or binary display). It supports different command-line options (`-d` or `-b`) for output formatting.

## Detailed Explanation

1. **Parameter Check**:
   - The script checks if at least one parameter is passed. If not, it prints usage information and exits.

2. **Option Handling**:
   - `-d`: Sets the output to decimal format.
   - `-b`: Sets the output to binary format.
   - If neither `-d` nor `-b` is specified, no special formatting is applied to the output.

3. **User Input**:
   - The script prompts the user to enter values for two registers, which are used in the subsequent command invocations.

4. **File Handling**:
   - The input file is specified by the `infile` variable.
   - The script dynamically passes user-inputted values to the called program.

5. **Output Processing**:
   - For decimal output, the script uses `gawk` to process and convert hexadecimal values to decimal, formatting them accordingly.
   - For binary output, it uses `awk` with a custom function `to_binary` to convert hexadecimal values to binary representation and formats the output.
   - If no special format option is specified, it prints the raw output.

## Notes
- Ensure that the command `twoints` is capable of receiving and processing the two register values passed at EOF.

This script is useful for viewing the status of registers in MIPS assembly language testing and debugging, helping developers quickly understand the execution state of the code. If you need further explanation or assistance with any features, please feel free to ask!
