`timescale 1ns/1ps
module counter_tb ();
    register clk, rst, ld, [3:0]ld_val, dir, en ;
    logic [3:0] test;
    wire [3:0] wout;
    
    //instantiating design under test

    counter COUNTER(
         .clk(clk), .rst(rst), .ld(ld), .ld_val(ld_val), .dir(dir), .en(en), .out(wout)
    );


    //setting clock
    always #5 clk = ~clk;


    initial begin
        //Dump waveforms
        $dumpfile("dump.vcd")
        clk = 0;
        ld_val = 4'b0;
        en = 1'b1;
        dir = 1'1;
        rst = 1'b1;
        #10
        rst = 1'b0;
        test = 3'b0;
    end

    initial begin
        always_ff (@ posedge clk)
        begin
            if (~rst)
            begin
                test <= test + 4'b1;
                $display("Test:%02x Wout:%02x", test, wout);
            end
        end
    end

endmodule
