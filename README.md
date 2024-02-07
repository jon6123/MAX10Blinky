# MAX10Blinky
a simple VHDL Hello World blinky project for Intel® MAX® 10 - 10M08 Evaluation Kit

This project uses Quartus prime lite install to compile and flash a blinky project to Intel® MAX® 10 - 10M08 Evaluation Kit

Eval board info (manual/schematic available):
https://www.intel.com/content/www/us/en/products/details/fpga/development-kits/max/10m08-evaluation-kit.html

Crucially this project can be edited and compiled/flashed all from text editor and command line (windows). A 'built.bat' is provided with options to compile/flash/program-cfg (-c/-f/-p)

_[requires PATH environment variable C:\intelFPGA_lite\21.1\quartus\bin64 or similar added]_



the logic takes user input from SW3 and outputs to LED D1 with the following logic:

  ![image](https://github.com/jon6123/MAX10Blinky/assets/18346112/f4783a6a-7393-4db1-a1e5-274318411f31)

in parallel, the 50MHZ clock input is reduced to 10HZ and output to LED D5



this is done through 3 separate sub-level VHDL files ported together through a top level VHDL file (portBlinky.vhd)



- more VHDL files can be added in the .qsf file

- more FPGA pins can be ported in the .qsf file



the project can be opened in Quartus Prime IDE if desired

Happy Blinking!


