// Write a SystemVerilog module for a 4-bit synchronous up/down counter with enable, asynchronous reset,
// and synchronous load, and a testbench to verify your counter.  Show simulation results in your favorite simulator.
// Also provide a paragraph describing the most interesting hardware or software project that you have completed. 
//
//
//
module counter (
input logic en, //enable
input rst,//async rst
input ld,//sync load
input clk,//clk
input dir,//sets direction 1 for up, 0 for down
input [3:0] ld_val,//load value
reg [3:0] count
);


always_ff @( posedge clk or posedge rst) begin 
    if(en) begin
        if (rst) 
            count <= 4'b0000;
        else if (ld ) 
            //load in value here
            count <= ld_val;
        
        else if (dir) 
            count <= count + 1'd1;
                      
        else if (~dir)
            count <= count - 1'd1;
        
    end

end
    
    

endmodule
