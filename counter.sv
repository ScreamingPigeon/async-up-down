// Write a SystemVerilog module for a 4-bit synchronous up/down counter with enable, asynchronous reset,
// and synchronous load, and a testbench to verify your counter.  Show simulation results in your favorite simulator.
// Also provide a paragraph describing the most interesting hardware or software project that you have completed. 
//
//
//
module counter (
input en; //enable
input rst;//async rst
input ld;//sync load
input clk;//clk
input dir;//sets direction 1 for up, 0 for down
input [3:0] ld_val ;//load value
output [3:0] count;
);
    if rst begin
        count = 4b'0000;
    end
    else begin
        if (en) begin
            always_ff @( clk posedge ) begin 
                    if (ld )
                        //load in value here
                        count <= ld_val;
                    else if (dir) 
                        count <= count + 1'd1;
                    else if (~dir)
                        count <= count - 1'd1;

                end
        end
        count <= count;
        
        end
    
    

endmodule
