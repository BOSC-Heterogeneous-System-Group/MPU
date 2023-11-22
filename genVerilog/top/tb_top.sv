`timescale 1ns / 1ns

module tb_top();

parameter IN_WIDTH           = 4;
parameter OUT_WIDTH          = 16;
parameter SA_ROWS            = 2;
parameter SA_COLS            = 2;

logic                          clk                                   ;
logic                          rst                                   ;
logic                          valid_in                              ;
logic                          ready_out                             ;
logic signed [ IN_WIDTH-1:0]   in_a        [0:SA_ROWS-1]             ;
logic signed [ IN_WIDTH-1:0]   in_b        [0:SA_COLS-1]             ;
logic signed [OUT_WIDTH-1:0]   in_c        [0:SA_COLS-1]             ; 
logic                          valid_out                             ;
logic                          ready_in                              ;
logic signed [ IN_WIDTH-1:0]   a_ref       [0:SA_ROWS-1][0:SA_COLS-1];
logic signed [ IN_WIDTH-1:0]   b_ref       [0:SA_ROWS-1][0:SA_COLS-1];
logic signed [OUT_WIDTH-1:0]   c_ref       [0:SA_ROWS-1][0:SA_COLS-1];
logic signed [OUT_WIDTH-1:0]   out_c       [0:SA_COLS-1]             ;

integer cnt_0;
integer cnt_1;
integer err;
integer num;
integer write;

top u_top(
    .clock                      (clk       ),
    .reset                      (rst       ),
    .io_tpuIO_in_valid          (valid_in  ),
    .io_tpuIO_in_ready          (ready_out ),
    .io_tpuIO_in_bits_in_a_0    (in_a[0]   ),
    .io_tpuIO_in_bits_in_a_1    (in_a[1]   ),
    .io_tpuIO_in_bits_in_b_0    (in_b[0]   ),
    .io_tpuIO_in_bits_in_b_1    (in_b[1]   ),
    .io_tpuIO_in_bits_in_c_0    (in_c[0]   ),
    .io_tpuIO_in_bits_in_c_1    (in_c[1]   ),
    .io_tpuIO_out_valid         (valid_out ),
    .io_tpuIO_out_ready         (ready_in  ),
    .io_tpuIO_out_bits_out_c_0  (out_c[0]  ),
    .io_tpuIO_out_bits_out_c_1  (out_c[1]  )
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
    ready_in = 1'b0;
    err = 0;
    cnt_0 = SA_ROWS-1;
    cnt_1 = 0;
    num = 0;
    write = 0;
    
    #(clk_period*5);
    @(negedge clk); rst = 1'b0;

    #(clk_period*5);

    // @(negedge clk)
    // a_ref[0][0] = in_a[0];
    // a_ref[1][0] = in_a[1];
    // b_ref[0][0] = in_b[0];
    // b_ref[0][1] = in_b[1];
    
    // @(negedge clk)
    // a_ref[0][1] = in_a[0];
    // a_ref[1][1] = in_a[1];
    // b_ref[1][0] = in_b[0];
    // b_ref[1][1] = in_b[1];
    // for (int i = 0; i < SA_COLS; i++) begin
    //     for (int j = 0; j < SA_ROWS; j++) begin
    //         $display("a_ref[%d][%d]:%d, b_ref[%d][%d]:%d", i, j, a_ref[i][j], i, j, b_ref[i][j]);
    //     end
    // end
   

    // for(int i = 0; i < SA_ROWS; i++) begin
    //     for (int j = 0; j < SA_COLS; j++) begin
    //         c_ref[i][j] = 0;
    //         for(int k = 0; k < SA_COLS; k++) begin
    //             c_ref[i][j] += {{(OUT_WIDTH-IN_WIDTH){a_ref[i][k][IN_WIDTH-1]}},a_ref[i][k]} * 
    //                            {{(OUT_WIDTH-IN_WIDTH){b_ref[k][j][IN_WIDTH-1]}},b_ref[k][j]};
    //         end
    //     end
    // end

    // for(int i = 0; i < SA_ROWS; i++) begin
    //     for (int j = 0; j < SA_COLS; j++) begin
    //         $display("a_ref[%d][%d]:%d, b_ref[%d][%d]:%d", i, j, a_ref[i][j], i, j, b_ref[i][j]);
    //         $display("c_ref[%d][%d]:%d", i, j, c_ref[i][j]);
    //     end
    // end
end

initial begin
    $display("*********** Systolic-Array-Test *****************");
    #(clk_period*10)
    while(num < 100) begin
        for (int i = 0; i < SA_COLS; i++) begin
            @(negedge clk)
            for (int j = 0; j < SA_ROWS; j++) begin
                if(ready_out) begin
                    in_a[j] = $random;
                    in_b[j] = $random;
                    in_c[j] = 1'b0;
                    valid_in = $random;
                end
            end
        end
        ready_in = $random;
        num ++;
    end
    // @(negedge clk)
    // in_a[0]  = $random;
    // in_a[1]  = $random;
    // in_b[0]  = $random;
    // in_b[1]  = $random;
    // in_c[0]  = 0;
    // valid_in = 1'b1;

    // @(negedge clk)
    // in_a[0]  = $random;
    // in_a[1]  = $random;
    // in_b[0]  = $random;
    // in_b[1]  = $random;
    // in_c[0]  = 0;
    // valid_in = 1'b1;

    @(negedge clk)
    valid_in = 1'b0;

    
    #(clk_period*100); 
    if(err == 0)
        $display("******************PASSED*************************");
    else
        $display("*******************ERROR*************************");    

    
    $finish;
end

initial begin
    #(clk_period*10);
    while(1) begin
        @(posedge clk) begin
            if (valid_in && ready_out) begin        
                for (int j = 0; j < SA_ROWS; j++) begin                  
                    a_ref[j][cnt_1] = in_a[j];
                    b_ref[cnt_1][j] = in_b[j];
                    cnt_1 <= cnt_1 + 1;
                    if (cnt_1 == SA_ROWS-1) begin
                        cnt_1 <= 0;
                    end
                end
            end
        end

        for(int i = 0; i < SA_ROWS; i++) begin
            for (int j = 0; j < SA_COLS; j++) begin
                c_ref[i][j] = 0;
                for(int k = 0; k < SA_COLS; k++) begin
                    c_ref[i][j] += {{(OUT_WIDTH-IN_WIDTH){a_ref[i][k][IN_WIDTH-1]}},a_ref[i][k]} * 
                               {{(OUT_WIDTH-IN_WIDTH){b_ref[k][j][IN_WIDTH-1]}},b_ref[k][j]};
                end
            end
        end
        
        // for(int i = 0; i < SA_ROWS; i++) begin
        //     for (int j = 0; j < SA_COLS; j++) begin
        //         $display("a_ref[%d][%d]:%d, b_ref[%d][%d]:%d, c_ref[%d][%d]:%d", i, j, a_ref[i][j], i, j, b_ref[i][j], i, j, c_ref[i][j]);
        //     end
        // end
        num ++;
    end
end

initial begin 
     while(1) begin
        @(posedge clk) begin
            if(valid_out && ready_in) begin
                cnt_0 <= cnt_0 - 1;
                if (cnt_0 == 0) begin
                    cnt_0 <= SA_ROWS - 1;
                end
                if((out_c[0] != c_ref[cnt_0][0]) || (out_c[1] != c_ref[cnt_0][1])) begin
                    $display("error! out_c[0]:%d, c_ref[%d][0]:%d", out_c[0], cnt_0, c_ref[cnt_0][0]);
                    $display("error! out_c[1]:%d, c_ref[%d][1]:%d", out_c[1], cnt_0, c_ref[cnt_0][1]);
                    err += 1;
                end else begin
                    $display("pass ! out_c[0]:%d, c_ref[%d][0]:%d", out_c[0], cnt_0, c_ref[cnt_0][0]);
                    $display("pass ! out_c[1]:%d, c_ref[%d][1]:%d", out_c[1], cnt_0, c_ref[cnt_0][1]);
                end
            end
        end
    end
end



endmodule
