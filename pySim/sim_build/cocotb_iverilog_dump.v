module cocotb_iverilog_dump();
initial begin
    $dumpfile("sim_build/axis_matmul2x2.fst");
    $dumpvars(0, axis_matmul2x2);
end
endmodule
