testbentch_module = tb_top
rtl_module      = top
rtl_file		= ./genVerilog/$(rtl_module)/*.v
testbentch_file = ./genVerilog/$(rtl_module)/$(testbentch_module).sv
vvp_file 		= ./genVerilog/$(rtl_module)/$(testbentch_module).vvp
vcd_file		= ./genVerilog/$(rtl_module)/$(testbentch_module).vcd
gtkw_file		= ./genVerilog/$(rtl_module)/$(testbentch_module).gtkw

bsp:
	mill -i mill.bsp.BSP/install

idea:
	mill -i mill.scalalib.GenIdea/idea

compile:
	iverilog -g2012 -o $(vvp_file) $(rtl_file) $(testbentch_file)

run:
	iverilog -g2012 -o $(vvp_file) $(rtl_file) $(testbentch_file)
	cd genVerilog/$(rtl_module) && vvp -n $(testbentch_module).vvp -lxt2

sim:
	iverilog -g2012 -o $(vvp_file) $(rtl_file) $(testbentch_file)
	cd genVerilog/$(rtl_module) && vvp -n $(testbentch_module).vvp -lxt2

    ifneq "$(wildcard $(gtkw_file))" ""
	    gtkwave $(gtkw_file)
    else
	    gtkwave $(vcd_file)
    endif

clean:
	rm -rf genVerilog test_run_dir

clean_mill:
	rm -rf out

clean_all: clean clean_mill

.PHONY: bsp idea clean clean_mill
