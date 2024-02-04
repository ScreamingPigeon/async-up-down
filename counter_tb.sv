`timescale 1ns/1ps
module counter_tb ();
    logic clk, rst, ld, dir, en ;
    logic [3:0] ld_val;
    logic [3:0] wout;
    
    //tasks
    
    
    
    //instantiating design under test
    counter COUNTER(
         .clk(clk), .rst(rst), .ld(ld), .ld_val(ld_val), .dir(dir), .en(en), .count(wout)
    );


    //setting clock
    always #10 clk = ~clk;


    initial begin
        //Dump waveforms
        $dumpfile("dump.vcd");
        clk <=0;
        rst <= 1;
        en <= 1;
        dir <=1;
        ld  <=0;
        
        #10 
        rst<=0;
        
                     
    end


endmodule
