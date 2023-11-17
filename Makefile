bsp:
	mill -i mill.bsp.BSP/install

idea:
	mill -i mill.scalalib.GenIdea/idea

clean:
	rm -rf genVerilog test_run_dir

clean_mill:
	rm -rf out

clean_all: clean clean_mill

.PHONY: bsp idea clean clean_mill
