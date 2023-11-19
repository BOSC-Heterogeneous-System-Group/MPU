`timescale 1ns / 1ns

module tb_top();

parameter IN_WIDTH           = 4;
parameter OUT_WIDTH          = 16;
parameter SA_ROWS            = 2;
parameter SA_COLS            = 2;

logic                   clk                                   ;
logic                   rst                                   ;
logic                   valid_in                              ;
logic                   ready_out                             ;
logic [ IN_WIDTH-1:0]   in_a        [0:SA_ROWS-1]             ;
logic [ IN_WIDTH-1:0]   in_b        [0:SA_COLS-1]             ;
logic [OUT_WIDTH-1:0]   in_c        [0:SA_COLS-1]             ; 
logic                   valid_out                             ;
logic                   ready_in                              ;
logic [ IN_WIDTH-1:0]   a_ref       [0:SA_ROWS-1][0:SA_COLS-1];
logic [ IN_WIDTH-1:0]   b_ref       [0:SA_COLS-1][0:SA_COLS-1];
logic [OUT_WIDTH-1:0]   c_ref       [0:SA_COLS-1][0:SA_COLS-1];
logic [OUT_WIDTH-1:0]   out_c       [0:SA_COLS-1]             ;

integer cnt;
integer err;

top u_top(
    .clock        (clk       ),
    .reset        (rst       ),
    .io_in_valid  (valid_in  ),
    .io_out_ready (ready_out ),
    .io_in_a_0    (in_a[0]   ),
    .io_in_a_1    (in_a[1]   ),
    .io_in_b_0    (in_b[0]   ),
    .io_in_b_1    (in_b[1]   ),
    .io_in_c_0    (in_c[0]   ),
    .io_in_c_1    (in_c[1]   ),
    .io_out_valid (valid_out ),
    .io_in_ready  (ready_in  ),
    .io_out_c_0   (out_c[0]  ),
    .io_out_c_1   (out_c[1]  )
);

initial begin
    $dumpfile("tb_top.vcd");
    $dumpvars(0, tb_top);
end

parameter clk_period = 10;

always begin
    #(clk_period/2) clk = ~clk;
end

initial begin
    clk = 1'b1;
    rst = 1'b1;
    valid_in = 1'b0;
    ready_in = 1'b1;
    a_ref[0][0] = 1;
    a_ref[0][1] = 2;
    a_ref[1][0] = 3;
    a_ref[1][1] = 4;
    b_ref[0][0] = 1;
    b_ref[0][1] = 0;
    b_ref[1][0] = 0;
    b_ref[1][1] = 1;
    err = 0;
    cnt = SA_ROWS-1;

    for(int i = 0; i < SA_ROWS; i++) begin
        for (int j = 0; j < SA_COLS; j++) begin
            c_ref[i][j] = 0;
            for(int k = 0; k < SA_COLS; k++) begin
                c_ref[i][j] += a_ref[i][k] * b_ref[k][j];
            end
        end
    end

    // for(int i = 0; i < SA_ROWS; i++) begin
    //     for (int j = 0; j < SA_COLS; j++) begin
    //         for(int k = 0; k < SA_COLS; k++) begin
    //             $display("c_ref[%d][%d]:%d", i, j, c_ref[i][j]);
    //         end
    //     end
    // end

    #(clk_period*5);
    @(negedge clk); rst = 1'b0;

    while(1) begin
        @(posedge clk) begin
            if(valid_out && ready_in) begin
                cnt <= cnt - 1;
                if((out_c[0] != c_ref[cnt][0]) || (out_c[1] != c_ref[cnt][1])) begin
                    $display("error! out_c[0]:%d, c_ref[%d][0]:%d", out_c[0], cnt, c_ref[cnt][0]);
                    err += 1;
                 // $display("out_c[0]:%d, c_ref[%d][0]:%d", out_c[0], cnt, c_ref[cnt][0]);
                 // $display("out_c[1]:%d, c_ref[%d][1]:%d", out_c[1], cnt, c_ref[cnt][1]);
                end
            end
        end
    end
end

initial begin
    $display("*********** Systolic-Array-Test *****************");
    #(clk_period*10)
    
    @(negedge clk)
    in_a[0]  = 1;
    in_a[1]  = 3;
    in_b[0]  = 1;
    in_b[1]  = 0;
    in_c[0]  = 0;
    valid_in = 1'b1;

    @(negedge clk)
    in_a[0]  = 2;
    in_a[1]  = 4;
    in_b[0]  = 0;
    in_b[1]  = 1;
    in_c[0]  = 0;
    valid_in = 1'b1;

    @(negedge clk)
    valid_in = 1'b0;

    
    #(clk_period*20); 
    if(err == 0)
        $display("******************PASSED*************************");
    else
        $display("*******************ERROR*************************");    

    
    $finish;
end

endmodule
