`timescale 1ns/1ps
module counter_tb ();
    logic clk, rst, ld, dir, en ;
    logic [3:0] ld_val;
    logic [3:0] wout;
    
    //tasks
    task init();
        clk <=0;
        rst <=1;
        en <= 1;
        dir <=1;
        ld <=0;
        $display("Initializing module");
    endtask


    task stim1();
        $display("Beginning forward counting");
        rst<=0;
    endtask
   
    task stim2();
        $display("Testing hold");
        en<=0;
    endtask

    task stim3();
        $display("Beginning reverse counting");
        en<=1;
        dir<=0;
    endtask

    task loadTest1();
        $display("Checking load values");
        ld<=1;
        ld_val <=4'b0101;
        #10 ld <=0;//turn off after half clock cycle
    endtask

    //instantiating design under test
    counter COUNTER(
         .clk(clk), .rst(rst), .ld(ld), .ld_val(ld_val), .dir(dir), .en(en), .count(wout)
    );


    //setting clock
    //
    always #10 clk = ~clk;


    initial begin
        //Dump waveforms
        $dumpfile("dump.vcd");
        init();

        #10 stim1();
        #90 stim2();
        #150 stim3();
        #200 loadTest1();

                     
    end


endmodule
