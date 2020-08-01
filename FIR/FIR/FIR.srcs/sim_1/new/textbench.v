`timescale 1ms / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/07/28 09:59:49
// Design Name: 
// Module Name: textbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module textbench();
    reg CLK;
    reg [7:0] FIR_IN;
    reg RSTn;
    reg [7:0] mem[1:4096];
    wire [15:0] FIR_OUT;
    reg [12:0] i;
    
    FIR i1(
        .CLK(CLK),
        .FIR_IN(FIR_IN),
        .FIR_OUT(FIR_OUT),
        .RSTn(RSTn)
    );
    initial
        begin
            $readmemh("E:/Vivado/2018.3/FIR/mem.txt",mem);//将带滤波信号读入
            RSTn=0;
            CLK=0;
            #50;RSTn=1;
            #50000;
            $stop;
        end
    initial
        forever
            #50 CLK=~CLK;
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            FIR_IN <= 8'b0;
        else
            FIR_IN <= mem[i];
    always@(posedge CLK or negedge RSTn)
        if(!RSTn)
            i<=12'd0;
        else
            i<=i+1'd1;
endmodule
