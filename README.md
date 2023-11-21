# RV-Tensor
## get started
for WSL2:  

`make bsp`  

`make idea`  

then open with IDEA(Linux version)  
choose JDK version 11
## simulation with chiseltest && generate verilog
click the green arrow to start simulation and generate verilog

enter "test_run_dir" directory and find your sim project

`gtkwave your_design.vcd`
## simulation with iverilog
the verilog code is in genVerilog directory

`make compile` to start compile

`make run`     to start run sim

`make sim`     to run the above program and open waveform
## simulation with cocotb
for WSL2:

`pip install cocotb`

`pip install cocotb-axi`

enter "pySim" directory and find your sim project

`make`

`gtkwave your_design.fst`



